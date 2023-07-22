import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.paypal.base.rest.PayPalRESTException;
import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;
import com.paypal.http.HttpResponse;
import com.paypal.http.exceptions.HttpException;
import com.paypal.orders.AmountBreakdown;
import com.paypal.orders.AmountWithBreakdown;
import com.paypal.orders.Order;
import com.paypal.orders.OrderRequest;
import com.paypal.orders.OrdersCaptureRequest;
import com.paypal.orders.OrdersCreateRequest;
import com.paypal.orders.PurchaseUnitRequest;
import com.paypal.orders.Money;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.json.JSONObject;

public class PaymentServlet extends HttpServlet {

    private static final String CLIENT_ID = "ASyjQ7JZyGsLCkiFplxIboO7IfzuCLbNtQcySyFKSei1UjB8R7Umsjd_Mc-3qWcSILEcMaE4Y_TlhO5p";
    private static final String CLIENT_SECRET = "EChteRt1I1WKT80TsdDKI4qw4-SdHNuwAjyS2t20S35JbKwnxxhgruPtdG_Q03urnG3TtNsEDSz0SCTM";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        

        Cookie[] cookies = request.getCookies();
    String tempEmail = null;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("tempemail")) {
                // Cookie with the name "tempemail" found
                // Decode the cookie value
                try {
                    tempEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
        
        
        try {
            PayPalEnvironment environment = new PayPalEnvironment.Sandbox(CLIENT_ID, CLIENT_SECRET);
            PayPalHttpClient client = new PayPalHttpClient(environment);

            if ("create_order".equals(action)) {
                Order order = createOrder(client);
                String orderID = order.id();
                response.getWriter().write(orderID);
            } else if ("capture_order".equals(action)) {
                String orderID = request.getParameter("orderID");
                String captureID = captureOrder(client, orderID);
                storeCaptureDetails(orderID,captureID,tempEmail);
                response.getWriter().write("success");
            } else {
                response.getWriter().write("Invalid action.");
            }
        } catch (HttpException e) {
            e.printStackTrace();
            response.getWriter().write("Payment processing error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Payment processing error: " + e.getMessage());
        }
    }

    private Order createOrder(PayPalHttpClient client) throws IOException, PayPalRESTException {
        OrdersCreateRequest request = new OrdersCreateRequest();
        request.prefer("return=representation");

        OrderRequest orderRequest = new OrderRequest();
        orderRequest.checkoutPaymentIntent("CAPTURE");

        List<PurchaseUnitRequest> purchaseUnits = new ArrayList<>();
        PurchaseUnitRequest purchaseUnit = new PurchaseUnitRequest();
        purchaseUnit.amountWithBreakdown(getAmountWithBreakdown());
        purchaseUnits.add(purchaseUnit);
        orderRequest.purchaseUnits(purchaseUnits);

        request.requestBody(orderRequest);

        HttpResponse<Order> response = client.execute(request);
        Order order = response.result();

        return order;
    }

    private String captureOrder(PayPalHttpClient client, String orderID) throws IOException, PayPalRESTException {
        OrdersCaptureRequest request = new OrdersCaptureRequest(orderID);
        request.requestBody(new OrderRequest());

        HttpResponse<Order> response = client.execute(request);
        Order capturedOrder = response.result();

        String captureID = capturedOrder.purchaseUnits().get(0).payments().captures().get(0).id();
        String captureStatus = capturedOrder.purchaseUnits().get(0).payments().captures().get(0).status();

        
        return captureID;
    }

  private void storeCaptureDetails(String orderID, String captureID, String email) {
    try {
        // Connect to your database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

        // Prepare the SQL statement for insert into capture_details
        String sqlInsert = "INSERT INTO capture_details (order_id, capture_id, email) VALUES (?, ?, ?)";
        PreparedStatement pstmtInsert = con.prepareStatement(sqlInsert);
        pstmtInsert.setString(1, orderID);
        pstmtInsert.setString(2, captureID);
        pstmtInsert.setString(3, email);
        // Execute the insert SQL statement for capture_details
        pstmtInsert.executeUpdate();
        pstmtInsert.close();

        // Prepare the SQL statement for update in admin_details
        String sqlUpdate = "UPDATE admin_details SET subscription='fourdollars', start_date=?, end_date=? WHERE email=?";
        PreparedStatement pstmtUpdate = con.prepareStatement(sqlUpdate);

        String startDate = getCurrentDate();
        String endDate = getEndDateForOneMonth();

        pstmtUpdate.setString(1, startDate);
        pstmtUpdate.setString(2, endDate);
        pstmtUpdate.setString(3, email);

        // Execute the update SQL statement for admin_details
        pstmtUpdate.executeUpdate();
        pstmtUpdate.close();

        // Close the database connection
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


    private AmountWithBreakdown getAmountWithBreakdown() {
        AmountWithBreakdown amountWithBreakdown = new AmountWithBreakdown();
        amountWithBreakdown.currencyCode("USD");
        amountWithBreakdown.value("4.00");

        AmountBreakdown amountBreakdown = new AmountBreakdown();
        amountBreakdown.itemTotal(new Money().currencyCode("USD").value("4.00"));

        amountWithBreakdown.amountBreakdown(amountBreakdown);

        return amountWithBreakdown;
    }
    private String getCurrentDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.now().format(formatter);
    }

    private String getEndDateForOneMonth() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.now().plusMonths(1).format(formatter);
    }
}

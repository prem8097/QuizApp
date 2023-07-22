import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/CheckSubscription")
public class CheckSubscription extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email"); // Assuming you pass the admin's username as a request parameter

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Replace "your_database_url", "your_database_username", and "your_database_password" with actual database details
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

            // Prepare the SQL query
            String query = "SELECT subscription, quiz_count FROM admin_details WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);

            // Execute the query
            ResultSet rs = stmt.executeQuery();
           //JSONObject jsonResponse = new JSONObject();
            if (rs.next()) {
                String subscription = rs.getString("subscription");
                int quizCount = rs.getInt("quiz_count");

                if ("free".equalsIgnoreCase(subscription) && quizCount <= 10) {
                    //jsonResponse.put("result", true);
                    response.setStatus(HttpServletResponse.SC_OK);
                } else if ("fourdollars".equalsIgnoreCase(subscription) && quizCount <= 30) {
                    //jsonResponse.put("result", true);
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    //jsonResponse.put("result", false);
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
            } else {
                
            }
               //out.print(jsonResponse.toString());
            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            //JSONObject errorResponse = new JSONObject();
        //errorResponse.put("error", "Error while processing the request.");
        //out.print(errorResponse.toString());
            
        }
    }
}

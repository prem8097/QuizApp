import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import at.favre.lib.crypto.bcrypt.BCrypt;

public class adminOTP_Code extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try {
            User user = (User) session.getAttribute("authcode");
            String code = request.getParameter("otp");
            if (code.equals(user.getCode())) {
                try {
                    response.setStatus(HttpServletResponse.SC_OK);
                    String startDate = getCurrentDate();
                    Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                    
                    String hashedPassword = hashPassword((String) session.getAttribute("password"));
                    PreparedStatement pstmt = con.prepareStatement("INSERT INTO admin_details (name, email, password,subscription,start_date,end_date) VALUES (?, ?, ?,?,?,?)");
                    pstmt.setString(1, (String) session.getAttribute("name"));
                    pstmt.setString(2, (String) session.getAttribute("email"));
                    pstmt.setString(3, hashedPassword);
                    pstmt.setString(4,"free");
                    pstmt.setString(5,startDate);
                    pstmt.setString(6,"9999-12-31");
                    pstmt.executeUpdate();
                } catch (ClassNotFoundException | SQLException e) {
                    
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                
                
                
            }
        } catch(Exception e)
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
    }
    protected String getCurrentDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDate.now().format(formatter);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    private String hashPassword(String plainPassword) {
        return BCrypt.withDefaults().hashToString(12, plainPassword.toCharArray());
    }
}

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
import at.favre.lib.crypto.bcrypt.BCrypt;


public class AdminEmailCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isValidEmail = checkEmailInDatabase(email,password);

        if (isValidEmail) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private boolean checkEmailInDatabase(String email,String password) {
        String jdbcUrl = "jdbc:mysql://localhost/quizit";
        String dbUsername = "root";
        String dbPassword = "prem8097";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*),password FROM admin_details WHERE email = ?  AND subscription <> 'fourdollars'");

            stmt.setString(1, email);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if(verifyPassword(password,rs.getString("password")) && count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
   private boolean verifyPassword(String plainPassword, String hashedPassword) {
        return BCrypt.verifyer().verify(plainPassword.toCharArray(), hashedPassword).verified;
    }
}

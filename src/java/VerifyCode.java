import at.favre.lib.crypto.bcrypt.BCrypt;
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
import org.json.JSONObject;

public class VerifyCode extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
response.setStatus(HttpServletResponse.SC_OK);
        try (PrintWriter out = response.getWriter()) {
            User user = (User) session.getAttribute("authcode");
            String code = request.getParameter("otp");
            if (code.equals(user.getCode())) {
                try {
                    response.setStatus(HttpServletResponse.SC_OK);
                    Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                    String hashedPassword = hashPassword((String) session.getAttribute("password"));
                    PreparedStatement pstmt = con.prepareStatement("insert into user_details values(?,?,?,?,?,?,?)");
                    pstmt.setString(1, (String) session.getAttribute("reg"));
                    pstmt.setString(2, (String) session.getAttribute("name"));
                    pstmt.setString(3, (String) session.getAttribute("phone"));
                    pstmt.setString(4, (String) session.getAttribute("email"));
                    pstmt.setString(5, hashedPassword); // Store the hashed password
                    pstmt.setString(6, (String) session.getAttribute("college"));
                    pstmt.setString(7, (String) session.getAttribute("gender"));
                    pstmt.executeUpdate();
                } catch (ClassNotFoundException | SQLException e) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
        } else {
               response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
          }
      }
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

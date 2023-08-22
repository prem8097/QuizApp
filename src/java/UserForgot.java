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
import at.favre.lib.crypto.bcrypt.BCrypt;

public class UserForgot extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       
        PrintWriter out = response.getWriter();
        
        Connection con=null;
        String email=request.getParameter("email");
        //String password=request.getParameter("password");
        String hashedPassword = hashPassword(request.getParameter("password"));
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            String insertQuery = "UPDATE user_details SET password= ? where email = ?";
PreparedStatement pstmt = con.prepareStatement(insertQuery);

// Set the parameter values
pstmt.setString(1, hashedPassword);
pstmt.setString(2, email);

            int rowsUpdated = pstmt.executeUpdate();
            if(rowsUpdated > 0)
            {
                response.setStatus(HttpServletResponse.SC_OK);
            }
            else
            {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
            
        }catch(ClassNotFoundException | SQLException e)
        {
            
            out.println("Sorry!!!TRy again later"+e);
            
        }
    }  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
 private String hashPassword(String plainPassword) {
        return BCrypt.withDefaults().hashToString(12, plainPassword.toCharArray());
    }
}

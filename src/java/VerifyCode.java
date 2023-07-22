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
        
        try (PrintWriter out = response.getWriter()) {
            User user= (User) session.getAttribute("authcode");
            String code = request.getParameter("otp");
            if(code.equals(user.getCode())){
                try{
                    response.setStatus(HttpServletResponse.SC_OK);
            Connection con=null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            
            PreparedStatement pstmt = con.prepareStatement("insert into user_details values('"+ session.getAttribute("reg")+"','"+session.getAttribute("name")+"','"+session.getAttribute("phone")+"','"+session.getAttribute("email")+"','"+session.getAttribute("password")+"','"+session.getAttribute("college")+"','"+session.getAttribute("gender")+"')");
            pstmt.executeUpdate();
        }catch(ClassNotFoundException | SQLException e)
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            
        }
               // response.sendRedirect("success.html");
            }else{
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            } 
            
             
        }
        
         
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

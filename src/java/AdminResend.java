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
import java.sql.ResultSet;

public class AdminResend extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session  = request.getSession();
           String email=(String)session.getAttribute("email");
           String name=(String)session.getAttribute("name");
           SendEmail sm = new SendEmail();
           String code = sm.getRandom();
           User user = new User(name,email,code);
           boolean test = sm.sendEmail(user);
           if(test){
               session.setAttribute("authcode", user);
               response.setStatus(HttpServletResponse.SC_OK);
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
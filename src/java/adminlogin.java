import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import org.json.JSONObject;
import at.favre.lib.crypto.bcrypt.BCrypt;

public class adminlogin extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        Connection con=null;
        Statement stmt=null;
        String email="";
        String pass="";
        JSONObject jsonResponse = new JSONObject();
       
        HttpSession session = request.getSession();
        email=request.getParameter("email");
        pass=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            PreparedStatement pstmt = con.prepareStatement("Select name,email,password,subscription,end_date from admin_details where email=?");
            pstmt.setString(1, email);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) 
            {
               if(verifyPassword(pass,rs.getString("password")))
                {
                    jsonResponse.put("success","loginsuccess");
                }
                else
                {
                    jsonResponse.put("success","loginfail");
                }
               session.setAttribute("email",email);
               session.setAttribute("name", rs.getString(1));
                jsonResponse.put("success","loginsuccess");
               Cookie emailCookie1 = new Cookie("adminemail", email);
               Cookie enddateCookie1 = new Cookie("enddate", rs.getString("end_date"));
               Cookie subscription = new Cookie("subscription", rs.getString("subscription"));
               emailCookie1.setMaxAge(3600); 
               enddateCookie1.setMaxAge(3600);
               subscription.setMaxAge(3600);
               response.addCookie(emailCookie1);
               response.addCookie(enddateCookie1);
               response.addCookie(subscription);
             
              //response.sendRedirect("admin.jsp");
             } 
            else 
            {
                jsonResponse.put("success","loginfail");
              
              //request.getRequestDispatcher("index.html").include(request, response);
             }
             } catch (ClassNotFoundException | SQLException e) {
              e.printStackTrace();
              }   
        out.print(jsonResponse.toString());
        
        out.flush();
    }
    private boolean verifyPassword(String plainPassword, String hashedPassword) {
        return BCrypt.verifyer().verify(plainPassword.toCharArray(), hashedPassword).verified;
    }

}

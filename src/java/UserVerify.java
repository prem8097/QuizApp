import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.json.JSONObject;

public class UserVerify extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            

        // Parse the JSON data
        
           String reg = request.getParameter("registerNo");
        String name = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String college = request.getParameter("collegeName");
        String gender = request.getParameter("gender");
        
        out.println(reg);
           SendEmail sm = new SendEmail();
           String code = sm.getRandom();
           User user = new User(name,email,code);
           boolean test = sm.sendEmail(user);
           if(test){
               HttpSession session  = request.getSession();
               session.setAttribute("authcode", user);
               session.setAttribute("name", name);
               session.setAttribute("email", email);
               session.setAttribute("reg", reg);
               session.setAttribute("gender", gender);
               session.setAttribute("phone", phone);
               session.setAttribute("college", college);
               session.setAttribute("password", password);
               response.setStatus(HttpServletResponse.SC_OK);
               //response.sendRedirect("otp.jsp");
           }else{
                  response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      		  out.println("Failed to send verification email");
      	   }   
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con=null;
        String email=request.getParameter("email");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            PreparedStatement pstmt=con.prepareStatement("select email from user_details where email=?");
            pstmt.setString(1, email);
            ResultSet rs=pstmt.executeQuery();
            int cnt=0;
            while(rs.next())
            {
                cnt++;
            }
            out.println("hi");
            if(cnt==0)
            {
                processRequest(request, response);
            }
            else if(cnt>0)
            { 
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                //response.sendRedirect("http://44.201.108.37:8090/QuizIT1/");
                //response.sendRedirect("index.html");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }   
    }
}
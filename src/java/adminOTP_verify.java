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

public class adminOTP_verify extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String name = request.getParameter("adminname");
           String email = request.getParameter("adminemail");
           String password=request.getParameter("adminpassword");
           SendEmail sm = new SendEmail();
           String code = sm.getRandom();
           User user = new User(name,email,code);
           boolean test = sm.sendEmail(user);
           if(test){
               HttpSession session  = request.getSession();
               session.setAttribute("authcode", user);
               session.setAttribute("name", name);
               session.setAttribute("email", email);
               session.setAttribute("password", password);
               response.sendRedirect("admin_otp.jsp");
           }else{
      		  out.println("Failed to send verification email");
      	   }   
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con=null;
        String email=request.getParameter("adminemail");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            PreparedStatement pstmt=con.prepareStatement("select email from admin_details where email=?");
            pstmt.setString(1, email);
            ResultSet rs=pstmt.executeQuery();
            int cnt=0;
            while(rs.next())
            {
                cnt++;
            }
            
            if(cnt==0)
            {
                processRequest(request, response);
            }
            else if(cnt>0)
            { 
                out.println("<html><body><script type=\"text/javascript\">");
                out.println("alert('" + "Account this Email Already Exists" + "');");
                out.println("window.location.href='index.html';"); // Redirect to a specific page
                out.println("</script></body></html>");
                //response.sendRedirect("http://44.201.108.37:8090/QuizIT1/");
                //response.sendRedirect("http://localhost/QuizIT1/");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }   
    }
}
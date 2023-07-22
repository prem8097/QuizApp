import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class sendemailall extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection con=null;
        try (PrintWriter out = response.getWriter())
        {
            String cntopic=request.getParameter("cntopic");
            String ostopic=request.getParameter("ostopic");
            String aitopic=request.getParameter("aitopic");
            String pytopic=request.getParameter("pytopic");
            String toctopic=request.getParameter("toctopic");
            String nettopic=request.getParameter("networkstopic");
            String quiz[]=request.getParameterValues("quiz");
            String ss="<ul>";
            for(int i=0;i<quiz.length;i++)
            {
                if("Computer Networks".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li> Topic :"+cntopic+"</li></ul></li>";
                }
                if("Operating Systems".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li> Topic :"+ostopic+"</li></ul></li>";
                }
                if("Artificial Intelligence".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li>Topic :"+aitopic+"</li><ul></li>";
                }
                if("Python".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li>Topic :"+pytopic+"</li><ul></li>";
                }
                if("Theory of computation".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li>Topic :"+toctopic+"</li><ul></li>";
                }
                if("Network tools & Techniques".equals(quiz[i]))
                {
                    ss+="<li>"+quiz[i]+ "<ul style='color:blue';><li>Topic :"+nettopic+"</li><ul></li>";
                }
            }
            ss=ss+"</ul>";
            //feth form value
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            PreparedStatement pstmt=con.prepareStatement("select email,name from user_details");
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {
            boolean test = false;
            String toEmail = rs.getString(1);
            final String fromEmail = "venkatapremsai1@gmail.com";
            final String password = "ljvkadlptwojdxyn";
            try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "465");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "465");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
            return new PasswordAuthentication(fromEmail, password);
            }
            });
            //set email message details
            
            String someHtmlMessage = "<i><b style='font-size:17px'>Hi "+ rs.getString(2)+"</b></i>"  +"<br><p style='font-size:18px'>We updated the following Quizes in our website Have  a look into it.<br> Happy Learning</p><i> <b style= 'font-size:18px;' >"+ss+"</i></b><br><b style='font-size:17px'><i>Thank You<br>QuizIT</i></b>";

            
            
            
            Message mess = new MimeMessage(session);
            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            //set email subject
            mess.setSubject("QuizIT updated");
            //set message text
            mess.setContent(someHtmlMessage, "text/html; charset=utf-8");
            //mess.setText("Hi "+rs.getString(2)+"\nWe updated the following quizes\n"+ss+"\nHave a look into it.\nHappy Learning\nThanks, \nQuizIT");
            //send the message
            Transport.send(mess);
            test=true;
            out.println("\nEmail sent to" + rs.getString(1) + "<br>");
            }
            catch (Exception e)
            {
            e.printStackTrace();
            }
            }
        }
        catch(Exception e)
        {
           PrintWriter out = response.getWriter();
           out.println(e);   
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        processRequest(request, response);
        
    }

}
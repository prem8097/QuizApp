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
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class adminmsg extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session1  = request.getSession();
        //String toEmail=(String)session1.getAttribute("email");
        
        String toEmail=request.getParameter("toEmail");
        //String query=(String)session1.getAttribute("query");
        String ans=request.getParameter("querytxt");
        
       // String querytxt=request.getParameter("query");
        try (PrintWriter out = response.getWriter()) {
            
            
            out.println(toEmail);
            
            out.println(ans);
         
           
           final String fromEmail="venkatapremsai1@gmail.com";
           
           final String password="ljvkadlptwojdxyn";
           //final String password=(String)session1.getAttribute("password");
           
           
           
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "465");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "465");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("Query");
            String htmlmess="<b>Answer for your Query </b>"+"<br><b>Explanation :</b>"+ans+"<br><b><br>Thanks, <br>QuizIT</b>";
            mess.setContent(htmlmess, "text/html; charset=utf-8");
           
            //mess.setText("Registered successfully.\nPlease verify your account using this code: " + user.getCode()+ "\nThanks, \nQuizIT");
            Transport.send(mess);
            
            out.println("sent");
        
        }catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
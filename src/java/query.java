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

public class query extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session1  = request.getSession();
        String toEmail=(String)session1.getAttribute("email");
        String user=(String)session1.getAttribute("user");
        String querytxt=request.getParameter("query");
        try (PrintWriter out = response.getWriter()) {
            try{
            Connection con=null;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
            PreparedStatement pstmt=con.prepareStatement("insert into query values('"+ user+"','"+toEmail+"','"+querytxt+"')");
            pstmt.executeUpdate();
            }catch(ClassNotFoundException | SQLException e)
        {
            out.println("Sorry!!!TRy again later"+e);
        }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
           
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
            String htmlmess="<b>Thank for your Interest in QuizIT</b><br>Query : "+querytxt +"<br>We will get back to you soon<b><br>Thanks, <br>QuizIT</b>";
            mess.setContent(htmlmess, "text/html; charset=utf-8");
           
            //mess.setText("Registered successfully.\nPlease verify your account using this code: " + user.getCode()+ "\nThanks, \nQuizIT");
            Transport.send(mess);
            
            out.println("sent");
        
        }catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
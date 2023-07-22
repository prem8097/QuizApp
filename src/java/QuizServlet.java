import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.json.JSONArray;
import java.util.*;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class QuizServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String quizName = request.getParameter("quizName");
    int numQuestions = Integer.parseInt(request.getParameter("numQuestions"));
    String dynamicHTML = request.getParameter("dynamicHTML");
    String randomstr=request.getParameter("randomString");
    String dynamicHTML1 = request.getParameter("dynamicHTML1");
    String quizDescription = request.getParameter("quizDescription");
    String dateTaken = request.getParameter("dateTaken");
    String timeTaken = request.getParameter("timeTaken");
    String endTime = request.getParameter("endTime");
    String endDate = request.getParameter("endDate");
    String[] emails = quizDescription.split("\\n");
    int duration=Integer.parseInt(request.getParameter("duration"));
    PrintWriter out = response.getWriter();
    // Store dynamicHTML in the database or perform any desired processing

    Connection con = null;
    PreparedStatement pstmt = null;
    LocalDateTime currentDateTime = LocalDateTime.now();
        
        // Define the desired date format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // Format the current date and time as a string
        String formattedDateTime = currentDateTime.format(formatter);
        HttpSession session=request.getSession();
    String email=(String)session.getAttribute("email");
    String name=(String)session.getAttribute("name");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
        pstmt = con.prepareStatement("INSERT INTO quizzes (quiz_name,dynamic_html,no_ques,quiz_code,dynamic_html1,participants,date,time,duration,date_created,admin_email,end_time,end_date) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pstmt.setString(1, quizName);
        pstmt.setString(2, dynamicHTML);
        pstmt.setInt(3,numQuestions);
        pstmt.setString(4,randomstr);
        pstmt.setString(5, dynamicHTML1);
        pstmt.setString(6,quizDescription);
        pstmt.setString(7, dateTaken);
        pstmt.setString(8,timeTaken);
        pstmt.setInt(9,duration);
        pstmt.setString(10,formattedDateTime);
        pstmt.setString(11,email);
        pstmt.setString(12,endTime);
        pstmt.setString(13,endDate);
        pstmt.executeUpdate();
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (pstmt != null)
                pstmt.close();
            if (con != null)
                con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    String code = randomstr;
           User user = new User(name,email,code);
           boolean test = sendEmail(user,quizName,numQuestions);
           boolean test1=sendEmailtouser(emails,quizName,numQuestions,code,dateTaken,timeTaken);
    
    response.getWriter().write("Dynamic HTML stored successfully.");
    out.println("Dynamic HTML stored successfully");
  }
  public boolean sendEmail(User user,String quizName,int numQuestions) {
        boolean test = false;
        String toEmail = user.getEmail();
        String code=user.getCode();
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
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("Quiz Hosting Confirmation - Ready for User Participation with Exam Code: "+code);
            String htmlmess = "<!DOCTYPE html>\n" +
    "<html>\n" +
    "<head>\n" +
    "  <title>Quiz Hosting Confirmation - Ready for User Participation</title>\n" +
    "  <style>\n" +
    "    body {\n" +
    "      font-family: Arial, sans-serif;\n" +
    "      background-color: #f5f5f5;\n" +
    "      margin: 0;\n" +
    "      padding: 20px;\n" +
    "    }\n" +
    "    \n" +
    "    .container {\n" +
    "      max-width: 600px;\n" +
    "      margin: 0 auto;\n" +
    "      background-color: #ffffff;\n" +
    "      padding: 20px;\n" +
    "      border-radius: 5px;\n" +
    "      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);\n" +
    "    }\n" +
    "    \n" +
    "    h1 {\n" +
    "      color: #333333;\n" +
    "      margin-top: 0;\n" +
    "    }\n" +
    "    \n" +
    "    p {\n" +
    "      color: #555555;\n" +
    "      line-height: 1.5;\n" +
    "    }\n" +
    "    \n" +
    "    .button {\n" +
    "      display: inline-block;\n" +
    "      background-color: #007bff;\n" +
    "      color: #ffffff;\n" +
    "      padding: 10px 20px;\n" +
    "      text-decoration: none;\n" +
    "      border-radius: 4px;\n" +
    "      margin-top: 20px;\n" +
    "    }\n" +
    "    \n" +
    "    .button:hover {\n" +
    "      background-color: #0056b3;\n" +
    "    }\n" +
    "    \n" +
    "    .footer {\n" +
    "      margin-top: 20px;\n" +
    "      text-align: center;\n" +
    "    }\n" +
    "    \n" +
    "    .footer p {\n" +
    "      color: #888888;\n" +
    "      margin: 0;\n" +
    "    }\n" +
    "  </style>\n" +
    "</head>\n" +
    "<body>\n" +
    "  <div class=\"container\">\n" +
    "    <h1>Quiz Hosting Confirmation - Ready for User Participation</h1>\n" +
    "    <p>Dear Administrator,</p>\n" +
    "    <p>I am pleased to inform you that the quiz has been successfully hosted on our platform. Now, all your users can actively participate in the quiz and put their knowledge to the test. This engaging activity will surely enhance their learning experience and add value to their educational journey.</p>\n" +
    "    <p>Here are the key details regarding the hosted quiz:</p>\n" +
    "    <ol >\n" +
    "      <li><b>Quiz Name: </b><b>"+quizName+"</b></li>\n" +
    "      <li><b>Number of Questions: </b><b>"+numQuestions+"</b></li>\n" +
    "      <li><b>Quiz Code: </b><b>"+code+"</b></li>\n" +
    "    </ol>\n" +
    "    <p>To ensure a smooth user experience, please inform your users about this exciting opportunity and provide them with the necessary details to access the quiz. They can visit our platform and enter the following credentials to join the quiz:</p>\n" +
    "    <p>Additionally, we recommend sharing the quiz instructions and guidelines with your users to ensure they are aware of the quiz format, duration, and any specific rules.</p>\n" +
    "    <p>Please feel free to reach out to us if you have any questions or require further assistance. We are here to support you in making this quiz a successful and enjoyable experience for all participants.</p>\n" +
    "    <p>Thank you for choosing our platform for hosting the quiz. We appreciate your trust in our services and look forward to hearing about the positive outcomes of this interactive learning activity.</p>\n" +
    "    <div class=\"footer\">\n" +
    " <p>Best regards,</p>\n" +
    " <p>Prem</p>\n" +
    " <p>Quizhost</p>\n" +
    " </div>\n" +
    " </div>\n" +
    "</body>\n" +
    "</html>";

            mess.setContent(htmlmess, "text/html; charset=utf-8");
           
            //mess.setText("Registered successfully.\nPlease verify your account using this code: " + user.getCode()+ "\nThanks, \nQuizIT");
            Transport.send(mess);
            test=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
  public boolean sendEmailtouser(String arr[],String quizName,int numQuestions,String code,String dateTaken,String timeTaken) {
        boolean test = false;
        
        for(String eml:arr)
        {
            final String fromEmail = "venkatapremsai1@gmail.com";
        final String password = "ljvkadlptwojdxyn";
        Connection con = null;
    PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/quizit","root","prem8097");
        pstmt = con.prepareStatement("INSERT INTO user_quizzes (email,quiz_code,quiz_name,status,date) VALUES (?,?,?,?,?)");
        pstmt.setString(1, eml);
        pstmt.setString(2, code);
        pstmt.setString(3,quizName);
        pstmt.setBoolean(4,false);
        pstmt.setString(5,dateTaken);
        pstmt.executeUpdate();
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
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(eml));
            mess.setSubject("Invitation to Participate in the Quiz - Exam Code: "+code);
            String htmlmess = "<!DOCTYPE html>\n" +
        "<html>\n" +
        "<head>\n" +
        "  <title>Quiz Invitation - Participate and Test Your Knowledge!</title>\n" +
        "  <style>\n" +
        "    body {\n" +
        "      font-family: Arial, sans-serif;\n" +
        "      background-color: #f5f5f5;\n" +
        "      margin: 0;\n" +
        "      padding: 20px;\n" +
        "    }\n" +
        "    \n" +
        "    .container {\n" +
        "      max-width: 600px;\n" +
        "      margin: 0 auto;\n" +
        "      background-color: #ffffff;\n" +
        "      padding: 20px;\n" +
        "      border-radius: 5px;\n" +
        "      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);\n" +
        "    }\n" +
        "    \n" +
        "    h1 {\n" +
        "      color: #333333;\n" +
        "      margin-top: 0;\n" +
        "    }\n" +
        "    \n" +
        "    p {\n" +
        "      color: #555555;\n" +
        "      line-height: 1.5;\n" +
        "    }\n" +
        "    \n" +
        "    .button {\n" +
        "      display: inline-block;\n" +
        "      background-color: #007bff;\n" +
        "      color: #ffffff;\n" +
        "      padding: 10px 20px;\n" +
        "      text-decoration: none;\n" +
        "      border-radius: 4px;\n" +
        "      margin-top: 20px;\n" +
        "    }\n" +
        "    \n" +
        "    .button:hover {\n" +
        "      background-color: #0056b3;\n" +
        "    }\n" +
        "    \n" +
        "    .footer {\n" +
        "      margin-top: 20px;\n" +
        "      text-align: center;\n" +
        "    }\n" +
        "    \n" +
        "    .footer p {\n" +
        "      color: #888888;\n" +
        "      margin: 0;\n" +
        "    }\n" +
        "  </style>\n" +
        "</head>\n" +
        "<body>\n" +
        "  <div class=\"container\">\n" +
        "    <h1>Quiz Invitation - Participate and Test Your Knowledge!</h1>\n" +
        "    <p>Dear Participant,</p>\n" +
        "    <p>We are delighted to inform you that your administrator has hosted a quiz on our platform, and you are cordially invited to participate. This quiz presents an excellent opportunity for you to test your knowledge, learn new information, and showcase your skills in a fun and engaging manner.</p>\n" +
        "    <p>Here are the details of the quiz:</p>\n" +
        "    <ol>\n" +
        "      <li><strong>Quiz Name:</strong><b> "+quizName+"</b></li>\n" +
        "      <li><strong> Date:</strong> <b>"+dateTaken+"</b></li>\n" +
        "      <li><strong> Time:</strong> <b>"+timeTaken+"</b></li>\n" +
        "      <li><strong> Code:</strong> <b>"+code+"</b></li>\n" +
        "    </ol>\n" +
        "    <p>To join the quiz, please follow these steps:</p>\n" +
        "    <ol>\n" +
        "      <li>Visit our platform at http://quizhost.online</li>\n" +
        "      <li>Sign in to your account using your credentials. If you don't have an account, you may need to create one.</li>\n" +
        "      <li>Go to Scheduled Exams and enter the provided quiz code ("+code+") when prompted.</li>\n" +
        "      <li>Answer the quiz questions to the best of your abilities and submit your responses within the designated time frame.</li>\n" +
        "    </ol>\n" +
        "    <p>We encourage you to prepare for the quiz by reviewing relevant study materials and ensuring a stable internet connection during the quiz session.</p>\n" +
        "    <p>If you have any questions or require further assistance, please do not hesitate to reach out to our support team. We are here to help you and ensure a smooth quiz experience.</p>\n" +
        "    <p>We extend our sincere appreciation to your administrator for hosting this quiz and providing you with this valuable learning opportunity. Make the most of this experience, challenge yourself, and strive for excellence!</p>\n" +
        "    <p>Best of luck, and we look forward to your participation and impressive performance in the quiz!</p>\n" +
        "    <div class=\"footer\">\n" +
        "      <p>Best regards,</p>\n" +
        "      <p>Prem</p>\n" +
        "      <p>Quizhost</p>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</body>\n" +
        "</html>";


            mess.setContent(htmlmess, "text/html; charset=utf-8");
           
            //mess.setText("Registered successfully.\nPlease verify your account using this code: " + user.getCode()+ "\nThanks, \nQuizIT");
            Transport.send(mess);
            test=true;
        } catch (Exception e) {
            e.printStackTrace();
            test=false;
        }
            }
        
        
  return test;
  }
  
}

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    public boolean sendEmail(User user) {
        boolean test = false;
        String toEmail = user.getEmail();
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
            mess.setSubject("User Email Verification");
            String htmlmess="<b>QuizHost Account Verification OTP<b><br>Please verify your account using this code:<b> " + user.getCode()+ "</b><b><br>Thanks, <br>QuizIT</b>";
            mess.setContent(htmlmess, "text/html; charset=utf-8");
           
            //mess.setText("Registered successfully.\nPlease verify your account using this code: " + user.getCode()+ "\nThanks, \nQuizIT");
            Transport.send(mess);
            test=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}

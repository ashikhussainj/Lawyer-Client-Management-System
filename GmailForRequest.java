package Database;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public  class GmailForRequest {
   
    
    
    public static String requestGmail(String email,String Subject,String Content ){
        
          // Gmail SMTP server configuration
        final String username = "javafabhost2021@gmail.com"; // Replace with your Gmail email address
        final String password = "rzrpppusjjrdlkqa";   // Replace with your Gmail password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Create a session with Gmail SMTP server
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);

            // Set the sender's email address
            message.setFrom(new InternetAddress(username));

            // Set the recipient's email address
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Replace with recipient's email address

            // Set the email subject
            message.setSubject(Subject);

            // Set the email content
            message.setText(Content);

            // Send the email
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        
        return "";
    }
    
}

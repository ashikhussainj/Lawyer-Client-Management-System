<%-- 
    Document   : Acceptcouncil
    Created on : 16 Sep, 2023, 10:44:39 AM
    Author     : Fabhost
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.Db"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String email = request.getParameter("email");

            Connection con = Db.connect();
            try {
                PreparedStatement st = con.prepareStatement("update lawyers SET council=? , lawcertificate=?  where email=?");
                st.setInt(1, 2);
                st.setInt(2, 2);
                st.setString(3, email);

                int rs = st.executeUpdate();
                if (rs > 0) {

                    // Sender's email address and password
                    final String fromEmail = "javafabhost2021@gmail.com";
                    final String password = "rzrpppusjjrdlkqa";

                    // Recipient's email address
                    String toEmail = email;

                    // Setup properties for the SMTP server
                    Properties properties = new Properties();
                    properties.put("mail.smtp.host", "smtp.gmail.com");
                    properties.put("mail.smtp.port", "587");
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");

                    // Create a session with authentication
                    Session session1 = Session.getInstance(properties, new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(fromEmail, password);
                        }
                    });

                    try {
                        // Create a MimeMessage object
                        Message message = new MimeMessage(session1);

                        // Set the sender and recipient email addresses
                        message.setFrom(new InternetAddress(fromEmail));
                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

                        // Set the email subject and text
                        message.setSubject("Verification Rejected");
                        message.setText("Verification Rejected");

                        // Send the email
                        Transport.send(message);

                        System.out.println("Email sent successfully.");

                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }

                    response.sendRedirect("Verification.jsp");

                }
            } catch (SQLException ex) {

                out.print(ex);
            }

        %>
    </body>
</html>

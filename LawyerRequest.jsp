<%-- 
    Document   : LawyerRequest
    Created on : 15 Sep, 2023, 1:44:47 PM
    Author     : Fabhost
--%>

<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.Db"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String fromemail = request.getParameter("fromemail");
            String toemail = request.getParameter("toemail");
            Connection con = Db.connect();
            try {
                PreparedStatement st = con.prepareStatement("update acceptemail set flag=? where toemail=? and fromemail=?");
                st.setString(2, toemail);
                st.setString(3, fromemail);
                st.setInt(1, 1);
                int rs = st.executeUpdate();

                if (rs > 0) {
                    String txt = "Lawyer Accepted your Request";

                    // String mailid=rset.getString(2);
                    String email = "javafabhost2021@gmail.com",
                            password = "rzrpppusjjrdlkqa",
                            host = "smtp.gmail.com",
                            port = "465",
                            to = fromemail,
                            subject = "Acceptence Mail",
                            text = txt.trim();

                    Properties props = new Properties();
                    props.put("mail.smtp.user", email);
                    props.put("mail.smtp.host", host);
                    props.put("mail.smtp.port", port);
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.socketFactory.port", port);
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.socketFactory.fallback", "false");

                    SecurityManager security = System.getSecurityManager();

                    try {
                        class SMTPAuthenticator extends javax.mail.Authenticator {

                            public PasswordAuthentication getPasswordAuthentication() {
                                String email = "javafabhost2021@gmail.com",
                                        password = "rzrpppusjjrdlkqa";
                                return new PasswordAuthentication(email, password);
                            }
                        }
                        SMTPAuthenticator auth = new SMTPAuthenticator();
                        Session sessions = Session.getInstance(props, auth);
                        sessions.setDebug(true);

                        MimeMessage msg = new MimeMessage(sessions);
                        msg.setText(text);
                        msg.setSubject(subject);
                        msg.setFrom(new InternetAddress(email));
                        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                        Transport.send(msg);

                        out.println("<script type='text/javascript'>");
                        out.println("alert('Request Accepted')");
                        out.println("window.location='Viewclientrequests.jsp'");
                        out.println("</script>");

                    } catch (Exception e1) {

                    }
                }
            } catch (SQLException ex) {

                out.print(ex);
            }


        %>
    </body>
</html>

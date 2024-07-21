<%-- 
    Document   : Lawyer_message
    Created on : 15 Sep, 2023, 3:58:57 PM
    Author     : Fabhost
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
            
            String message= request.getParameter("message");
            
            String myemail=""+session.getAttribute("email");
            String Clientemail=""+session.getAttribute("Clientemail");
            
//            JOptionPane.showMessageDialog(null, message);
//            JOptionPane.showMessageDialog(null, myemail);
//            JOptionPane.showMessageDialog(null, Clientemail);

            Connection con = Db.connect();
            
              LocalDate today = LocalDate.now();

            try {
                PreparedStatement st = con.prepareStatement("insert into chats(fromemail,toemail,date,content) values(?,?,?,?)");
                st.setString(1, myemail);
                st.setString(2, Clientemail);
                st.setString(3, ""+today);
                st.setString(4, message);

                int rs = st.executeUpdate();
                
                if (rs>0) {
                    
                    response.sendRedirect("Lawyerchat.jsp");
                        
                    }

            } catch (SQLException ex) {

                out.print(ex);

            }

        %>
    </body>
</html>

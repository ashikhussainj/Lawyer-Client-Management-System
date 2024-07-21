<%-- 
    Document   : Lawyersession
    Created on : 15 Sep, 2023, 3:48:11 PM
    Author     : Fabhost
--%>

<%@page import="Database.LawyerRegister"%>
<%@page import="java.util.logging.Logger"%>
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
          
            String Clientemail = request.getParameter("toemail");
            
            
              Connection con = Db.connect();
        try {

            PreparedStatement st1 = con.prepareStatement("select * from clients where email=?");
            st1.setString(1, Clientemail);
        
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {

               
          
//            String lawyername = request.getParameter("name");
            
            session.setAttribute("Clientemail", Clientemail);
            session.setAttribute("Clientname", rs1.getString("name"));
          
            response.sendRedirect("ResponseLawyers_Lawyerchat.jsp");
            }
            
            
           

        } catch (SQLException ex) {
           out.print(ex);
        }
            
            
          
        %>
    </body>
</html>

<%-- 
    Document   : Lawyersession
    Created on : 15 Sep, 2023, 3:48:11 PM
    Author     : Fabhost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          
            String Clientemail = request.getParameter("fromemail");
          
            String lawyername = request.getParameter("name");
            
            session.setAttribute("Clientemail", Clientemail);
            session.setAttribute("lawyername", lawyername);
          
            response.sendRedirect("Lawyerchat.jsp");
        %>
    </body>
</html>

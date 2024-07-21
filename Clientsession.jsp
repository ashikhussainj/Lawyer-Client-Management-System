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
          
            String lawyeremail = request.getParameter("toemail");
          
            String lawyername = request.getParameter("name");
            
            session.setAttribute("lawyeremail", lawyeremail);
            session.setAttribute("lawyername", lawyername);
          
            response.sendRedirect("chatmain.jsp");
        %>
    </body>
</html>

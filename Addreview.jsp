<%-- 
    Document   : Addreview
    Created on : 20 Sep, 2023, 3:42:59 PM
    Author     : Fabhost
--%>

<%@page import="Database.Db"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            try {
                
                String email=""+ session.getAttribute("email");
                
                String review=request.getParameter("review");
                
                String to=request.getParameter("toemail");

                Connection con1 = Db.connect();

                PreparedStatement st = con1.prepareStatement("insert into clientreview(review,fromemail,toemail) values(?,?,?)");
                st.setString(1, review);
                st.setString(2, email);
                st.setString(3, to);
                int rs = st.executeUpdate();
                if (rs>0) {
                    
                    response.sendRedirect("SendReview.jsp");

                }
            } catch (SQLException ex) {
                out.print(ex);
            }

        %>
    </body>
</html>

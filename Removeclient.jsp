<%-- 
    Document   : Removeclient
    Created on : 14 Sep, 2023, 6:01:49 PM
    Author     : Fabhost
--%>

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

                String email = request.getParameter("email");

                Connection con = Db.connect();
                try {
                    PreparedStatement st = con.prepareStatement("update clients set flag=? where email=?");
                    st.setInt(1, 1);
                    st.setString(2, email);
                    int rs = st.executeUpdate();
                    if (rs>0) {
                        
                        response.sendRedirect("Viewlawyers.jsp");

                    }
                } catch (SQLException ex) {

                    out.print(ex);
                }
            

        %>
    </body>
</html>

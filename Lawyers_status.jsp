<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Database.Db"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div style="    height: 100vh; background-color: #b5caee; background-image: url(images/lawyer-bg3.jpg); background-size: cover;" >
            <header class="header_section">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                Law Agency
                            </span>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                              <ul class="navbar-nav  ">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="adminhome.jsp">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="viewclients.jsp">Client Side</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Viewlawyers.jsp">lawyer Side</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Verification.jsp">Verifications</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Lawyers.jsp">Lawyers</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="Clients.jsp">Clients</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="index.html">Logout</a>
                                    </li>
                                  
                                </ul>
                                <div class="user_option">
                                    <a href="">
                                        <img src="images/user.png" alt="">

                                    </a>
                                    <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                                        <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </nav>

                    <%

                        String email =request.getParameter("email");
                    %>

                    <div class="container bg-white w-75">
                        <table class="table">
                            <thead>
                                <tr>

                                    <th scope="col">Lawyer Email</th>
                                    <th scope="col">Client Email</th>
                                    <th scope="col">Content</th>
                                    <th scope="col">Hearing Type</th>
                                    <th scope="col">Document</th>
                                    <th scope="col">Hearing Date</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <%
                                    Connection con = Db.connect();
                                    try {
                                        PreparedStatement st = con.prepareStatement("select * from hearing where Lawyeremail=? ");
                                        st.setString(1, email);
                                        ResultSet rs = st.executeQuery();
                                        while (rs.next()) {

                                %>
                                <tr>

                                    <td><%=rs.getString("Lawyeremail")%></td>
                                    <td><%=rs.getString("clientemail")%></td>
                                    <td><%=rs.getString("content")%></td>
                                    <td><%=rs.getString("hearingtype")%></td>
                                    <td>
                                        <a href="Hearing_Photos/<%=rs.getString("filename")%>" target="_blank">
                                        <img src="Hearing_Photos/<%=rs.getString("filename")%>" class=" d-flex justify-content-center" style="width: 50px;height: 50px">
                                    </a>
                                        
                                        
                                    </td>
                                    <td><%=rs.getString("hearingdate")%></td>
                                </tr>

                                <%         }
                                    } catch (SQLException ex) {

                                        out.print(ex);
                                    }

                                %>

                            </tbody>
                        </table>
                    </div>
            </header>

        </div>




    </body>
</html>

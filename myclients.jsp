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
        <!--        fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">
        <!--        Custom styles for this template -->
        <!--        <link href="css/style1.css" rel="stylesheet" />-->
        <!--        responsive sty  le -->
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />-->

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
                                        <a class="nav-link" href="lawyerhome.jsp">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="myclients.jsp">Myclients</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Viewclientrequests.jsp">Requests</a>
                                    </li> 
                                     <li class="nav-item">
                                        <a class="nav-link" href="Lawyerresponse_chat.jsp">Response Chat</a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link" href="ViewLawyerpost.jsp">View Post</a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link" href="Hearing_updates.jsp">Hearing</a>
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

                        String email = "" + session.getAttribute("email");
                    %>

                    <div class="container bg-white">
                        <table class="table">
                            <thead>
                                <tr>

                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Action</th>

                                </tr>
                            </thead>
                            <tbody> 
                                <%
                                    Connection con = Db.connect();
                                    try {
                                        PreparedStatement st = con.prepareStatement("select DISTINCT(fromemail) from acceptemail where toemail=? and flag=?");
                                        st.setString(1, email);
                                        st.setInt(2, 1);
                                        ResultSet rs = st.executeQuery();
                                        while (rs.next()) {

                                            PreparedStatement st1 = con.prepareStatement("select UPPER(name),email from clients where email=?");
                                            st1.setString(1, rs.getString("fromemail"));
                                           
                                            ResultSet rs1 = st1.executeQuery();
                                            if (rs1.next()) {
                                                
                                            

                                %>
                                <tr>
                                    <td><%=rs1.getString("email")%></td>
                                    <td><%=rs1.getString("UPPER(name)")%></td>
                                    <td>
                                        <a href="Lawyersession.jsp?fromemail=<%=rs1.getString("email")%>&name=<%=rs1.getString("UPPER(name)")%>" class="btn btn-primary">Chat</a>
                                        <a href="Send_clientreview.jsp?clientemail=<%=rs1.getString("email")%>" class="btn btn-primary">Send Review</a>
                                    </td>
                                </tr>
                                <%         }}
                                    }catch (SQLException ex) {

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

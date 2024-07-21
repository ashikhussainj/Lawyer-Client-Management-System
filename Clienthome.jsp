<%@page import="java.sql.ResultSet"%>
<%@page import="Database.LawyerRegister"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="Database.Db"  %>
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
        <link href="css/style1.css" rel="stylesheet" />
        <!--        responsive sty  le -->
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    </head>
    <body style="background-size: cover">
        <div  style="    height: 100vh; background-color: #b5caee; background-image: url(images/lawyer-bg3.jpg); background-size: cover;">
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
                                        <a class="nav-link" href="Clienthome.jsp"> Lawyers<span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Chat.jsp">Chat</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Post.jsp">Post</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="postresponse.jsp">Post Response</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="SendReview.jsp">Review</a>
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
                </div>
            </header>
              <section class="section">
            <div class="container" style="width: 61%;">
                <div class="justify-content-center row">
                    <div class="col-lg-12" >
                        <div class="candidate-list-widgets mb-4">
                            <form action="#" class="">
                                <div class="g-2 row">
                                    <div class="col-lg-3">
                                        <div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row bg-light">
                    <div class="col-lg-12" style="x-overflow: inherit;overflow-y: scroll;height: 400px;">
                        <div class="align-items-center row">
                            <div class="col-lg-4">
                                <div class="candidate-list-widgets">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="selection-widget">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="selection-widget mt-2 mt-lg-0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="candidate-list">

                            <%
                                Connection con = Db.connect();
                                try {
                                    PreparedStatement st = con.prepareStatement("select UPPER(username),UPPER(email),UPPER(city),UPPER(category),email from lawyers ");
                                    ResultSet rs = st.executeQuery();
                                    while (rs.next()) {
                            %>

                            <div class="candidate-list-box card mt-4">
                                <div class="p-4 card-body">
                                    <div class="align-items-center row">
                                        <div class="col-auto">
                                            <div class="candidate-list-images">
                                                <a href="#"><img style="height: 75px" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md img-thumbnail rounded-circle" /></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="candidate-list-content mt-3 mt-lg-0">
                                                <h5 class="fs-19 mb-0">
                                                    <a class="primary-link" href="#"><%=rs.getString("UPPER(username)")%></a>
<!--                                                    <span class="badge bg-success ms-1"><i class="mdi mdi-star align-middle"></i>4.8</span>-->
                                                </h5>
                                                <p class="text-muted mb-2"><%=rs.getString("UPPER(category)")%></p>
                                                <ul class="list-inline mb-0 text-muted">
                                                    <li class="list-inline-item"><i class="mdi mdi-map-marker"></i><%=rs.getString("UPPER(city)")%></li>
<!--                                                                                                        <li class="list-inline-item"><i class="mdi mdi-wallet"></i> $650 / hours</li>-->
                                                </ul>
                                                <div>
                                                    <a href="SendRequest.jsp?toemail=<%=rs.getString("email")%>" class="btn btn-primary" >Send</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
<!--                                                <span class="badge bg-soft-secondary fs-14 mt-1">Leader</span><span class="badge bg-soft-secondary fs-14 mt-1">Manager</span><span class="badge bg-soft-secondary fs-14 mt-1">Developer</span>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="favorite-icon">
                                        <a href="#"><i class="mdi mdi-heart fs-18"></i></a>
                                    </div>
                                </div>
                            </div>


                            <%         }
                                } catch (SQLException ex) {

                                    out.print(ex);
                                }

                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>
      

        <style>
            .form-select {
                display: block;
                width: 100%;
                padding: 0.375rem 2.25rem 0.375rem 0.75rem;
                -moz-padding-start: calc(0.75rem - 3px);
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #212529;
                background-color: #fff;
                background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e);
                    background-repeat: no-repeat;
                background-position: right 0.75rem center;
                background-size: 16px 12px;
                border: 1px solid #ced4da;
                border-radius: 0.375rem;
                transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }
        </style>



    </body>
</html>

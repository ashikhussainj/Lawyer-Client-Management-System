<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
         <div style="    height: 100vh; background-color: #b5caee; background-image: url(images/lawyer-bg3.jpg); background-size: cover;" >
            <!-- header section strats -->
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
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            <section class=" slider_section position-relative">
                <div class="container">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <!--                        <ol class="carousel-indicators">
                                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                                </ol>-->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col">
                                        <div class="detail-box">
                                            <div>
                                                <h2>
                                                    Hello

                                                </h2>
                                                <h1>
                                                    <%=session.getAttribute("name")%>
                                                </h1>
                                                <p>
                                                    We provide legal services and representation to you.</p>
<!--                                                <div class="">
                                                    <a href="">
                                                        Contact us
                                                    </a>
                                                </div>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </section>
            <!-- end slider section -->
            <!-- who section -->

            <section class="who_section " style="padding: 0 0">
                <div class="containe">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="img-box">
                                <img src="images/indeximage.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="detail-box">
                                <div class="heading_container">
                                    <h2>
                                        WHO WE ARE?
                                    </h2>
                                </div>
                                <p>
                                    The activities and services provided
                                    by a law agency can vary widely depending on
                                    the agency's mission, focus, and the jurisdiction
                                    in which it operates. Many law agencies provide legal representation to
                                    individuals or entities in various 
                                    legal matters. This can include civil and criminal cases, 
                                    administrative hearings, and appeals.
                                </p>
                                <div>
                                    <a href="">
                                        Read More
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- end who section -->
            <!-- target section -->
            <section class="target_section layout_padding2">
                <div class="containe" style="background-color:  black">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="detail-box">
                                <h2 >
                                    0
                                <h5>
                                    Lawyers
                                </h5>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="detail-box">
                                <h2>
                                    0
                                </h2>
                                <h5>
                                   Clients
                                </h5>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="detail-box">
                                <h2>
                                    0
                                </h2>
                                <h5>
                                    Satisfied Clients
                                </h5>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="detail-box">
                                <h2>
                                    0
                                </h2>
                                <h5>
                                    Cups of Coffee
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

    </body>
</html>

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
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="    height: 100vh; background-color: #b5caee; background-image: url(images/lawyer-bg3.jpg); background-size: cover;" >

        <div  >
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
                                    <!--                                    <li class="nav-item active">
                                                                            <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="Clients.html"> Clients </a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="do.html"> Lawyers </a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="portfolio.html"> Admin </a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" href="contact.html">Contact us</a>
                                                                        </li>-->
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
                                        <section class="ftco-section">
                                            <div class="container" >
                                                <!--                                                <div class="row justify-content-center">
                                                                                                    <div class="col-md-6 text-center mb-5">
                                                                                                        <h2 class="heading-section">Login #08</h2>
                                                                                                    </div>
                                                                                                </div>-->
                                                <div class="row justify-content-center">
                                                    <div class="col-md-6 col-lg-5">
                                                        <div class="login-wrap p-4 p-md-5" >
                                                            <div class="icon d-flex align-items-center justify-content-center">
                                                                <span class="fa fa-user-o"></span>
                                                            </div>
                                                            <h3 class="text-center mb-4" style="color: black">Client Login</h3>
                                                            <form action="CheckOtp" class="login-form" method="Post">
                                                                <div class="form-group">
                                                                    <input type="hidden" class="form-control rounded-left" value="<%=session.getAttribute("verifyemail")  %>" name="email" >
                                                                </div>
                                                                <div class="form-group d-flex">
                                                                    <input type="number" class="form-control rounded-left" placeholder="OTP" name="otp" required>
                                                                </div>
                                                                <div class="form-group d-md-flex">
                                                                </div>
                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-primary rounded submit p-3 px-5">login</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </section>



        </div>
        <style>
            .login-wrap .icon {
                width: 80px;
                height: 80px;
                background: #007bff;
                border-radius: 50%;
                font-size: 30px;
                margin: 0 auto;
                margin-bottom: 10px;
            }
            .form-control {
                height: 48px;
                background: rgba(0, 0, 0, 0.05);
                color: #000;
                font-size: 16px;
                -webkit-box-shadow: none;
                box-shadow: none;
                border: 1px solid transparent;
                padding-left: 20px;
                padding-right: 20px;
                -webkit-transition: all 0.2s ease-in-out;
                -o-transition: all 0.2s ease-in-out;
                transition: all 0.2s ease-in-out;
            }
            .login-wrap {
                position: relative;
                background: #fff;
                border-radius: 10px;
                -webkit-box-shadow: 0px 10px 34px -15px rgba(0, 0, 0, 0.24);
                -moz-box-shadow: 0px 10px 34px -15px rgba(0, 0, 0, 0.24);
                box-shadow: 0px 10px 34px -15px rgba(0, 0, 0, 0.24);
            }
        </style>
        <script>
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>

    </body>
</html>

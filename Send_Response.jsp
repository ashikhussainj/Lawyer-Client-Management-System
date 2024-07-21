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

                <%

                    String email = request.getParameter("email");
                    String id = request.getParameter("id");
                %>

                 <div style="" class="d-flex justify-content-center">
                        <form action="Response_to_Client" method="post"  style="width: 55%;margin-top: 30px;background-color: white;border-radius: 10px"  >
                            <div class="form-group" style="margin-left: 20px;margin-right: 20px;margin-top: 30px    ">
                                <label for="exampleFormControlInput1">Email address</label>
                                <input type="email" name="toemail" value="<%=email%>" readonly="" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                <input type="hidden" name="id" value="<%=id%>">
                            </div>
                            <div class="form-group" style="margin-left: 20px;margin-right: 20px">
                                <label for="exampleFormControlInput1">Content</label>
                                <input type="text" name="content" class="form-control" id="exampleFormControlInput1" >
                            </div>
                            <div class="d-flex justify-content-center" style="margin-bottom: 20px">
                                <button type="submit" class=" btn btn-primary rounded submit p-3 px-5">Submit</button>
                            </div>
                        </form>

                    </div>
            </header>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="councilModal" role="dialog" >
            <div class="modal-dialog" >

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title">Image</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class=" d-flex justify-content-center"  >
                        <img src="images/who-img.jpg" class=" d-flex justify-content-center" style="width: 250px;height: 250px">

                    </div>
                    <div class="modal-footer">
                        <a href="" class="btn btn-dark" >Accept</a>
                        <a href="" class="btn btn-danger" >Reject</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="certificateModal" role="dialog" >
            <div class="modal-dialog" >

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title">Image</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class=" d-flex justify-content-center"  >
                        <img src="images/who-img.jpg" class=" d-flex justify-content-center" style="width: 250px;height: 250px">

                    </div>
                    <div class="modal-footer">
                        <a href="" class="btn btn-dark" >Accept</a>
                        <a href="" class="btn btn-danger" >Reject</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
 </body>
</html>

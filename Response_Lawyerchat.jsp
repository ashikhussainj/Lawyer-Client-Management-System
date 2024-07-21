<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
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
        <!--                <link href="css/style1.css" rel="stylesheet" />-->
        <!--        responsive sty  le -->
        <link href="css/responsive.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />

    </head>
    <body style="background-size: cover">



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

            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

            <div class="d-flex justify-content-center">
                <div style="width: 60%;height: 500px" >

                    <div class="containers" style="height: 100%">
                        <div class="row clearfix">
                            <div class="col-lg-12">
                                <div class="card chat-app">

                                    <%

                                        //                            String Clientemail = request.getParameter("fromemail");
                                        String myemail = "" + session.getAttribute("email");

                                        //                            String lawyername = request.getParameter("name");
                                        String Lawyeremail = "" + session.getAttribute("Lawyeremail");
                                        String lawyername = "" + session.getAttribute("lawyername");

                                        //                            JOptionPane.showMessageDialog(null, email);
                                        //                            JOptionPane.showMessageDialog(null, lawyeremail);
                                    %>

                                    <div class="chat"  style="margin-left: 0px;height: 400px">

                                        <%                                try {
                                        %>
                                        <div class="chat-header clearfix">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                                    </a>
                                                    <div class="chat-about">
                                                        <h6 class="m-b-0" id="outputvalue"><%=lawyername%></h6>
<!--                                                        <small>Last seen: 2 hours ago</small>-->
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 hidden-sm text-right"> <form action="ResponseLawyerchatupload" method="post" enctype="multipart/form-data">
                                                        <!--                                                        <input type="text" id="inputValue" value="1"  style="display: none;">-->
                                                        <!--                                                        <button href=""class="btn btn-outline-info" id="myAnchor" onclick="sendValueToServlet()"><img  src="icons/mic-_1_.ico"  width="5px" alt="Icon"></button>-->
                                                        <i class="fa fa-image btn btn-outline-info" id="file-picker-icon"></i>
                                                        <!--                                                    </a>-->
                                                        <!-- Hidden file input element -->
                                                        <input type="file" name="file" id="file-input" style="display: none;">
                                                        <input type="submit" value="send" class="btn btn-primary" >
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="chat-history ashok-scroll" style="overflow-x: scroll;height: 241px" >
                                            <ul class="m-b-0">

                                                <%

                                                    Connection con = Db.connect();

                                                    PreparedStatement st = con.prepareStatement("select * from responsechat where (fromemail=? and toemail=?) or (fromemail=? and toemail=?) ");
                                                    st.setString(1, myemail);
                                                    st.setString(2, Lawyeremail);
                                                    st.setString(3, Lawyeremail);
                                                    st.setString(4, myemail);

                                                    ResultSet rs = st.executeQuery();

                                                    while (rs.next()) {

                                                        if (rs.getString("fromemail").equals(myemail)) {

                                                            if (rs.getInt("img") == 1) {

                                                %>
                                                <li class="clearfix">
                                                    <div class="message-data text-right">
                                                        <span class="message-data-time"><%=rs.getString("date")%></span>
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="avatar">
                                                    </div>
                                                    <a class="float-right message other-message" href="ResponseLawyerchatimages/<%=rs.getString("content")%>" target="_blank">
                                                        <img src="ResponseLawyerchatimages/<%=rs.getString("content")%>" class=" d-flex justify-content-center" style="width: 50px;height: 50px">
                                                    </a>
                                                </li>

                                                <%} else {


                                                %>


                                                <li class="clearfix">
                                                    <div class="message-data text-right">
                                                        <span class="message-data-time"><%=rs.getString("date")%></span>
                                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="avatar">
                                                    </div>
                                                    <div class="message other-message float-right"><%=rs.getString("content")%></div>
                                                </li>

                                                <%}
                                                    }

                                                    if (rs.getString("fromemail").equals(Lawyeremail)) {
                                               if (rs.getInt("img") == 1) {

                                                %>

                                                <li class="clearfix">
                                                    <div class="message-data">
                                                        <span class="message-data-time"><%=rs.getString("date")%></span>
                                                    </div>
                                                    <a class=" message my-message" href="RespoonseLawyers_Lawyerchat/<%=rs.getString("content")%>" target="_blank">
                                                        <img src="RespoonseLawyers_Lawyerchat/<%=rs.getString("content")%>" class=" d-flex justify-content-center" style="width: 50px;height: 50px">
                                                    </a>                                  
                                                </li> 

                                                <%  } else {

                                                %>
                                                <li class="clearfix">
                                                    <div class="message-data">
                                                        <span class="message-data-time"><%=rs.getString("date")%></span>
                                                    </div>
                                                    <div class="message my-message"><%=rs.getString("content")%></div>                                    
                                                </li> 

                                                <%
                                                            } }
                                                    }


                                                %>

                                            </ul>
                                        </div>
                                        <div class="chat-message clearfix">
                                            <div class="input-group mb-0">
                                                <form action="Response_Lawyer_message.jsp" method="Post">
                                                    <div class="col" style="width: 100%">
                                                        <input  type="text" name="message" class="form-control" placeholder="Enter text here..." style="width: 80%">   
                                                        <input type="submit" value="send" class="btn btn-primary" style="margin-left: 31px;">
                                                    </div>


                                                </form>
                                            </div>
                                        </div>

                                        <%                                        } catch (SQLException ex) {

                                                out.print(ex);

                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>







    </body>

    <script>

        // Get references to the icon and file input elements
        const filePickerIcon = document.getElementById('file-picker-icon');
        const fileInput = document.getElementById('file-input');

// Add a click event listener to the icon
        filePickerIcon.addEventListener('click', () => {
            // Trigger a click event on the hidden file input element
            fileInput.click();
        });

// Add an event listener to the file input to handle when a file is selected
        fileInput.addEventListener('change', () => {
            // Get the selected file
            const selectedFile = fileInput.files[0];

            // You can perform further actions with the selected file, such as uploading or processing it
            if (selectedFile) {
                console.log('Selected file:', selectedFile.name);
                // You can also use FileReader to read the file content, if needed.
            }
        });


    </script>

    <style>





        .ashok-scroll::-webkit-scrollbar{
            width: 10px;
        }

        .ashok-scroll ::-webkit-scrollbar-thumb{
            background: gray;
            border-radius: 50px;
        }

        .ashok-scroll ::-webkit-scrollbar-track{
            background: rgb(15, 15, 15);
        }

        /*        body{
            background-color: #f4f7f6;
            margin-top:20px;
        }*/
        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }
        .chat-app .people-list {
            width: 280px;
            position: absolute;
            left: 0;
            top: 0;
            padding: 20px;
            z-index: 7
        }

        .chat-app .chat {
            margin-left: 280px;
            border-left: 1px solid #eaeaea
        }

        .people-list {
            -moz-transition: .5s;
            -o-transition: .5s;
            -webkit-transition: .5s;
            transition: .5s
        }

        .people-list .chat-list li {
            padding: 10px 15px;
            list-style: none;
            border-radius: 3px
        }

        .people-list .chat-list li:hover {
            background: #efefef;
            cursor: pointer
        }

        .people-list .chat-list li.active {
            background: #efefef
        }

        .people-list .chat-list li .name {
            font-size: 15px
        }

        .people-list .chat-list img {
            width: 45px;
            border-radius: 50%
        }

        .people-list img {
            float: left;
            border-radius: 50%
        }

        .people-list .about {
            float: left;
            padding-left: 8px
        }

        .people-list .status {
            color: #999;
            font-size: 13px
        }

        .chat .chat-header {
            padding: 15px 20px;
            border-bottom: 2px solid #f4f7f6
        }

        .chat .chat-header img {
            float: left;
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-header .chat-about {
            float: left;
            padding-left: 10px
        }

        .chat .chat-history {
            padding: 20px;
            border-bottom: 2px solid #fff
        }

        .chat .chat-history ul {
            padding: 0
        }

        .chat .chat-history ul li {
            list-style: none;
            margin-bottom: 30px
        }

        .chat .chat-history ul li:last-child {
            margin-bottom: 0px
        }

        .chat .chat-history .message-data {
            margin-bottom: 15px
        }

        .chat .chat-history .message-data img {
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-history .message-data-time {
            color: #434651;
            padding-left: 6px
        }

        .chat .chat-history .message {
            color: #444;
            padding: 18px 20px;
            line-height: 26px;
            font-size: 16px;
            border-radius: 7px;
            display: inline-block;
            position: relative
        }

        .chat .chat-history .message:after {
            bottom: 100%;
            left: 7%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #fff;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .my-message {
            background: #efefef
        }

        .chat .chat-history .my-message:after {
            bottom: 100%;
            left: 30px;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #efefef;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .other-message {
            background: #e8f1f3;
            text-align: right
        }

        .chat .chat-history .other-message:after {
            border-bottom-color: #e8f1f3;
            left: 93%
        }

        .chat .chat-message {
            padding: 20px
        }

        .online,
        .offline,
        .me {
            margin-right: 2px;
            font-size: 8px;
            vertical-align: middle
        }

        .online {
            color: #86c541
        }

        .offline {
            color: #e47297
        }

        .me {
            color: #1d8ecd
        }

        .float-right {
            float: right
        }

        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
            height: 0
        }

        @media only screen and (max-width: 767px) {
            .chat-app .people-list {
                height: 465px;
                width: 100%;
                overflow-x: auto;
                background: #fff;
                left: -400px;
                display: none
            }
            .chat-app .people-list.open {
                left: 0
            }
            .chat-app .chat {
                margin: 0
            }
            .chat-app .chat .chat-header {
                border-radius: 0.55rem 0.55rem 0 0
            }
            .chat-app .chat-history {
                height: 300px;
                overflow-x: auto
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 992px) {
            .chat-app .chat-list {
                height: 650px;
                overflow-x: auto
            }
            .chat-app .chat-history {
                height: 600px;
                overflow-x: auto
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
            .chat-app .chat-list {
                height: 480px;
                overflow-x: auto
            }
            .chat-app .chat-history {
                height: calc(100vh - 350px);
                overflow-x: auto
            }
        }
    </style>
</html>

<%-- 
    Document   : sign-in
    Created on : Feb 23, 2019, 6:06:03 PM
    Author     : elmahask
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!doctype html>
<html class="no-js " lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Sign-In</title>
        <!-- Favicon-->
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/authentication.css">
        <link rel="stylesheet" href="assets/css/color_skins.css">
    </head>

    <body class="theme-cyan authentication sidebar-collapse">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top navbar-transparent">
            <div class="container">        
                <div class="navbar-translate n_logo">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home" title="Home">Marketo</a>
                    <button class="navbar-toggler" type="button">
                        <span class="navbar-toggler-bar bar1"></span>
                        <span class="navbar-toggler-bar bar2"></span>
                        <span class="navbar-toggler-bar bar3"></span>
                    </button>
                </div>
                <div class="navbar-collapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" title="Follow us on Twitter" href="#" target="_blank">
                                <i class="zmdi zmdi-twitter"></i>
                                <p class="d-lg-none d-xl-none">Twitter</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" title="Like us on Facebook" href="#" target="_blank">
                                <i class="zmdi zmdi-facebook"></i>
                                <p class="d-lg-none d-xl-none">Facebook</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" title="Follow us on Instagram" href="#" target="_blank">                        
                                <i class="zmdi zmdi-instagram"></i>
                                <p class="d-lg-none d-xl-none">Instagram</p>
                            </a>
                        </li>                
                        <li class="nav-item">
                            <a class="nav-link btn btn-primary btn-round" href="${pageContext.request.contextPath}/sign-up.jsp">SIGN UP</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="page-header" style="top:-25px">
            <div class="page-header-image" style="background-image:url(assets/images/login.jpg)"></div>
            <div class="container">
                <div class="col-md-12 content-center">
                    <div class="card-plain">
                        <form class="form" action="${pageContext.request.contextPath}/sign-in" method="post" name="registerform" onSubmit="return validateForm()">
                            <div class="header">
                                <div class="logo-container">
                                    <img src="assets/images/logo.svg" alt="">
                                </div>
                                <h5>Log in</h5>
                            </div>
                            <div class="content">                                                
                                <div class="input-group input-lg">
                                    <input type="text" name="email" class="form-control" placeholder="Enter User Name">
                                    <span class="input-group-addon">
                                        <i class="zmdi zmdi-account-circle"></i>
                                    </span>
                                </div>
                                <div class="input-group input-lg">
                                    <input type="password" name="password" placeholder="Password" class="form-control" />
                                    <span class="input-group-addon">
                                        <i class="zmdi zmdi-lock"></i>
                                    </span>
                                </div>
                                
                                <div class="checkbox">
                                    <input id="terms" type="checkbox" name="checkBox" value="true">
                                <label for="terms">
                                    Remember Me
                                </label>
                            </div>
                            </div>
                            <div class="footer text-center">
                                <input type="submit" value="SIGN IN" class="btn l-cyan btn-round btn-lg btn-block waves-effect waves-light"/>
                                <h6 class="m-t-20"><a href="${pageContext.request.contextPath}/forgot-password.jsp" class="link">Forgot Password?</a></h6>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container">
                    <nav>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </nav>
                    <div class="copyright">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>,
                        <span>Designed by <a href="#" target="_blank">Theme</a></span>
                    </div>
                </div>
            </footer>
        </div>

        <!-- Jquery Core Js -->
        <script src="assets/bundles/libscripts.bundle.js"></script>
        <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

        <script>
                            $(".navbar-toggler").on('click', function () {
                                $("html").toggleClass("nav-open");
                            });
                            //=============================================================================
                            $('.form-control').on("focus", function () {
                                $(this).parent('.input-group').addClass("input-group-focus");
                            }).on("blur", function () {
                                $(this).parent(".input-group").removeClass("input-group-focus");
                            });
        </script>
        <script>
            function validateForm() {

                var email = document.registerform.email;
                var password = document.registerform.password;

                var username = /^[a-zA-Z0-9]+$/;
                var umailreg = /^[a-zA-Z0-9._ - ]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                var upassreg = /^[a-zA-z0-9]{5,10}/;

                if (!email.value.match(username)) {
                    alert("User Name or email not correct");
                    email.style.background = '#f08080';
                    email.focus();
                    return false;
                }
                if (!password.value.match(upassreg)) {
                    alert("password must be between 5 to 10");
                    password.style.background = '#f08080';
                    password.focus();
                    return false;
                }
            }
        </script>
    </body>

</html>
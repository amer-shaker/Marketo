<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!doctype html>
<html class="no-js " lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

        <title>Marketo</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- Favicon-->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/ecommerce.css">
        <link rel="stylesheet" href="assets/css/color_skins.css">
    </head>
    <body class="theme-orange">
        <!-- Page Loader -->
        <div class="page-loader-wrapper">
            <div class="loader">
                <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48" height="48" alt="Compass"></div>
                <p>Please wait...</p>
            </div>
        </div>

        <!-- Overlay For Sidebars -->
        <div class="overlay"></div>

        <!-- Top Bar -->
        <nav class="navbar">
            <div class="col-12">        
                <div class="navbar-header">
                    <a href="javascript:void(0);" class="bars"></a>
                    <a class="navbar-brand" href="ec-product.jsp"><img src="assets/images/logo.svg" width="30" alt="Compass"><span class="m-l-10">Shopik</span></a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="javascript:void(0);" class="ls-toggle-btn" data-close="true"><i class="zmdi zmdi-swap"></i></a></li>            
                    <li class="hidden-sm-down">
                        <div class="input-group">
                            <input type="text" id="search-search" class="form-control" placeholder="Search...">
                            <span onclick="openPage('ec-product.jsp')" class="input-group-addon">
                                <i class="zmdi zmdi-search"></i>
                            </span>
                        </div>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right slideDown">
                        <li class="header">NOTIFICATIONS</li>
                        <li class="body">
                            <ul class="menu list-unstyled">
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-blue"><i class="zmdi zmdi-account"></i></div>
                                        <div class="menu-info">
                                            <h4>8 New Members joined</h4>
                                            <p><i class="zmdi zmdi-time"></i> 14 mins ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-amber"><i class="zmdi zmdi-shopping-cart"></i></div>
                                        <div class="menu-info">
                                            <h4>4 Sales made</h4>
                                            <p> <i class="zmdi zmdi-time"></i> 22 mins ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-red"><i class="zmdi zmdi-delete"></i></div>
                                        <div class="menu-info">
                                            <h4><b>Nancy Doe</b> Deleted account</h4>
                                            <p> <i class="zmdi zmdi-time"></i> 3 hours ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-green"><i class="zmdi zmdi-edit"></i></div>
                                        <div class="menu-info">
                                            <h4><b>Nancy</b> Changed name</h4>
                                            <p> <i class="zmdi zmdi-time"></i> 2 hours ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-grey"><i class="zmdi zmdi-comment-text"></i></div>
                                        <div class="menu-info">
                                            <h4><b>John</b> Commented your post</h4>
                                            <p> <i class="zmdi zmdi-time"></i> 4 hours ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-purple"><i class="zmdi zmdi-refresh"></i></div>
                                        <div class="menu-info">
                                            <h4><b>John</b> Updated status</h4>
                                            <p> <i class="zmdi zmdi-time"></i> 3 hours ago </p>
                                        </div>
                                    </a> </li>
                                <li> <a href="javascript:void(0);">
                                        <div class="icon-circle bg-light-blue"><i class="zmdi zmdi-settings"></i></div>
                                        <div class="menu-info">
                                            <h4>Settings Updated</h4>
                                            <p> <i class="zmdi zmdi-time"></i> Yesterday </p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="footer"> <a href="javascript:void(0);">View All Notifications</a> </li>
                    </ul>
                    </li>
                    <li class="dropdown"> 
                        <ul class="dropdown-menu dropdown-menu-right slideDown">
                            <li class="header">TASKS</li>
                            <li class="body">
                                <ul class="menu tasks list-unstyled">
                                    <li> <a href="javascript:void(0);">
                                            <div class="progress-container progress-primary">
                                                <span class="progress-badge">Footer display issue</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="86" aria-valuemin="0" aria-valuemax="100" style="width: 86%;">
                                                        <span class="progress-value">86%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li> <a href="javascript:void(0);">
                                            <div class="progress-container progress-info">
                                                <span class="progress-badge">Answer GitHub questions</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%;">
                                                        <span class="progress-value">35%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li> <a href="javascript:void(0);">
                                            <div class="progress-container progress-success">
                                                <span class="progress-badge">Solve transition issue</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100" style="width: 72%;">
                                                        <span class="progress-value">72%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0);">
                                            <div class="progress-container">
                                                <span class="progress-badge"> Create new dashboard</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                                                        <span class="progress-value">45%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li> <a href="javascript:void(0);">
                                            <div class="progress-container progress-warning">
                                                <span class="progress-badge">Panding Project</span>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100" style="width: 29%;">
                                                        <span class="progress-value">29%</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="javascript:void(0);">View All</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="fullscreen hidden-sm-down" data-provide="fullscreen" data-close="true"><i class="zmdi zmdi-fullscreen"></i></a>
                    </li>

                    <li class=""><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
                </ul>
            </div>
        </nav>

        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <div class="menu">
                <ul class="list">
                    <c:if test="${userObj.firstName!=null}">
                        <li>
                            <div class="user-info">
                                <div class="image"><a href="profile.html"><img src="assets/images/profile_av.jpg" alt="User"></a></div>
                                <div class="detail">
                                    <h4>${userObj.firstName}</h4>
                                    <small>${userObj.jobTitle}</small>                        
                                </div>
                                <a href="contact.html" title="Contact List"><i class="zmdi zmdi-account-box-phone"></i></a>
                                <a href="${pageContext.request.contextPath}/UserProfileServlet" title="Chat App"><i class="zmdi zmdi-comments"></i></a>
                                <a href="${pageContext.request.contextPath}/Logout" title="Sign out"><i class="zmdi zmdi-power"></i></a>
                            </div>
                        </li>
                    </c:if>
                    <li> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a>
                        <ul class="ml-menu">
                            <c:forEach items="${applicationScope.categories}" var="category">
                                <li><a href="ec-product.jsp?category=${category.categoryId}">${category.categoryName}</a> </li>
                                </c:forEach>

                        </ul>
                    </li>

                </ul>
            </div>
        </aside>

        <!-- Right Sidebar -->
        <aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setting"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#activity">Activity</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active slideRight" id="setting">
                    <div class="slim_scroll">
                        <div class="card">
                            <h6>Skins</h6>
                            <ul class="choose-skin list-unstyled">
                                <li data-theme="purple">
                                    <div class="purple"></div>
                                </li>                   
                                <li data-theme="blue">
                                    <div class="blue"></div>
                                </li>
                                <li data-theme="cyan" class="active">
                                    <div class="cyan"></div>                    
                                </li>
                                <li data-theme="green">
                                    <div class="green"></div>
                                </li>
                                <li data-theme="orange">
                                    <div class="orange"></div>
                                </li>
                                <li data-theme="blush">
                                    <div class="blush"></div>                    
                                </li>
                            </ul>                    
                        </div>
                        <div class="card">
                            <h6>Left Menu</h6>
                            <ul class="list-unstyled theme-light-dark">
                                <li>
                                    <div class="t-light btn btn-default btn-simple btn-round">Light</div>
                                </li>
                                <li>
                                    <div class="t-dark btn btn-default btn-round">Dark</div>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <h6>General Settings</h6>
                            <ul class="setting-list list-unstyled">
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox1" type="checkbox">
                                        <label for="checkbox1">Report Panel Usage</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox2" type="checkbox" checked="">
                                        <label for="checkbox2">Email Redirect</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox3" type="checkbox" checked="">
                                        <label for="checkbox3">Notifications</label>
                                    </div>                        
                                </li>
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox4" type="checkbox" checked="">
                                        <label for="checkbox4">Auto Updates</label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <h6>Account Settings</h6>
                            <ul class="setting-list list-unstyled">
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox5" type="checkbox" checked="">
                                        <label for="checkbox5">Offline</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="checkbox">
                                        <input id="checkbox6" type="checkbox" checked="">
                                        <label for="checkbox6">Location Permission</label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>                
                </div>       
               
                <div class="tab-pane slideRight" id="activity">
                    <div class="slim_scroll">
                        <div class="card">

                            <ul class="list-unstyled activity">
                                <c:if test="${userObj==null}">
                                <li>
                                    <a href="javascript:void(0)">
                                        <a href="${pageContext.request.contextPath}/sign-in.jsp" class="btn l-cyan btn-round btn-lg btn-block waves-effect waves-light">Sign in</a>
                                        <a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn l-cyan btn-round btn-lg btn-block waves-effect waves-light">Sign up</a>
                                    </a>
                                </li>
                                </c:if>
                               
                                <c:if test="${userObj!=null}">
                                <li>
                                    <a href="javascript:void(0)">
                                        <a href="${pageContext.request.contextPath}/home" class="btn l-cyan btn-round btn-lg btn-block waves-effect waves-light">Sign out</a>
                                    </a>
                                </li>
                                </c:if>
                               
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </aside>

        <!-- Chat-launcher -->
        <div class="chat-launcher"></div>
        <div class="chat-wrapper">
            <div class="card">
                <div class="header">
                    <ul class="list-unstyled team-info margin-0">
                        <li class="m-r-15"><h2>Design Team</h2></li>
                        <li>
                            <img src="assets/images/xs/avatar2.jpg" alt="Avatar">
                        </li>
                        <li>
                            <img src="assets/images/xs/avatar3.jpg" alt="Avatar">
                        </li>
                        <li>
                            <img src="assets/images/xs/avatar4.jpg" alt="Avatar">
                        </li>
                        <li>
                            <img src="assets/images/xs/avatar6.jpg" alt="Avatar">
                        </li>
                        <li>
                            <a href="javascript:void(0);" title="Add Member"><i class="zmdi zmdi-plus-circle"></i></a>
                        </li>
                    </ul>                       
                </div>
                <div class="body">
                    <div class="chat-widget">
                        <ul class="chat-scroll-list clearfix">
                            <li class="left float-left">
                                <img src="assets/images/xs/avatar3.jpg" class="rounded-circle" alt="">
                                <div class="chat-info">
                                    <a class="name" href="#">Alexander</a>
                                    <span class="datetime">6:12</span>                            
                                    <span class="message">Hello, John </span>
                                </div>
                            </li>
                            <li class="right">
                                <div class="chat-info"><span class="datetime">6:15</span> <span class="message">Hi, Alexander<br> How are you!</span> </div>
                            </li>
                            <li class="right">
                                <div class="chat-info"><span class="datetime">6:16</span> <span class="message">There are many variations of passages of Lorem Ipsum available</span> </div>
                            </li>
                            <li class="left float-left"> <img src="assets/images/xs/avatar2.jpg" class="rounded-circle" alt="">
                                <div class="chat-info"> <a class="name" href="#">Elizabeth</a> <span class="datetime">6:25</span> <span class="message">Hi, Alexander,<br> John <br> What are you doing?</span> </div>
                            </li>
                            <li class="left float-left"> <img src="assets/images/xs/avatar1.jpg" class="rounded-circle" alt="">
                                <div class="chat-info"> <a class="name" href="#">Michael</a> <span class="datetime">6:28</span> <span class="message">I would love to join the team.</span> </div>
                            </li>
                            <li class="right">
                                <div class="chat-info"><span class="datetime">7:02</span> <span class="message">Hello, <br>Michael</span> </div>
                            </li>
                        </ul>
                    </div>
                    <div class="input-group p-t-15">
                        <input type="text" class="form-control" placeholder="Enter text here...">
                        <span class="input-group-addon">
                            <i class="zmdi zmdi-mail-send"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <section class="content ecommerce-page">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Product
                            <small class="text-muted">Welcome to Compass</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Compass</a></li>
                            <li class="breadcrumb-item"><a href="ec-dashboard.html">eCommerce</a></li>
                            <li class="breadcrumb-item active">Product</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row clearfix">

                    <c:choose>
                        <c:when test="${!empty param.searchvalue}">
                            <c:forEach begin="0" end="${applicationScope.products.size()-1}" var="i"> 
                                <c:if test="${((applicationScope.products.get(i).productName).toLowerCase()).contains(param.searchvalue)}">
                                    <div class="col-lg-3 col-md-4 col-sm-12">

                                        <% /*
                                                                 ArrayList<beans.ProductBean> categories = (ArrayList<beans.ProductBean>) request.getAttribute("products");
                                                                 for(int i =0 ; i<categories.size();i++)
                                                                 {
                                        
                                                                 System.out.println("Size ************");
                                             */


                                        %>


                                        <div class="card product_item">
                                            <div class="body">
                                                <div class="cp_img">
                                                    <img src="assets/images/ecommerce/9.png" alt="Product" class="img-fluid" />
                                                    <div class="hover">
                                                        <a href="javascript:void(0);" class="btn btn-primary waves-effect"><i class="zmdi zmdi-plus"></i></a>
                                                    </div>
                                                </div>
                                                <div class="product_details">
                                                    <h5><a href="ec-product-detail.jsp?id=${applicationScope.products.get(i).productId}&index=${i}"><c:out value="${applicationScope.products.get(i).productName}"/></a></h5>
                                                    <ul class="product_price list-unstyled">
                                                        <li class="old_price"><fmt:formatNumber value="${applicationScope.products.get(i).price}" type="currency" currencySymbol="$"/></li>
                                                        <li class="new_price"><fmt:formatNumber value="${applicationScope.products.get(i).price+300}" type="currency" currencySymbol="$"/></li>
                                                    </ul>
                                                </div>
                                            </div>


                                        </div> 

                                        <%                     //      }

                                        %>

                                    </div>
                                </c:if>
                            </c:forEach>



                        </c:when> 
                        <c:when test="${!empty param.category}">
                            <fmt:parseNumber var = "category_id" type = "number" value = "${param.category}" />
                            <c:forEach begin="0" end="${applicationScope.products.size()-1}" var="i"> 

                                <c:if test="${category_id == applicationScope.products.get(i).cateegoryId}">
                                    <div class="col-lg-3 col-md-4 col-sm-12">

                                        <% /*
                                                                 ArrayList<beans.ProductBean> categories = (ArrayList<beans.ProductBean>) request.getAttribute("products");
                                                                 for(int i =0 ; i<categories.size();i++)
                                                                 {
                                        
                                                                 System.out.println("Size ************");
                                             */

                                        %>


                                        <div class="card product_item">
                                            <div class="body">
                                                <div class="cp_img">
                                                    
                                                    <img src="data:image/jpeg;base64,${applicationScope.products.get(i).productImage}" alt="Product" class="img-fluid" />
                                                    <div class="hover">
                                                        <a href="javascript:void(0);" class="btn btn-primary waves-effect"><i class="zmdi zmdi-plus"></i></a>
                                                    </div>
                                                </div>
                                                <div class="product_details">
                                                    <h5><a href="ec-product-detail.jsp?id=${applicationScope.products.get(i).productId}&index=${i}"><c:out value="${applicationScope.products.get(i).productName}"/></a></h5>
                                                    <ul class="product_price list-unstyled">
                                                        <li class="old_price"><fmt:formatNumber value="${applicationScope.products.get(i).price}" type="currency" currencySymbol="$"/></li>
                                                        <li class="new_price"><fmt:formatNumber value="${applicationScope.products.get(i).price+300}" type="currency" currencySymbol="$"/></li>
                                                    </ul>
                                                </div>
                                            </div>


                                        </div> 

                                        <%                     //      }

                                        %>

                                    </div>
                                </c:if>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <c:forEach begin="0" end="${applicationScope.products.size()-1}" var="i"> 
                                <div class="col-lg-3 col-md-4 col-sm-12">

                                    <% /*
                                                             ArrayList<beans.ProductBean> categories = (ArrayList<beans.ProductBean>) request.getAttribute("products");
                                                             for(int i =0 ; i<categories.size();i++)
                                                             {
                                        
                                                             System.out.println("Size ************");
                                         */

                                    %>


                                    <div class="card product_item">
                                        <div class="body">
                                            <div class="cp_img">
                                                <img src="data:image/jpeg;base64,${applicationScope.products.get(i).productImage}" alt="Product" class="img-fluid" />
                                                <div class="hover">
                                                    <a href="javascript:void(0);" class="btn btn-primary waves-effect"><i class="zmdi zmdi-plus"></i></a>
                                                    <a href="http://localhost:8084/Marketo/CartServlet?product_id=${applicationScope.products.get(i).productId}" class="btn btn-primary waves-effect"><i class="zmdi zmdi-shopping-cart"></i></a>

                                                </div>
                                            </div>
                                            <div class="product_details">
                                                <h5><a href="ec-product-detail.jsp?id=${applicationScope.products.get(i).productId}&index=${i}"><c:out value="${applicationScope.products.get(i).productName}"/></a></h5>
                                                <ul class="product_price list-unstyled">
                                                    <li class="old_price"><fmt:formatNumber value="${applicationScope.products.get(i).price}" type="currency" currencySymbol="$"/></li>
                                                    <li class="new_price"><fmt:formatNumber value="${applicationScope.products.get(i).price+300}" type="currency" currencySymbol="$"/></li>
                                                </ul>
                                            </div>
                                        </div>


                                    </div> 

                                    <%                     //      }

                                    %>

                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </section>
        <script type="text/javascript">
            function openPage(pageURL)
            {

                var x = document.getElementById('search-search').value;
                if (x != null && x != "")
                {
                    window.location.href = pageURL + "?searchvalue=" + x;
                } else {
                    alert("enter product Name ");
                }

            }
        </script>
        <!-- Jquery Core Js --> 
        <script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
    </body>
</html>
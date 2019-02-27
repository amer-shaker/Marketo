<!doctype html>
<html class="no-js " lang="en">
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.ArrayList"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

        <title>ec-product-details</title>
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
        <%@include file="pageHeader.jsp" %>

        <!-- left side -->
        <%@include file="leftSideMenu.jsp" %>

        <!-- Right Sidebar -->
        <%@include file="rightSideMenu.jsp" %>

        <!-- Chat-launcher -->

        <section class="content ecommerce-page">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Product Detail
                            <small class="text-muted">Welcome to Compass</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Compass</a></li>
                            <li class="breadcrumb-item"><a href="ec-dashboard.html">eCommerce</a></li>
                            <li class="breadcrumb-item active">Product Detail</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body">
                                <div class="row">
                                    <div class="preview col-lg-4 col-md-12">
                                        <div class="preview-pic tab-content">
                                            <div class="tab-pane active" id="product_1"><img src="assets/images/ecommerce/1.png" class="img-fluid" /></div>
                                            <div class="tab-pane" id="product_2"><img src="assets/images/ecommerce/2.png" class="img-fluid"/></div>
                                            <div class="tab-pane" id="product_3"><img src="assets/images/ecommerce/3.png" class="img-fluid"/></div>
                                            <div class="tab-pane" id="product_4"><img src="assets/images/ecommerce/4.png" class="img-fluid"/></div>
                                            <div class="tab-pane" id="product_5"><img src="assets/images/ecommerce/5.png" class="img-fluid"/></div>
                                        </div>
                                        <ul class="preview-thumbnail nav nav-tabs">
                                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#product_1"><img src="assets/images/ecommerce/1.png" /></a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_2"><img src="assets/images/ecommerce/2.png" /></a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_3"><img src="assets/images/ecommerce/3.png" /></a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_4"><img src="assets/images/ecommerce/4.png" /></a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#product_5"><img src="assets/images/ecommerce/5.png" /></a></li>                                    
                                        </ul>                
                                    </div>
                                    <div class="details col-lg-8 col-md-12">
                                        <h3 class="product-title m-b-0">${applicationScope.products.get(Integer.parseInt(param.index)).productName}</h3>
                                        <h4 class="price m-t-0">Current Price: <span class="col-amber"><fmt:formatNumber value="${applicationScope.products.get(Integer.parseInt(param.index)).price}" type="currency" currencySymbol="$"/></span></h4>

                                        <hr>
                                        <p class="product-description">${applicationScope.products.get(Integer.parseInt(param.index)).describtion}</p>

                                        <hr>
                                        <div class="action">
                                            <button class="btn btn-primary btn-round waves-effect" type="button">add to cart</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#description">Description</a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#review">Review</a></li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#about">About</a></li>
                            </ul>
                        </div>
                        <div class="card">
                            <div class="body">                        
                                <div class="tab-content">
                                    <div class="tab-pane active" id="description">
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                                    </div>
                                    <div class="tab-pane" id="review">
                                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied</p>
                                        <ul class="row list-unstyled c_review">
                                            <li class="col-12">
                                                <div class="avatar">
                                                    <a href="#"><img class="rounded" src="assets/images/xs/avatar2.jpg" alt="user" width="60"></a>
                                                </div>                                
                                                <div class="comment-action">
                                                    <h5 class="c_name">Hossein Shams</h5>
                                                    <p class="c_msg m-b-0">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. </p>
                                                    <div class="badge badge-primary">iPhone 8</div>
                                                    <span class="m-l-10">
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star-outline text-muted"></i></a>
                                                    </span>
                                                    <small class="comment-date float-sm-right">Dec 21, 2017</small>
                                                </div>                                
                                            </li>
                                            <li class="col-12">
                                                <div class="avatar">
                                                    <a href="#"><img class="rounded" src="assets/images/xs/avatar3.jpg" alt="user" width="60"></a>
                                                </div>                                
                                                <div class="comment-action">
                                                    <h5 class="c_name">Tim Hank</h5>
                                                    <p class="c_msg m-b-0">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout</p>
                                                    <div class="badge badge-primary">Nokia 8</div>
                                                    <span class="m-l-10">
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star col-amber"></i></a>
                                                        <a href="#"><i class="zmdi zmdi-star-outline text-muted"></i></a>
                                                    </span>
                                                    <small class="comment-date float-sm-right">Dec 18, 2017</small>
                                                </div>                                
                                            </li>                                   
                                        </ul>
                                    </div>
                                    <div class="tab-pane" id="about">
                                        <h6>Where does it come from?</h6>
                                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </section>
        <!-- Jquery Core Js --> 
        <script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
    </body>
</html>
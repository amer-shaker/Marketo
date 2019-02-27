<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/RecentOrdersServlet" flush="true" />

<!doctype html>
<html class="no-js " lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

        <title>Marketo</title>

        <!-- Favicon-->
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>
        <link rel="stylesheet" href="assets/plugins/morrisjs/morris.css" />

        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/ecommerce.css">
        <link rel="stylesheet" href="assets/css/color_skins.css">
    </head>

    <body class="theme-cyan">
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

        <!-- Left side -->
        <%@include file="leftSideMenu.jsp" %>

        <!-- Right Side Bar -->
        <%@include file="rightSideMenu.jsp" %>

        <!-- Main Content -->
        <section class="content ecommerce-page">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Recent Orders
                            <small class="text-muted">Welcome to Marketo</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Marketo </a></li>
                            <li class="breadcrumb-item"><a href="ec-dashboard.html">eCommerce</a></li>
                            <li class="breadcrumb-item active">Recent Orders</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2><strong>Recent</strong> Orders</h2>
                            <ul class="header-dropdown">
                                <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                    <ul class="dropdown-menu dropdown-menu-right slideUp">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else</a></li>
                                    </ul>
                                </li>
                                <li class="remove">
                                    <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="body table-responsive members_profiles">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Order No.</th>
                                        <th>Name</th>
                                        <th>Email Address</th>
                                        <th>Address</th>
                                        <th>Order Date</th>                                    
                                        <th>Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="orders" value="${requestScope.orders}" />
                                    <c:if test="${orders != null}">
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td>
                                                    <c:out value="${order.orderId}" />
                                                </td>
                                                <td>
                                                    <c:out value="${order.user.userName}" />
                                                </td>
                                                <td>
                                                    <span class="email">
                                                        <a href="javascript:void(0);" title="">
                                                            <i class="zmdi zmdi-email m-r-5"></i>
                                                            <c:out value="${order.user.emailAddress}" />
                                                        </a>
                                                    </span>     
                                                </td>
                                                <td>
                                                    <address><i class="zmdi zmdi-pin"></i>
                                                        <c:out value="${order.user.address}" />
                                                    </address>
                                                </td>
                                                <td>
                                                    <c:out value="${order.orderDate}" />
                                                </td>
                                                <td>
                                                    <c:out value="$ ${order.orderPrice}" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
    </section>

    <!-- Jquery Core Js --> 
    <script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
    <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

    <script src="assets/bundles/morrisscripts.bundle.js"></script> <!-- Morris Plugin Js -->
    <script src="assets/bundles/sparkline.bundle.js"></script> <!-- Sparkline Plugin Js -->
    <script src="assets/bundles/knob.bundle.js"></script> <!-- Jquery Knob Plugin Js -->

    <script src="assets/bundles/mainscripts.bundle.js"></script>
    <script src="assets/js/pages/ecommerce.js"></script>
    <script src="assets/js/pages/charts/jquery-knob.min.js"></script>
</body>

</html>
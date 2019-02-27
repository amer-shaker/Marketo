<%-- 
    Document   : Users
    Created on : Feb 21, 2019, 11:29:42 AM
    Author     : Aya
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="isFirstRequest" value="${requestScope.isFirstRequest}"/>
<c:if test="${requestScope.isFirstRequest == null}">
    <jsp:include page="/UsersReviewServlet" flush="true" />
</c:if>

<!doctype html>
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
        <link rel="stylesheet" href="assets/plugins/footable-bootstrap/css/footable.bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/footable-bootstrap/css/footable.standalone.min.css">

        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/color_skins.css">
    </head>

    <body class="theme-cyan">
        <!-- Page Loader -->
        <div class="page-loader-wrapper">
            <div class="loader">
                <div class="m-t-30"><img class="zmdi-hc-spin" src="assets/images/logo.svg" width="48" height="48"
                                         alt="Compass"></div>
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
        
        <section class="content contact">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Users
                            <small class="text-muted">Welcome to Marketo</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Compass</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">eCommerce</a></li>
                            <li class="breadcrumb-item active">Users</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="body table-responsive">
                                <c:if test="${requestScope.users != null}">
                                    <table class="table table-hover m-b-0 c_list">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>                                    
                                                <th data-breakpoints="xs">Phone</th>
                                                <th data-breakpoints="xs sm md">Email</th>
                                                <th data-breakpoints="xs sm md">Address</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${requestScope.users}">
                                                <tr>
                                                    <td>
                                                        <c:out value="${user.userId}"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${user.userName}"/>
                                                    </td>
                                                    <td>
                                                        <span class="phone">
                                                            <i class="zmdi zmdi-phone m-r-10"></i>
                                                            <c:out value="${user.phoneNumber}"/>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="email">
                                                            <a href="javascript:void(0);" title="">
                                                                <i class="zmdi zmdi-email m-r-5"></i>
                                                                <c:out value="${user.emailAddress}"/>
                                                            </a>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <address>
                                                            <i class="zmdi zmdi-pin"></i>
                                                            <c:out value="${user.address}"/>
                                                        </address>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>
                        </div>
                        <div class="card">
                            <div class="body">                            
                                <ul class="pagination pagination-primary m-b-0">
                                    <li class="page-item"><a class="page-link" href="#"><i class="zmdi zmdi-arrow-left"></i></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#"><i class="zmdi zmdi-arrow-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/bundles/libscripts.bundle.js"></script>
        <script src="assets/bundles/vendorscripts.bundle.js"></script>

        <script src="assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

        <script src="assets/bundles/mainscripts.bundle.js"></script>
        <script src="assets/js/pages/tables/footable.js"></script><!-- Custom Js -->
    </body>

</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="isFirstRequest" value="${requestScope.isFirstRequest}" />
<c:if test="${isFirstRequest == null}">
    <jsp:include page="/ProductListServlet" flush="true" />
</c:if>

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
        <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert.css"/>
        <link rel="stylesheet" href="assets/plugins/footable-bootstrap/css/footable.bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/footable-bootstrap/css/footable.standalone.min.css">

        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/ecommerce.css">
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

        <section class="content ecommerce-page">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Product List
                            <small class="text-muted">Welcome to Marketo</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <form action="ec-add-product.jsp" method="GET">
                            <button type="submit" class="btn btn-primary btn-icon btn-round hidden-sm-down float-right m-l-10">
                                <i class="zmdi zmdi-plus"></i>
                            </button>
                        </form>
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Marketo</a></li>
                            <li class="breadcrumb-item"><a href="ec-recent-orders.jsp">eCommerce</a></li>
                            <li class="breadcrumb-item active">Product List</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-12">
                        <div class="card product_item_list">
                            <div class="body table-responsive">
                                <form action="ec-add-product.jsp" method="GET">
                                    <button type="submit" class="btn btn-round btn-info waves-effect">Add Product</button>
                                </form>
                                <table class="table table-hover m-b-0">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Product Name</th>
                                            <th data-breakpoints="sm xs">Detail</th>
                                            <th data-breakpoints="xs">Amount</th>
                                            <th data-breakpoints="xs md">Stock</th>
                                            <th data-breakpoints="sm xs md">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="products" value="${requestScope.products}" />
                                        <c:if test="${products != null}">
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td><img src="data:image/jpeg;base64,${product.productImage}" width="48">
                                                    </td>
                                                    <td>
                                                        <h5>
                                                            <c:out value="${product.productName}" />
                                                        </h5>
                                                    </td>
                                                    <td>
                                                        <span class="text-muted">
                                                            <c:out value="${product.describtion}" />
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <c:out value="$ ${product.price}" />
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${product.quantity == 0}">
                                                                <span class="col-red">Out Of Stock</span>
                                                            </c:when>

                                                            <c:when test="${product.quantity > 0 && product.quantity <= 10}">
                                                                <span class="col-amber">Low Stock</span>
                                                            </c:when>

                                                            <c:when test="${product.quantity > 10}">
                                                                <span class="col-green">In Stock</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <form action="ProductListServlet" method="POST">
                                                            <input type="hidden" name="productId" value="${product.productId}" />
                                                            <button name="actionType" value="editProduct" type="submit" class="btn btn-default btn-icon btn-simple btn-icon-mini btn-round"><i class="zmdi zmdi-edit"></i></button>
                                                            <button name="actionType" value="deleteProduct" type="submit" class="btn btn-default btn-icon btn-simple btn-icon-mini btn-round"><i class="zmdi zmdi-delete"></i></button> 
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--                        <div class="row clearfix js-sweetalert col-md-12 col-lg-6">
                                                    <button class="btn btn-raised btn-primary waves-effect btn-round" data-type="confirm">CLICK ME</button>
                                                </div>                            -->
                        <div class="card">
                            <div class="body">
                                <ul class="pagination pagination-primary m-b-0">
                                    <li class="page-item"><a class="page-link" href="#"><i
                                                class="zmdi zmdi-arrow-left"></i></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#"><i
                                                class="zmdi zmdi-arrow-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Jquery Core Js -->
        <script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
        <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
        <script src="assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
        <script src="assets/plugins/sweetalert/sweetalert.min.js"></script> <!-- SweetAlert Plugin Js --> 
        <script src="assets/bundles/mainscripts.bundle.js"></script> <!-- Custom Js -->
        <script src="assets/js/pages/tables/footable.js"></script> <!-- Custom Js -->
        <script src="assets/js/pages/ui/dialogs.js"></script>

    </body>

</html>
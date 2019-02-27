<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/AddProductServlet" flush="true" />

<!doctype html>
<html class="no-js " lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

        <title>Marketo</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

        <!-- Bootstrap Select Css -->
        <link rel="stylesheet" href="assets/plugins/bootstrap-select/css/bootstrap-select.css" />

        <!-- Custom Css -->
        <link rel="stylesheet" href="assets/css/main.css">
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

        <!-- left side -->
        <%@include file="leftSideMenu.jsp" %>

        <!-- Right Sidebar -->
        <%@include file="rightSideMenu.jsp" %>

        <section class="content">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>Add / Edit Product
                            <small class="text-muted">Welcome to Marketo</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Marketo</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">eCommerce</a></li>
                            <li class="breadcrumb-item active">Add / Edit Products</li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <!-- Basic Validation -->
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="header">
                                <h2><strong>Add</strong> Product</h2>
                                <ul class="header-dropdown">
                                    <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                        <ul class="dropdown-menu dropdown-menu-right">
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
                            <div class="body">
                                <form id="form_validation" action="AddProductServlet" method="POST" enctype="multipart/form-data">
                                    <c:set var="product" value="${requestScope.product}" />
                                    <div class="row clearfix">
                                        <div class="col-sm-4"> 
                                            <p> <b>PRODUCT NAME</b> </p>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Product Name" name="productName" 
                                                       <c:if test="${product != null}">
                                                           value="${product.productName}"
                                                       </c:if> required />
                                            </div>
                                        </div>            
                                        <div class="col-sm-4"> 
                                            <p> <b>PRICE</b> </p>
                                            <div class="form-group">                                   
                                                <input type="number" class="form-control" placeholder="Ex: 99,99 $" min="0" name="price" 
                                                       <c:if test="${product != null}">
                                                           value="${product.price}"
                                                       </c:if> required />
                                            </div>
                                        </div>
                                        <div class="col-sm-4"> 
                                            <p> <b>QUANTITY</b> </p>
                                            <div class="form-group">                                   
                                                <input type="number" class="form-control" placeholder="0" name="quantity" 
                                                       <c:if test="${product != null}">
                                                           value="${product.quantity}"
                                                       </c:if> min="0" required />                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-sm-8"> 
                                            <p> <b>DESCRIPTION</b> </p>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Describtion" name="describtion" 
                                                       <c:if test="${product != null}">
                                                           value="${product.describtion}"
                                                       </c:if> required />  
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <p> <b>CATEGORY</b> </p>
                                            <select name="categoryId" class="form-control show-tick z-index" data-live-search="true">
                                                <c:set var="productCategories" value="${requestScope.categories}" />
                                                <c:if test="${productCategories != null}">
                                                    <c:forEach var="category" items="${productCategories}">
                                                        <option 
                                                            value="${category.categoryId}">
                                                            <c:out value="${category.categoryName}" />
                                                        </option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"> 
                                            <p> <b>PRODUCT IMAGE</b> </p>
                                            <div class="form-group">
                                                <img id="productImageDisplay" width="128" height="128" src="assets/images/product-image.svg" /> 
                                                <input type="file" onchange="loadFile(event)" class="form-control" name="productImage" size="5" accept="/*" required />   
                                            </div>
                                        </div>    
                                    </div>
                                    <button class="btn btn-raised btn-primary btn-round waves-effect" type="submit" name="actionType"
                                            <c:if test="${product != null}">
                                                value="editProduct"
                                            </c:if>
                                            <c:if test="${product == null}">
                                                value="addProduct"
                                            </c:if>>
                                        <c:if test="${product != null}">
                                            <c:out value="EDIT PRODUCT" />
                                        </c:if>
                                        <c:if test="${product == null}">
                                            <c:out value="ADD PRODUCT" />
                                        </c:if>
                                    </button>            
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Basic Validation --> 
            </div>
        </section>

        <!-- Jquery Core Js --> 
        <script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
        <script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

        <script src="assets/plugins/jquery-validation/jquery.validate.js"></script> <!-- Jquery Validation Plugin Css --> 
        <script src="assets/plugins/jquery-steps/jquery.steps.js"></script> <!-- JQuery Steps Plugin Js --> 

        <script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js --> 
        <script src="assets/js/pages/forms/form-validation.js"></script>
        <script>
                                                    function loadFile(event) {
                                                        var output = document.getElementById("productImageDisplay");
                                                        output.height = 128;
                                                        output.hidden = false;
                                                        output.src = URL.createObjectURL(event.target.files[0]);
                                                    }
                                                    ;
        </script>
    </body>

</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="user" value="${requestScope.user}"/>
<!doctype html>
<html class="no-js" lang="en">
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
                                         alt="Marketo"></div>
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home"><img src="assets/images/logo.svg" width="30"
                                                                                                alt="Marketo"><span class="m-l-10">Marketo</span></a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="javascript:void(0);" class="ls-toggle-btn" data-close="true"><i
                                class="zmdi zmdi-swap"></i></a></li>
                    <li class="hidden-sm-down">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-addon">
                                <i class="zmdi zmdi-search"></i>
                            </span>
                        </div>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="javascript:void(0);" class="fullscreen hidden-sm-down" data-provide="fullscreen"
                           data-close="true"><i class="zmdi zmdi-fullscreen"></i></a>
                    </li>
                    <li><a href="sign-in.html" class="mega-menu" data-close="true"><i class="zmdi zmdi-power"></i></a></li>
                    <li class=""><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i
                                class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
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
                                <div class="image"><a href="${pageContext.request.contextPath}/UserProfileServlet"><img src="assets/images/profile_av.jpg" alt="User"></a></div>
                                <div class="detail">
                                    <h4>${userObj.firstName}</h4>
                                    <small>${userObj.jobTitle}</small>                        
                                </div>
                                <a href="${pageContext.request.contextPath}/UserProfileServlet" title="Profile"><i class="zmdi zmdi-account"></i></a>
                                <a href="${pageContext.request.contextPath}/Logout" title="Sign out"><i class="zmdi zmdi-power"></i></a>
                                <a href="${pageContext.request.contextPath}/home" title="Home"><i class="zmdi zmdi-home"></i></a>
                            </div>
                        </li>
                    </c:if>
                    <li> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-apps"></i><span>App</span>
                        </a>
                        <ul class="ml-menu">
                            <li><a href="ec-contact.html">Contact list</a></li>
                        </ul>
                    </li>
                    <li class="active open"> <a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-shopping-cart"></i><span>Catergories</span> </a>
                        <ul class="ml-menu">
                            <li class="active"> <a href="${pageContext.request.contextPath}/ec-dashboard.jsp">Dashboard</a></li>
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
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#activity">Activity</a></li>
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setting"><i
                            class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#chat"><i
                            class="zmdi zmdi-comments"></i></a></li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active slideRight" id="setting">
                    <div class="slim_scroll">
                        <div class="card">
                            <h6>Skins</h6>
                            <ul class="choose-skin list-unstyled">  
                                <li data-theme="cyan" class="active">
                                    <div class="cyan"></div>
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
                    </div>
                </div>
                <div class="tab-pane right_chat pullUp" id="chat">
                    <div class="slim_scroll">
                        <div class="card">
                            <div class="search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-addon">
                                        <i class="zmdi zmdi-search"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="tab-pane slideRight" id="activity">
                    <div class="slim_scroll">
                        <div class="card">
                            <h6>Recent Activity</h6>
                            <ul class="list-unstyled activity">
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="zmdi zmdi-cake bg-blue"></i>
                                        <div class="info">
                                            <h4>Admin Birthday</h4>
                                            <small>Will be Dec 21th</small>
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <section class="content">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Compass</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Forms</a></li>
                            <li class="breadcrumb-item active">Form Validation</li>
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
                                <h2><strong>Edit Profile</strong></h2>
                            </div>
                            <div class="body">
                                <form action="EditUserProfile" method="POST" enctype="multipart/form-data">
                                    <c:if test="${user.image != null}">
                                        <img id="userImageDisplay" src="data:image/jpeg;base64,${user.image}" style="margin:50px 30px ; border-radius: 50%; width:250px ; height:250px"/>
                                    </c:if> 
                                    <c:if test="${user.image == null}">
                                        <img id="userImageDisplay" src="images.png" style="margin:50px 30px ; border-radius: 50%; width:250px ; height:250px"/>
                                    </c:if> 
                                    <input type="file" onchange="loadFile(event)" name="userPhoto" value="upload" accept="image/*" title="&nbsp;" style="margin:20px 10px ;"/>
                                    <div class="row clearfix">
                                        <div class="col-lg-3 col-md-5"> 
                                            <b>First Name</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"> <i class="material-icons">account_box</i> </span>
                                                <input type="text" class="form-control" value="${user.firstName}" placeholder="FirstName"name="firstName" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-5"> 
                                            <b>Last Name</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"> <i class="material-icons">account_box</i> </span>
                                                <input type="text" class="form-control" value="${user.lastName}" placeholder="LastName" name="lastName" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-5"> <b>User Name</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"> <i class="material-icons">account_circle</i> </span>
                                                <input type="text" class="form-control email" value="${user.userName}" placeholder="userName" name="userName" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-lg-3 col-md-4"> <b>Email Address</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                                                <input type="text" class="form-control email" value="${user.emailAddress}" placeholder="Ex: example@example.com" name="email" required>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4"> <b>Address</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="material-icons">home</i></span>
                                                <input type="text" class="form-control email"  value="${user.address}" placeholder="Ex: example@example.com" name="address">
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4"> <b>Credit Card</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="zmdi zmdi-card"></i></span>
                                                <input type="text" class="form-control credit-card" value="${user.cardNumber}" placeholder="Ex: 0000 0000 0000 0000" name="cardNumber" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row clearfix">
                                        <div class="col-lg-3 col-md-4"> <b>Date of birth</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="zmdi zmdi-calendar"></i> </span>
                                                <input style="border:none"  type="date" value="${user.dateOfBirth}" placeholder="Ex: 30/07/2016" name="date">
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4"> <b>Password</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"> <i class="material-icons">lock</i> </span>
                                                <input type="text" class="form-control date"  value="${user.password}" name="password">
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4"> <b>Job Title</b>
                                            <div class="input-group">
                                                <span class="input-group-addon"> <i class="material-icons">work</i> </span>
                                                <input type="text" class="form-control date"  value="${user.jobTitle}" name="jobTitle">
                                            </div>
                                        </div>
                                    </div>
                                    <button style="margin:40px 0;" type="submit" class="btn btn-raised btn-primary btn-round waves-effect">SUBMIT</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <script src="assets/bundles/libscripts.bundle.js"></script>
        <script src="assets/bundles/vendorscripts.bundle.js"></script>
        <script>
                                        function loadFile(event) {
                                            var output = document.getElementById("userImageDisplay");
                                            output.height = 50;
                                            output.hidden = false;
                                            output.src = URL.createObjectURL(event.target.files[0]);
                                        }
                                        ;
        </script>
        <script src="assets/plugins/jquery-validation/jquery.validate.js"></script>  
        <script src="assets/plugins/jquery-steps/jquery.steps.js"></script>

        <script src="assets/bundles/mainscripts.bundle.js"></script>
        <script src="assets/js/pages/forms/form-validation.js"></script> 
    </body>

</html>
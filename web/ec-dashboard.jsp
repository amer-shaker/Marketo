<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/DashboardServlet" flush="true" />
<c:set var="totalNumberOfOrders" value="${requestScope.totalNumberOfOrders}" />
<c:set var="totalNumberOfUsers" value="${requestScope.totalNumberOfUsers}" />
<c:set var="totalNumberOfProducts" value="${requestScope.totalNumberOfProducts}" />

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
        <nav class="navbar">
            <div class="col-12">        
                <div class="navbar-header">
                    <a href="javascript:void(0);" class="bars"></a>
                    <a class="navbar-brand" href="index.html"><img src="assets/images/logo.svg" width="30" alt="Compass"><span class="m-l-10">Compass</span></a>
                </div>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="javascript:void(0);" class="ls-toggle-btn" data-close="true"><i class="zmdi zmdi-swap"></i></a></li>            
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
                    <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="zmdi zmdi-notifications"></i>
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
                    <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="zmdi zmdi-flag"></i>
                            <div class="notify"><span class="heartbit"></span><span class="point"></span></div>
                        </a>
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
                    <li><a href="sign-in.html" class="mega-menu" data-close="true"><i class="zmdi zmdi-power"></i></a></li>
                    <li class=""><a href="javascript:void(0);" class="js-right-sidebar" data-close="true"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
                </ul>
            </div>
        </nav>

        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <div class="menu">
                <ul class="list">
                    <li>
                        <div class="user-info">
                            <div class="image"><a href="profile.html"><img src="assets/images/profile_av.jpg"
                                                                           alt="User"></a></div>
                            <div class="detail">
                                <h4>Michael</h4>
                                <small>UI UX Designer</small>
                            </div>
                            <a href="events.html" title="Events"><i class="zmdi zmdi-calendar"></i></a>
                            <a href="mail-inbox.html" title="Inbox"><i class="zmdi zmdi-email"></i></a>
                            <a href="contact.html" title="Contact List"><i class="zmdi zmdi-account-box-phone"></i></a>
                            <a href="chat.html" title="Chat App"><i class="zmdi zmdi-comments"></i></a>
                            <a href="sign-in.html" title="Sign out"><i class="zmdi zmdi-power"></i></a>
                        </div>
                    </li>
                    <li class="active open"> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-apps"></i><span>App</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="active"> <a href="ec-dashboard.jsp">Dashboard</a></li>                            
                        </ul>
                    </li>
                    <li> <a href="javascript:void(0);" class="menu-toggle"><i
                                class="zmdi zmdi-shopping-cart"></i><span>Ecommerce</span> </a>
                        <ul class="ml-menu">
                            <li> <a href="ec-users.jsp">Users List</a></li>                            
                            <li> <a href="ec-recent-orders.jsp">Recent Orders</a></li>
                            <li> <a href="ec-product-List.jsp">Product List</a></li>
                            <li> <a href="ec-add-product.jsp">Add / Edit Products</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Right Sidebar -->
        <aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#setting"><i class="zmdi zmdi-settings zmdi-hc-spin"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#chat"><i class="zmdi zmdi-comments"></i></a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#activity">Activity</a></li>
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
                        <div class="card">
                            <h6>Recent</h6>
                            <ul class="list-unstyled">
                                <li class="online">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar4.jpg" alt="">
                                            <div class="media-body">
                                                <span class="name">Sophia</span>
                                                <span class="message">There are many variations of passages of Lorem Ipsum available</span>
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>                            
                                </li>
                                <li class="online">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar5.jpg" alt="">
                                            <div class="media-body">
                                                <span class="name">Grayson</span>
                                                <span class="message">All the Lorem Ipsum generators on the</span>
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>                            
                                </li>
                                <li class="offline">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar2.jpg" alt="">
                                            <div class="media-body">
                                                <span class="name">Isabella</span>
                                                <span class="message">Contrary to popular belief, Lorem Ipsum</span>
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>                            
                                </li>
                                <li class="me">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar1.jpg" alt="">
                                            <div class="media-body">
                                                <span class="name">John</span>
                                                <span class="message">It is a long established fact that a reader</span>
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>                            
                                </li>
                                <li class="online">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar3.jpg" alt="">
                                            <div class="media-body">
                                                <span class="name">Alexander</span>
                                                <span class="message">Richard McClintock, a Latin professor</span>
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>                            
                                </li>                        
                            </ul>
                        </div>
                        <div class="card">
                            <h6>Contacts</h6>
                            <ul class="list-unstyled">
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar10.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar6.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar7.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar8.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar9.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="online inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar5.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar4.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar3.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="online inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar2.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="offline inlineblock">
                                    <a href="javascript:void(0);">
                                        <div class="media">
                                            <img class="media-object " src="assets/images/xs/avatar1.jpg" alt="">
                                            <div class="media-body">
                                                <span class="badge badge-outline status"></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
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
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="zmdi zmdi-file-text bg-red"></i>
                                        <div class="info">
                                            <h4>Code Change</h4>                    
                                            <small>Will be Dec 22th</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="zmdi zmdi-account-box-phone bg-green"></i>
                                        <div class="info">
                                            <h4>Add New Contact</h4>                    
                                            <small>Will be Dec 23th</small>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="zmdi zmdi-email bg-amber"></i>
                                        <div class="info">
                                            <h4>New Email</h4>
                                            <small>Will be July 28th</small>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <h6>Project Status</h6>
                            <div class="progress-container progress-primary">
                                <span class="progress-badge">eCommerce Website</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="86" aria-valuemin="0" aria-valuemax="100" style="width: 86%;">
                                        <span class="progress-value">86%</span>
                                    </div>
                                </div>                        
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Team</small></li>
                                    <li>
                                        <img src="assets/images/xs/avatar2.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar3.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar4.jpg" alt="Avatar">
                                    </li>                            
                                </ul>
                            </div>
                            <div class="progress-container">
                                <span class="progress-badge">iOS Game Dev</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                                        <span class="progress-value">45%</span>
                                    </div>
                                </div>
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Team</small></li>
                                    <li>
                                        <img src="assets/images/xs/avatar10.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar9.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar8.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar7.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar6.jpg" alt="Avatar">
                                    </li>
                                </ul>
                            </div>
                            <div class="progress-container progress-warning">
                                <span class="progress-badge">Home Development</span>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100" style="width: 29%;">
                                        <span class="progress-value">29%</span>
                                    </div>
                                </div>
                                <ul class="list-unstyled team-info">
                                    <li class="m-r-15"><small>Team</small></li>
                                    <li>
                                        <img src="assets/images/xs/avatar5.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar2.jpg" alt="Avatar">
                                    </li>
                                    <li>
                                        <img src="assets/images/xs/avatar7.jpg" alt="Avatar">
                                    </li>                            
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <section class="content ecommerce-page">
            <div class="block-header">
                <div class="row">
                    <div class="col-lg-7 col-md-6 col-sm-12">
                        <h2>eCommerce Dashboard
                            <small class="text-muted">Welcome to Marketo</small>
                        </h2>
                    </div>
                    <div class="col-lg-5 col-md-6 col-sm-12">
                        <ul class="breadcrumb float-md-right">
                            <li class="breadcrumb-item"><a href="index.html"><i class="zmdi zmdi-home"></i> Compass</a></li>
                            <li class="breadcrumb-item"><a href="ec-dashboard.html">eCommerce</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-lg-4 col-md-12">
                        <div class="card tasks_report">
                            <div class="header">
                                <h2><strong>Total</strong> Orders</h2>
                                <ul class="header-dropdown">
                                    <li class="dropdown"> <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="zmdi zmdi-more"></i> </a>
                                        <ul class="dropdown-menu dropdown-menu-right slideUp float-right">
                                            <li><a href="javascript:void(0);">Edit</a></li>
                                            <li><a href="javascript:void(0);">Delete</a></li>
                                            <li><a href="javascript:void(0);">Report</a></li>
                                        </ul>
                                    </li>
                                    <li class="remove">
                                        <a role="button" class="boxs-close"><i class="zmdi zmdi-close"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="body text-center">
                                <h4 class="m-t-0">Total Orders</h4>
                                <h6 class="m-b-20">
                                    <c:out value="${totalNumberOfOrders}" />
                                </h6>
                                <input type="text" class="knob dial1" 
                                       value="${totalNumberOfOrders}" 
                                       data-width="140" data-height="140" data-thickness="0.1" data-fgColor="#00ced1" readonly>
                                <h6 class="m-t-30">Satisfaction Rate</h6>
                                <small class="displayblock">47% Average <i class="zmdi zmdi-trending-up"></i></small>
                                <div class="sparkline m-t-20" data-type="bar" data-width="97%" data-height="45px" data-bar-Width="2" data-bar-Spacing="8" data-bar-Color="#00ced1">3,2,6,5,9,8,7,8,4,5,1,2,9,5,1,3,5,7,4,6</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="header">
                                <h2><strong>Total</strong> Income</h2>                        
                            </div>
                            <div class="body">
                                <h3 class="m-b-0">47,012</h3>
                                <small class="displayblock">23% Average <i class="zmdi zmdi-trending-up"></i></small>
                                <div class="sparkline" data-type="line" data-spot-Radius="1" data-highlight-Spot-Color="rgb(63, 81, 181)" data-highlight-Line-Color="#222"
                                     data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(63, 81, 181)" data-spot-Color="rgb(63, 81, 181, 0.7)"
                                     data-offset="90" data-width="100%" data-height="60px" data-line-Width="1" data-line-Color="rgb(63, 81, 181, 0.7)"
                                     data-fill-Color="rgba(221,94,137, 0.2)"> 1,2,3,1,4,3,6,4,4,1 </div>                        
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <h2><strong>Total</strong> Orders</h2>                        
                            </div>
                            <div class="body">
                                <h3 class="m-b-0">512</h3>
                                <small class="displayblock">18% Average <i class="zmdi zmdi-trending-down"></i></small>
                                <div class="sparkline" data-type="line" data-spot-Radius="1" data-highlight-Spot-Color="rgb(63, 81, 181)" data-highlight-Line-Color="#222"
                                     data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(120, 184, 62)" data-spot-Color="rgb(63, 81, 181, 0.7)"
                                     data-offset="90" data-width="100%" data-height="60px" data-line-Width="1" data-line-Color="rgb(63, 81, 181, 0.7)"
                                     data-fill-Color="rgba(128,133,233, 0.2)"> 4,5,2,8,4,8,7,4,8,5</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="header">
                                <h2><strong>Total</strong> Number of Products</h2>                        
                            </div>
                            <div class="body">
                                <h3 class="m-b-0">
                                    <c:out value="${totalNumberOfProducts}" />
                                </h3>
                                <small class="displayblock">13% Average <i class="zmdi zmdi-trending-up"></i></small>
                                <div class="sparkline" data-type="line" data-spot-Radius="1" data-highlight-Spot-Color="rgb(63, 81, 181)" data-highlight-Line-Color="#222"
                                     data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(120, 184, 62)" data-spot-Color="rgb(63, 81, 181, 0.7)"
                                     data-offset="90" data-width="100%" data-height="60px" data-line-Width="1" data-line-Color="rgb(63, 81, 181, 0.7)"
                                     data-fill-Color="rgba(44,168,255, 0.2)">1,5,9,3,5,7,8,5,2,3,5,7</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <h2><strong>Total</strong> Active Users</h2>                        
                            </div>
                            <div class="body">
                                <h3 class="m-b-0">
                                    <c:out value="${totalNumberOfUsers}" />
                                </h3>
                                <small class="displayblock">17% Average <i class="zmdi zmdi-trending-up"></i></small>
                                <div class="sparkline" data-type="line" data-spot-Radius="1" data-highlight-Spot-Color="rgb(63, 81, 181)" data-highlight-Line-Color="#222"
                                     data-min-Spot-Color="rgb(233, 30, 99)" data-max-Spot-Color="rgb(120, 184, 62)" data-spot-Color="rgb(63, 81, 181, 0.7)"
                                     data-offset="90" data-width="100%" data-height="60px" data-line-Width="1" data-line-Color="rgb(63, 81, 181, 0.7)"
                                     data-fill-Color="rgba(0,0,0, 0.2)">8,6,4,2,3,6,5,7,9,8,5,2</div>
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
        <script src="assets/bundles/jvectormap.bundle.js"></script> <!-- JVectorMap Plugin Js -->
        <script src="assets/bundles/flotscripts.bundle.js"></script> <!-- flot charts Plugin Js --> 
        <script src="assets/bundles/sparkline.bundle.js"></script> <!-- Sparkline Plugin Js -->
        <script src="assets/bundles/knob.bundle.js"></script> <!-- Jquery Knob Plugin Js -->

        <script src="assets/bundles/mainscripts.bundle.js"></script>
        <script src="assets/js/pages/ecommerce.js"></script>
        <script src="assets/js/pages/charts/jquery-knob.min.js"></script>
    </body>

</html>
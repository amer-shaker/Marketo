<%-- 
    Document   : leftSideMenu
    Created on : Feb 27, 2019, 3:21:50 PM
    Author     : Amer Shaker
--%>

<!-- Left Sidebar -->
<aside id="leftsidebar" class="sidebar">
    <div class="menu">
        <ul class="list">
<<<<<<< HEAD

            <div class="user-info">
                <div class="image"><a href="${pageContext.request.contextPath}/UserProfileServlet">
                        <img src="assets/images/profile_av.jpg" alt="User"></a></div>
                <div class="detail">
                    <h4>${adminObj.firstName}</h4>
                    <small>${adminObj.jobTitle}</small>                        
=======
            <li>
                <div class="user-info">
                    <div class="image"><a href="profile.html"><img src="assets/images/profile_av.jpg"
                                                                   alt="User"></a></div>
                    <div class="detail">
                        <h4>Amer</h4>
                        <small>Web & Mobile Developer</small>
                    </div>
                    <a href="ec-users.jsp" title="Contact List"><i class="zmdi zmdi-account-box-phone"></i></a>
                    <a href="profile.jsp" title="Profile"><i class="material-icons">account_box</i></a>
                    <a href="sign-in.html" title="Sign out"><i class="zmdi zmdi-power"></i></a>
>>>>>>> 2bb8431fd7dcc7c5c2bbc314ee466ae6984a028b
                </div>
                <a href="${pageContext.request.contextPath}/UserProfileServlet" title="Profile"><i class="zmdi zmdi-account"></i></a>
                <a href="${pageContext.request.contextPath}/Logout" title="Sign out"><i class="zmdi zmdi-power"></i></a>
                <a href="ec-dashboard.jsp" title="Home"><i class="zmdi zmdi-home"></i></a>
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
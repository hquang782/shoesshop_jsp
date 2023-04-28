<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>Header</title>
<link href="<c:url value="/assets/style/user/layout-out.css"/>" rel="stylesheet" type="text/css" media="all"/>
<header class="header ">
    <div class="container-header">
        <div class="container-header--flex">
            <div class="wrap-logo">
                <a href="#"><img src="../assets/img/demo.png" alt=""></a>
            </div>
            <div class="wrap-link">
                <ul class="main-link">
                    <li><a href="#">Home</a></li>
                    <div class="dropdown-home"></div>
                    <li><a href="#">Products</a></li>
                    <div class="dropdown-product"></div>
                    <li><a href="#">Store</a></li>
                    <li><a href="#">Blogs</a></li>
                    <div class="dropdown-blog"></div>
                </ul>
            </div>
            <div class="wrap-search">
                <form action="#" method="get">
                    <input type="text" name="" id="" placeholder="Search here">
                </form>
            </div>
            <div class="wrap-action">
                <div class="account">
                    <a href="#">Accounts</a>
                </div>
                <div class="cart">
                    <a href="#">Cart</a>
                </div>
            </div>
        </div>
    </div>
</header>

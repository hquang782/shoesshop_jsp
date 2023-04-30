<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>Header</title>
<link href="<c:url value="/assets/style/user/layout-out.css"/>" rel="stylesheet" type="text/css" media="all"/>
<header class="header ">
    <div class="container-header">
        <div class="container-header--flex">
            <div class="wrap-logo">
                <a href="#"><img src="<c:url value="/assets/img/demo.png"/>" alt=""></a>
            </div>
            <div class="wrap-link">
                <ul class="main-link">
                    <li><a href="<c:url value="/home"/>">Trang chủ</a></li>
                    <li><a href="<c:url value="/home"/>">Giới thiệu</a></li>
                    <li><a href="<c:url value="/products"/>">Sản phẩm</a></li>
                    <li><a href="<c:url value="/products"/>">Liên hệ</a></li>
                    <li><a href="/policy">Store</a></li>
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

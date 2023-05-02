<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dev4fun.model.Cart" %>
<%@ page import="com.dev4fun.utils.CartUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<title>Header</title>
<link href="<c:url value="/assets/style/user/layout-out.css"/>" rel="stylesheet" type="text/css" media="all"/>
<header class="header ">
    <%
        ArrayList<Cart> listCarts = CartUtil.getCart(request);
    %>
    <div class="container-header">
        <div class="container-header--flex">
            <div class="wrap-logo">
                <a href="#"><img src="<c:url value="/assets/img/demo.png"/>" alt=""></a>
            </div>
            <div class="wrap-link">
                <ul class="main-link">
                    <li><a href="<c:url value="/home"/>">Trang chủ</a></li>
                    <li><a href="<c:url value="/about/about-us"/>">Giới thiệu</a></li>
                    <li><a href="<c:url value="/products"/>">Sản phẩm</a></li>
                    <li><a href="<c:url value="/about/contact"/>">Liên hệ</a></li>
                    <li><a href="<c:url value="/about/policy-rule"/>">Store</a></li>
                </ul>
            </div>
            <div class="wrap-search">
                <form action="<c:url value="/products"/>" method="get">
                    <input type="text" name="search" placeholder="Tìm kiếm bằng tên sản phẩm">
                </form>
            </div>
            <div class="wrap-action">
                <div class="header-cart">
                    <div class="header-cart-wrap">
                        <div class="header__cart-icon" onclick="handleClickCart();">
                            <i class="fa-solid fa-cart-shopping">
                                <span class="header__cart-notice"></span>
                            </i>
                        </div>
                        <div class="header__cart-list open-cart">
                            <%
                                if (listCarts.size() == 0) {
                            %>
                            <div class="no-cart">
                                <img src="<c:url value="/assets/img/no_cart.png"/>" alt="" class="header__cart-no-cart-img">
                                <p class="header__cart-list-no-cart-msg">
                                    Chưa có sản phẩm
                                </p>
                            </div>
                            <%} else {%>
                            <div class="list-cart-item">
                                <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                <ul class="header__cart-list-item">
                                    <%for (Cart cart : listCarts) {%>
                                    <li class="header__cart-item">
                                        <div class="header__cart-item-img">
                                            <a href="/products/<%=cart.getProduct().getName().replaceAll(" ", "-") + "-" + cart.getProduct().getId()%>">
                                                <img src="<%=cart.getProduct().getImageLink()%>" class="product-img" alt="loi">
                                            </a>
                                        </div>
                                        <div class="header__cart-item-info">
                                            <p class="header__cart-item-info-name"><%=cart.getProduct().getName()%>
                                            </p>
                                            <div style="text-align: left">
                                                <p class="header__cart-item-info-price"><%=cart.getProduct().getPrice()%><sup>đ</sup></p>
                                                <p class="header__cart-item-info-price"><%=cart.getQuantity()%>
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <hr class="item_hr"/>
                                    <%}%>
                                </ul>
                            </div>
                            <%}%>
                            <button class="list-cart-item-button">
                                <a href="#">Xem giỏ hàng</a>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="account">
                    <a href="#">Accounts</a>
                </div>
            </div>
        </div>
    </div>
</header>

<script src="<c:url value="/assets/js/user.layout.js"/>" type="text/javascript"></script>

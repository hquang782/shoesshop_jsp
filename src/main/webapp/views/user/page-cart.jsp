<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="<c:url value="/assets/style/user/cart-style.css"/>"/>
<div class="main">
    <div class="navigate">
        <a href="<c:url value="/home"/>">Trang chủ</a>
        <span>/</span>
        <a href="<c:url value="/cart"/>">Giỏ hàng</a>
    </div>
    <div class="content">
        <div class="left-side">
            <div class="mainCart-detail">
                <div class="heading-cart">
                    <h1>Giỏ hàng của bạn</h1>
                </div>
                <form action="/cart" method="post">
                    <p class="title-number-cart">Bạn đang có <strong>2 sản phẩm</strong>
                        trong giỏ hàng</p>
                    <div class="table-cart">
                        <div class="wrapper-item-cart item-cart">
                            <div class="wrapper-image">
                                <div class="item-img">
                                    <img
                                        src="//product.hstatic.net/200000532555/product/c7pol001m-021_243fffeb4d934fd3ab7de421df8b464b_medium.jpg">
                                </div>
                                <div class="item-remove">
                                    <a href="">Xóa</a>
                                </div>
                            </div>

                            <div class="wrapper-info">
                                <div class="item-info">
                                    <div class="title">
                                        <a href="">Áo Polo nam cổ dệt phối màu C7POL001M</a>
                                    </div>
                                    <div class="size">
                                        <span>Size: S</span>
                                    </div>
                                </div>
                                <div class="price">
                                    <span>249,000đ</span>
                                </div>
                            </div>

                            <div class="wrapper-total">
                                <div class="item-total-price">
                                    <span>498,000đ</span>
                                </div>
                                <div class="item-qty">
                                    <div class="quantity">
                                        <div class="quantity-set">
                                            <div class="quantity-reduce">
                                                <div>-</div>
                                            </div>
                                            <div class="quatity-value">
                                                <p id="quantityValue">2</p>
                                            </div>
                                            <div class="quantity-increase">
                                                <div>+</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="right-side">
            <div class="mainCart-sidebar wrap-order-summary">
                <div class="order-summary-block">
                    <h2 class="summary-title">Thông tin đơn hàng</h2>
                    <div class="summary-total">
                        <p>Tổng tiền: <span class="total-final">498,000₫</span></p>
                    </div>
                    <div class="summary-action">
                        <div class="summary-alert alert alert-danger">
                            FreeShip toàn quốc với đơn hàng từ 500.000Đ
                        </div>
                        <div class="summary-button">
                            <a id="btnCart-checkout" class="checkout-btn btnred" href="#">THANH TOÁN</a>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
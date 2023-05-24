<%@page import="java.util.ArrayList"%>
<%@page import="com.dev4fun.utils.CartUtil"%>
<%@page import="com.dev4fun.model.Cart"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    ArrayList<Cart> cart=new CartUtil().getCart(request);
    
%>
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
                    <p class="title-number-cart">Bạn đang có <strong><%=cart.size()%> sản phẩm</strong>
                        trong giỏ hàng</p>
                    <div class="table-cart">
                        <%
                            for(Cart c:cart)
                            {
                            
                        
                        %>
                        <div class="wrapper-item-cart item-cart">
                            <div class="wrapper-image">
                                <div class="item-img">
                                    <img
                                        src="<%=c.getProduct().getImageLink()%>">
                                </div>
                                <div class="item-remove">
                                    <form action="/cart" method="post">
                                        <input type="hidden" name="productId"
                                               value="<%=c.getProduct().getId()%>">
                                        <input type="hidden" name="quantity" value="0">
                                        <input type="submit" class="btn btn-primary" value="Xóa">
                                    </form>
                                    
                                </div>
                            </div>

                            <div class="wrapper-info">
                                <div class="item-info">
                                    <div class="title">
                                        <a href=""><%=c.getProduct().getName()%></a>
                                    </div>
                                    <div class="size">
                                        <span>Size: S</span>
                                    </div>
                                </div>
                                <div class="price">
                                    <span><%=c.getProduct().getPrice()%></span>
                                </div>
                            </div>

                            <div class="wrapper-total">
                                <div class="item-total-price">
                                    <span>498,000đ</span>
                                </div>
                                <div class="item-qty">
                                    <div class="quantity">
                                        <div class="quantity-set">
                                            <div class="quantity-reduce" >
                                                <div onclick="">-</div>
                                            </div>
                                            <div class="quatity-value">
                                                <input id="quantityValue" type="number" value="<%=c.getQuantity()%>" min="1" >
                                            </div>
                                            <div class="quantity-increase" >
                                                <div onclick="">+</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         <form action="/cart" method="post" >
                        <button type="submit" onclick="getValue()">
                            Cap nhat
                        </button>
                        <input id ="qtt" type="hidden" name="quantity" >
                        <input type="hidden" name="productId" value="<%=c.getProduct().getId()%>">
                        </form>        
                            
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                
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
<script>
    function getValue() {
        var input=document.getElementById("quantityValue").value;
        document.getElementById("qtt").value=input;
    }
     function Add() {
        var input=Number(document.getElementById("quantityValue").value);
        
            document.getElementById("quantityValue").value=input+1;
        
        
    }
    function Sub() {
        var input=Number(document.getElementById("quantityValue").value);
        if(input>1){
            document.getElementById("quantityValue").value=input-1;
        }
        
    }                   
</script>
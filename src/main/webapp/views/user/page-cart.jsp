<%@page import="com.dev4fun.dao.ProductDAO"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.dev4fun.utils.CartUtil" %>
<%@page import="com.dev4fun.model.Cart" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="<c:url value="/assets/style/user/cart-style.css"/>"/>
<div class="main">
    <%
        ArrayList<Cart> cart = new CartUtil().getCart(request);
        ProductDAO pdao = new ProductDAO();
        Float total=Float.valueOf(0);
    %>
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
                <form action="<c:url value="/cart"/>" method="get">
                    <input type="hidden" name="act" value="update">
                    <p class="title-number-cart">Bạn đang có <strong><%=cart.size()%> sản phẩm</strong>
                        trong giỏ hàng</p>
                    <div class="table-cart">
                        <%for (Cart c : cart) {%>
                        <div class="wrapper-item-cart item-cart">
                            <div class="wrapper-image">
                                <div class="item-img">
                                    <img src="<%=c.getProduct().getImageLink()%>">
                                </div>
                                <div class="item-remove">
                                    <a href="/cart?act=remove&productId=<%=c.getProduct().getId()%>&size=<%=c.getSize()%>" onclick="return confirm('Bạn chắc chắn không?')">Xóa</a>
                                </div>
                            </div>

                            <div class="wrapper-info">
                                <div class="item-info">
                                    <div class="title">
                                        <a href=""><%=c.getProduct().getName()%>
                                        </a>
                                    </div>
                                        <input type="hidden" name="size" value="<%=c.getSize()%>">
                                    <div class="size">
                                        <span>Size: <%=c.getSize()%></span>
                                        
                                    </div>
                                </div>
                                <div class="price">
                                    <span><%=c.getProduct().getPrice()%></span>
                                </div>
                            </div>

                            <div class="wrapper-total">
                                <div class="item-total-price">
                                    <span><%=c.getProduct().getPrice()*c.getQuantity()%></span>
                                </div>
                                <div class="item-qty">
                                    <div class="quantity">
                                        <div class="quantity-set">
                                            <div class="quantity-reduce">
                                                <div onclick="Sub(<%=c.getProduct().getId()%><%=c.getSize()%>)">-</div>
                                            </div>
                                            <div class="quatity-value">
                                                <input id="quantityValue<%=c.getProduct().getId()%><%=c.getSize()%>" type="number" value="<%=c.getQuantity()%>" min="1" name="quantity" max="<%=pdao.getQuantityBySize(c.getProduct().getId(),c.getSize() )%>">
                                            </div>
                                            <div class="quantity-increase">
                                                <div onclick="Add(<%=c.getProduct().getId()%><%=c.getSize()%>)">+</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <%
                            total+=c.getProduct().getPrice()*c.getQuantity();
                            }
                        %>
                    </div>
                    
                    <button type="submit">
                    Cập nhật
                    </button>
                </form>
            </div>
        </div>
                    
        <div class="right-side">
            <div class="mainCart-sidebar wrap-order-summary">
                <div class="order-summary-block">
                    <h2 class="summary-title">Thông tin đơn hàng</h2>
                    <div class="summary-total">
                        <p>Tổng tiền: <span class="total-final"><%=(long)(Math.round(total))%>Đ</span></p>
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
 function Add(id) {
        var input = Number(document.getElementById("quantityValue"+id).value);
        
            document.getElementById("quantityValue"+id).value = input + 1;
        

    }

    function Sub(id) {
        var input = Number(document.getElementById("quantityValue"+id).value);
        if (input > 1) {
            document.getElementById("quantityValue"+id).value = input - 1;
        }
    }
</script>
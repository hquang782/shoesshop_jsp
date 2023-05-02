<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dev4fun.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.dev4fun.model.ProductDetail" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="<c:url value="/assets/style/user/product-detail.css"/>" rel="stylesheet" type="text/css"/>
<div class="main">
    <%
        Product product = (Product) request.getAttribute("product");
        ArrayList<String> listImages = new ArrayList<>(List.of(product.getImageList().split(",")));
        NumberFormat nf = NumberFormat.getNumberInstance();
        int quantity = 1;
    %>
    <div class="product">
        <div class="product-top">
            <a href="<c:url value="/home"/>">Trang chủ</a>
            <span>/</span>
            <a href="/products?category=<%=product.getCategoryId()%>"><%=product.getCategoryId()%>
            </a>
            <span>/</span>
            <a href="/products/<%=product.getName().replaceAll(" ", "-") + "-" + product.getId()%>"><%=product.getName()%>
            </a>
        </div>
        <div class="product-content">
            <div class="product-content-left">
                <div class="product-content-left-big-img">
                    <img src="<%=product.getImageLink()%>" alt="">
                </div>
                <div class="product-content-left-small-img">
                    <%for (String image : listImages) {%>
                    <img src="<%=image%>" alt="">
                    <%}%>
                </div>
            </div>
            <div class="product-content-right">
                <div class="product-content-right-product-name">
                    <h1><%=product.getName()%>
                    </h1>
                    <div class="product-content-right-product-name-danhgia row">
                        <span>Mã sản phẩm: <%="SP" + product.getId()%></span>
                    </div>
                </div>
                <div class="product-content-right-product-price">
                    <p><%=nf.format(product.getPrice())%><sup>đ</sup></p>
                </div>
                <div class="product-content-right-product-size">
                    <p style="font-weight: bold; font-size: 18px;">Size:</p>
                    <div class="size">
                        <%for (ProductDetail pd : product.getProductDetails()) {%>
                        <span><%=pd.getSize()%></span>
                        <%}%>
                    </div>
                </div>
                <div class="quantity">
                    <p style="font-weight: bold;">Số lượng:</p>
                    <div class="quantity-set">
                        <div class="quantity-reduce">
                            <div style="font-weight: bold;" >-</div>
                        </div>
                        <div class="quatity-value">
                            <p id="quantityValue"><%=quantity%>
                            </p>
                        </div>
                        <div class="quantity-increase">
                            <div style="font-weight: bold;" onclick="dcd()">+</div>
                        </div>
                    </div>

                </div>
                <div class="product-content-right-product-button">
                    <div class="product-content-right-product-button-cart">
                        <button>
                            <a href="/cart?act=add&&id=<%=product.getId()%>&&qtt=<%=quantity%>>">THÊM VÀO GIỎ HÀNG</a>
                        </button>
                    </div>
                    <div class="product-content-right-product-button-mua">
                        <button>
                            <a href="/delivery">MUA NGAY</a>
                        </button>
                    </div>
                </div>
                <div class="product-content-right-bottom">
                    <div class="product-content-right-bottom-content-big">
                        <div class="product-content-right-bottom-content-title">
                            <div class="product-content-right-bottom-content-title-item mota">
                                <p>Mô tả sản phẩm </p>
                            </div>
                        </div>
                        <div class="product-content-right-bottom-content">
                            <%=product.getDescription()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const bigImg = document.querySelector(".product-content-left-big-img img")
    const smallImg = document.querySelectorAll(".product-content-left-small-img img")
    smallImg.forEach(function (imgItem, X) {
        imgItem.addEventListener("click", function () {
            bigImg.src = imgItem.src
        })
    })

    function dcd() {
        <%
            System.out.println(quantity);
            quantity += 1;
        %>
    }
</script>

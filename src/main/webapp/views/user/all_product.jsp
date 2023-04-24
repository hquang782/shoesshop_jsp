<%-- 
    Document   : all_product
    Created on : Apr 23, 2023, 4:29:13 PM
    Author     : son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dev4fun.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dev4fun.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
    <link href="../../assets/style/all_product-style.css" rel="stylesheet" type="text/css"/>
    <div class="wraper">
        <!-- Banner-header -->
        <div class= " banner-header">
            <img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__340.jpg" alt="ảnh ">
        </div>
        <!--  -->
        <div class="bgwhite-heading">
            <h1 class="title">Tất cả sản phẩm</h1>
        </div>
        <!--  -->
        <div class="container-filter">
            <div class="wrapper-layer-filter">
                <div class="layer-filter-group">
                    <!-- Bộ lọc -->
                    <div class="layer-filter-title">
                        <p class="title-filter">
                            <span class="icon-filter"><i class="fa-solid fa-filter"></i></span>
                            Bộ lọc 
                        </p>
                    </div>
                    <!-- filter type -->


                    <!-- filter price  -->

                    <div class="filter-group-block">
                        <div class="filter-group-subtitle">
                            <span>Giá</span>
                            <span class="icon-control"> <i class="fa-solid fa-chevron-down"></i></span>
                        </div>
                        <div class="filter-group-content filter-type">
                            <ul class="checkbox-list">
                                <li>
                                    <input type="checkbox" onchange="" id="price-range-1" value="1" name="price1">
                                    <label for="price-range-1">Dưới 300$</label>
                                </li>
                                <li>
                                    <input type="checkbox" onchange="" id="price-range-2" value="2" name="price2">
                                    <label for="price-range-2">Từ 300$ - 800$</label>
                                </li>
                                <li>
                                    <input type="checkbox" onchange="" id="price-range-3" value="3" name="price3">
                                    <label for="price-range-3">Từ 800$ - 1500$</label>
                                </li>
                            </ul>

                        </div>
                    </div>

                    <!-- filter category -->


                    <!-- filter chat lieu -->
                    <div class="filter-group-block">
                        <div class="filter-group-subtitle">
                            <span>Chất liệu</span>
                            <span class="icon-control"> <i class="fa-solid fa-chevron-down"></i></span>
                        </div>
                        <div class="filter-group-content filter-type">
                            <ul class="checkbox-list">
                                <li>
                                    <input onchange="chonTh()" type="checkbox" id="da" name="chatlieu" value="Da">
                                    <label for="da">Da</label>
                                </li>
                                <li>
                                    <input onchange="chonTh()" type="checkbox" id="vaicanvas" name="chatlieu" value="Kanvas">
                                    <label for="vaicanvas">Kanvas</label>
                                </li>
                                <li>
                                    <input onchange="chonTh()" type="checkbox" id="dalon" name="chatlieu" value="Dalon">
                                    <label for="dalon">Da lộn</label>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- product  -->
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

        %>
        <div class="container-product">
            <div class="home-product">

                <div class="grid">
                    <%                        for (Product p : products) {

                    %>
                    <div class="grid__column-2-4">
                        <div class="home-product-item">
                            <div class="home-product-item__img home-product-add-cart"
                                 style="background-image: url(<%=p.getImageLink()%>)"></div>
                            <div class="home-product-item__properties">
                                <h5 class="home-product-item__name"><%=p.getName()%></h5>
                                <div class="home-product-item__infor">
                                    <div class="home-product-item__price"><%=p.getPrice()%></div>
                                </div>
                                <div title="Thêm vào giỏ hàng" class="home-product-item__add-cart" onclick="">
                                    <i class="fa-solid fa-cart-plus"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>`
                </div>
            </div>
        </div>

    </div> 
    <div class="pagination">
        <c:forEach begin="1" end="${endp}" var="i">
            <a href="allproduct?loai_giay=${loai_giay}&p=${i}">${i}</a>
        </c:forEach>
    </div>
    <script type="text/javascript" src="../../assets/js/all.product.js"></script>

</body>
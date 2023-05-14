<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dev4fun.model.Product" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.NumberFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="<c:url value="/assets/style/user/product-style.css"/>" rel="stylesheet" type="text/css"/>
<div class="wraper">
    <!-- Banner-header -->
    <div class=" banner-header">
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

                <div class="filter-group-block">
                    <div class="filter-group-subtitle">
                        <span>Giá</span>
                        <span class="icon-control"> <i class="fa-solid fa-chevron-down"></i></span>
                    </div>
                    <div class="filter-group-content filter-type">
                        <ul class="checkbox-list">
                            <li>
                                <input type="checkbox" onchange="" id="price-range-2" value="2" name="price2">
                                <label for="price-range-2">Tăng dần</label>
                            </li>
                            <li>
                                <input type="checkbox" onchange="" id="price-range-3" value="3" name="price3">
                                <label for="price-range-3">Giảm dần</label>
                            </li>
                        </ul>

                    </div>
                </div>

                <div class="filter-group-block">
                    <div class="filter-group-subtitle">
                        <span>Thể loại</span>
                        <span class="icon-control"><i class="fa-solid fa-chevron-down"></i></span>
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
        ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");
        NumberFormat nf = NumberFormat.getNumberInstance();
    %>
    <div class="container-product">
        <div class="home-product">
            <div class="grid">
                <% for (Product product : listProducts) {%>
                <div class="grid__column-2-4">
                    <a href="/products/<%=product.getName().replaceAll(" ", "-") + "-" + product.getId()%>">
                        <div class="home-product-item">
                            <div class="home-product-item__img home-product-add-cart"
                                 style="background-image: url(<%=product.getImageLink()%>)"></div>
                            <div class="home-product-item__properties">
                                <h5 class="home-product-item__name"><%=product.getName()%>
                                </h5>
                                <div class="home-product-item__infor">
                                    <div class="home-product-item__price"><%=nf.format(product.getPrice())%>
                                        <sup>đ</sup>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%}%>
            </div>
        </div>
    </div>

</div>
<%--<div class="pagination">--%>
<%--    <c:forEach begin="1" end="${endPage}" var="i">--%>
<%--        <a href="products?category=${category}&p=${i}">${i}</a>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<script type="text/javascript" src="<c:url value="/assets/js/user.product.js"/>"></script>


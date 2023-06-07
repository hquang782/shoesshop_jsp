<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dev4fun.model.Product" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.NumberFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="<c:url value="/assets/style/user/product-style.css"/>" rel="stylesheet" type="text/css"/>
<div class="wraper">
    <div class="bgwhite-heading">
        <h1 class="title">Tất cả sản phẩm</h1>
    </div>
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
                                <input onchange="chonTh()" type="checkbox" id="vaicanvas" name="chatlieu"
                                       value="Kanvas">
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
        int sIndex = 0, eIndex = listProducts.size();
        if (request.getParameter("startIndex") != null) {
            sIndex = Integer.parseInt(request.getParameter("startIndex"));
        }
        if (sIndex + 5 < listProducts.size()) eIndex = sIndex + 5;
    %>
    <div class="container-product">
        <div class="home-product">
            <div class="grid">
                <%


                    for (int i = sIndex; i < eIndex; i++) {%>
                <div class="grid__column-2-4">
                    <a href="/products/<%=listProducts.get(i).getName().replaceAll(" ", "-") + "-" + listProducts.get(i).getId()%>">
                        <div class="home-product-item">
                            <div class="home-product-item__img home-product-add-cart"
                                 style="background-image: url(<%=listProducts.get(i).getImageLink()%>)"></div>
                            <div class="home-product-item__properties">
                                <h5 class="home-product-item__name"><%=listProducts.get(i).getName()%>
                                </h5>
                                <div class="home-product-item__infor">
                                    <div class="home-product-item__price"><%=nf.format(listProducts.get(i).getPrice())%>
                                        <sup>đ</sup>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <%}%>
            </div>
            <div class="wrapper-action-table" style="display: flex; justify-content: right; align-items: center;">
                <div class="index">
                    <% String pageIndex;
                        if (request.getParameter("pageIndex") != null) pageIndex = request.getParameter("pageIndex");
                        else pageIndex = "1/" + (int) Math.ceil(listProducts.size() / 12.0);
                    %>
                    <p id="currentPage"><%=pageIndex%>
                    </p>
                </div>
                <form action="<c:url value="/products"/>" method="get" style="display: flex">
                    <input style="display: none" id="st" name="startIndex">
                    <input style="display: none" id="page" name="pageIndex">
                    <div class="previous">
                        <button onclick="previousPages()">&#8592;</button>
                    </div>
                    <div class="next">
                        <button onclick="nextPages()">&#8594;</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<%--<div class="pagination">--%>
<%--    <c:forEach begin="1" end="${endPage}" var="i">--%>
<%--        <a href="products?category=${category}&p=${i}">${i}</a>--%>
<%--    </c:forEach>--%>
<%--</div>--%>
<script>
    const dataLength =
    <%=listProducts.size()%>
    const rowPerPage = 12
</script>
<script type="text/javascript" src="<c:url value="../../assets/js/pagination.js"/>"></script>


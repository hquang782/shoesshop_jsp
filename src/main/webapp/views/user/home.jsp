<%@page import="com.dev4fun.dao.ProductDAO" %>
<%@page import="com.dev4fun.model.Product" %>
<%@page import="com.dev4fun.model.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<link href="<c:url value="/assets/style/user/home-style.css"/>" rel="stylesheet" type="text/css"/>
<div class="main">
    <div class="container">
        <%
            ArrayList<Category> listCategories = (ArrayList<Category>) request.getAttribute("listCategories");
            NumberFormat nf = NumberFormat.getNumberInstance();
        %>
        <nav>
            <% for (Category category : listCategories) {%>
            <a href="<c:url value="/products?category=<%=category.getName()%>"/>" class="nav-item">
                <img src="https://tyhisneaker.com/wp-content/uploads/2022/08/eme-2.png" alt="hình ảnh ">
                <b class="item-text">
                    <%=category.getName()%>
                </b>
            </a>
            <%}%>
        </nav>

        <%for (Category category : listCategories) {%>
        <div class="list-product">
            <div class="head-product">
                <div class="brand"><%=category.getName()%>
                </div>
                <a href="<c:url value="/products?category=<%=category.getName()%>"/>" class="allProduct">Tất cả sản phẩm</a>
            </div>
            <%ArrayList<Product> listProducts = new ProductDAO().getProductsByCategoryId(category.getId());%>
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
        <%}%>
    </div>
</div>
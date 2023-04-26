<%@page import="com.dev4fun.dao.ProductDAO"%>
<%@page import="com.dev4fun.model.Product"%>
<%@page import="com.dev4fun.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dev4fun.model.Category"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<body>
    <link href="../../assets/style/home_user-style.css" rel="stylesheet" type="text/css"/>
    <!-- nav -->
    <div class="container">
        <%
            List<Category> category = (List<Category>)request.getAttribute("category");

        %>
        <nav>
            <%                for (Category c : category) {
            %>
            <a href="home/products?loai_giay=<%=c.getName()%>" class="nav-item">
                <img src="https://tyhisneaker.com/wp-content/uploads/2022/08/eme-2.png" alt="hình ảnh ">
                <b class="item-text">
                    <%=c.getName()%>
                </b>
            </a>
            <%
                }
            %>
        </nav>

        <%
            for (Category c : category) {

        %>
        <div class="list-product">
            <div class="head-product">

                <div class="brand"><%=c.getName()%></div>
                <a href="home/allproduct?loai_giay=<%=c.getName()%>" class="allProduct">Tất cả sản phẩm ></a>
            </div>
            <%
                List<Product> products = new ProductDAO().getProductByCategory(c.getId());

            %>
            <div class="container-product">
                <div class="home-product">
                    <div class="grid">
                        <%                            for (Product p : products) {
                        %>
                        <div class="grid__column-2-4">

                            <div class="home-product-item">

                                <div class="home-product-item__img home-product-add-cart"
                                     style="background-image: url(<%=p.getImageLink()%>)"></div>
                                <div class="home-product-item__properties">
                                    <h5 class="home-product-item__name">
                                        <%=p.getName()%>
                                    </h5>
                                    <div class="home-product-item__infor">
                                        <div class="home-product-item__price">
                                            <%=p.getPrice()%>
                                        </div>
                                        <div class="home-product-item__quantity">

                                        </div>
                                    </div>
                                    <div title="Thêm vào giỏ hàng" class="home-product-item__add-cart">
                                        <i class="fa-solid fa-cart-plus"></i>
                                    </div>

                                </div>

                            </div>


                        </div>
                        <%
                            }
                        %>

                    </div>

                </div>
            </div>


        </div>

        <%
            }
        %>

        <!--  -->


    </div>



</body>
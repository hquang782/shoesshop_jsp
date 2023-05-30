<%@ page import="com.dev4fun.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Sản phẩm</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <div class="main-container">

            <div class="wrapper-main-container">
                <div class="action-table">
                    <button id="btnAddProduct" class="btn-add"><a href="<c:url value="/admin/product/add"/>">Thêm sản
                        phẩm</a></button>
                    <%--<button class="btn-export">Xuất file Excel</button>--%>
                </div>

                <div class="table-content">
                    <div class="search-table-content">
                        <div class="wrapper-search">
                            <form method="get" action="<c:url value="/admin/product"/>">
                                <div class="search-option">
                                    <select name="t" id="optionSearchTable">
                                        <% if (request.getParameter("t") != null) {%>
                                        <option value="${valueSearch}" selected>${typeSearch}</option>
                                        <%} else {%>
                                        <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                        <%}%>
                                        <option value="name" style="display: ${name}">Tên sản phẩm</option>
                                        <option value="status" style="display: ${status}">Trạng thái</option>
                                        <option value="category" style="display: ${category}">Danh mục</option>
                                    </select>
                                </div>
                                <div class="search-value">
                                    <input type="text" name="v" placeholder="Gõ ở đây..." value="${txt_sproduct}">
                                </div>

                                <div class="btn-search">
                                    <button type="submit">Tìm kiếm</button>
                                </div>
                            </form>

                        </div>

                    </div>
                    <div class="wrapper-table-content">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Trạng thái</th>
                                <th>Giá bán</th>
                                <th>Danh mục</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>
                            <% ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");
//                                Gson gson = new Gson();
//                                String jsonProducts = gson.toJson(listProducts);
                                int sIndex = 0, eIndex = listProducts.size();
                                if (request.getParameter("startIndex") != null) {
                                    sIndex = Integer.parseInt(request.getParameter("startIndex"));
                                }
                                if(sIndex+5<listProducts.size()) eIndex = sIndex+5;
                            %>

                            <tbody>

                            <% for (int i = sIndex; i < eIndex; i++) {%>
                            <tr>
                                <td style="width: 10%"><%=listProducts.get(i).getId()%>
                                </td>
                                <td style="width: 30%"><%=listProducts.get(i).getName()%>
                                </td>
                                <td style="width: 10%">
                                    <div class="img" style="background-image: url(<%=listProducts.get(i).getImageLink()%>)"></div>
                                </td>
                                <td style="width: 10%"><%=listProducts.get(i).getTotalQuantity()%>
                                </td>
                                <td style="width: 10%"><%=listProducts.get(i).getStatus()%>
                                </td>
                                <td style="width: 15%"><%=listProducts.get(i).getPrice()%>
                                </td>
                                <td style="width: 10%"><%=listProducts.get(i).getCategory().getName()%>
                                </td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <form action="<c:url value="/admin/product?act=delete"/>" method="post">
                                        <input type="hidden" name="productId" value="<%=listProducts.get(i).getId()%>">
                                        <button class="btn-delete" type="submit">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <div class="wrapper-pagination">
                            <%--                            <div class="wrapper-qty-row">--%>
                            <%--                                <div>--%>
                            <%--                                    <p>Cột mỗi bảng</p>--%>
                            <%--                                </div>--%>
                            <%--                                <div>--%>
                            <%--                                    <select name="qty_row" id="qtyRow">--%>
                            <%--                                        <option value="10">10</option>--%>
                            <%--                                        <option value="25">25</option>--%>
                            <%--                                        <option value="50">50</option>--%>
                            <%--                                        <option value="100">100</option>--%>
                            <%--                                    </select>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>

                            <div class="wrapper-action-table">
                                <div class="index">
                                    <% String pageIndex;
                                        if(request.getParameter("pageIndex")!=null) pageIndex = request.getParameter("pageIndex");
                                        else pageIndex = "1/"+(int)Math.ceil(listProducts.size()/5.0);
                                    %>
                                    <p id="currentPage"><%=pageIndex%></p>
                                </div>
                                <form action="<c:url value="/admin/product"/>" method="get" style="display: flex">
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
            </div>
        </div>
    </div>
</div>
<script>
    const data =
    <%=listProducts.size()%>
    const rowPerPage = 5;
</script>
<script src="<c:url value="../../assets/js/pagination.js"/>">
</script>

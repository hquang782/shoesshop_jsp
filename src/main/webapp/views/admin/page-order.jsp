<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dev4fun.model.BillDetail" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Đơn hàng</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <div class="main-container">
            <div class="wrapper-main-container">

                <div class="action-table">
                    <button id="btnAddProduct" class="btn-add" type="button"><a
                            href="<c:url value="/admin/order/add"/>">Thêm đơn hàng</a></button>
                    <%--                    <button class="btn-export">Xuất file Excel</button>--%>
                </div>

                <div class="table-content">
                    <div class="search-table-content">
                        <div class="wrapper-search">
                            <form id="formSearch" method="get" action="<c:url value="/admin/order"/>" >
                                <div class="search-option">
                                    <select name="t" id="optionSearchTable">
                                        <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                        <option value="id">ID Đơn hàng</option>
                                        <option value="fn">Khách hàng</option>
                                        <option value="name">Đơn hàng</option>
                                        <option value="st">Tình trạng</option>
                                    </select>
                                </div>
                                <div class="search-value">
                                    <input type="text" name="v" placeholder="Gõ ở đây..." value="${txt}"
<%--                                           value="<%=request.getParameter("value") != null ? request.getParameter("value") : ""%>"--%>
                                    >
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
                                <th>ID Đơn hàng</th>
                                <th>Khách hàng</th>
                                <th>Đơn hàng</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                                <th class="action">Tính năng</th>
                            </tr>
                            </thead>
                            <%
                                for(BillDetail token : (ArrayList<BillDetail>) request.getAttribute("statforsearch")){
                            %>
                            <tbody>
                            <tr>
                                <td><%=token.getId()%></td>
                                <td><%=token.getBill().getFullName()%></td>
                                <td><%=token.getProduct().getName()%></td>
                                <td><%=token.getQuantity()%></td>
                                <td><%=token.getAmount()%>></td>
                                <td><%=token.getBill().getStatus()%></td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <button class="btn-delete">Xóa</button>
                                </td>
                            </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <div class="wrapper-pagination">
                            <div class="wrapper-qty-row">
                                <div>
                                    <select name="qty_row" id="qtyRow">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>
                            </div>

                            <div class="wrapper-action-table">
                                <div class="index">
                                    <p>Trang 1</p>
                                </div>
                                <div class="previous">
                                    <p>&#8592;</p>
                                </div>
                                <div class="next">
                                    <p>&#8594;</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


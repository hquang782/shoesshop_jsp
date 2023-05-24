<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dev4fun.model.BillDetail" %>
<%@ page import="com.google.gson.Gson" %>
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
                                        <% if (request.getParameter("t") != null) {%>
                                        <option value="${valueSearch}" selected>${typeSearch}</option>
                                        <%} else {%>
                                        <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                        <%}%>
                                        <option value="id" style="display: ${id}">ID Đơn hàng</option>
                                        <option value="fn" style="display: ${fn}">Khách hàng</option>
                                        <option value="name" style="display: ${name}">Đơn hàng</option>
                                        <option value="st" style="display: ${st}">Tình trạng</option>
                                    </select>
                                </div>
                                <div class="search-value">
                                    <input type="text" name="v" placeholder="Gõ ở đây..." value="${txt_sbilldetail}"
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
                                ArrayList<BillDetail> listBillDetails = (ArrayList<BillDetail>) request.getAttribute("listBillDetail");
                                Gson gson = new Gson();
                                String jsonBillDetails = gson.toJson(listBillDetails);
                                int sIndex = 0, eIndex = listBillDetails.size();
                                if (request.getParameter("startIndex") != null) {
                                    sIndex = Integer.parseInt(request.getParameter("startIndex"));
                                }
                                if(sIndex+5<listBillDetails.size()) eIndex = sIndex+5;
                            %>
                            <tbody>
                            <% for (int i = sIndex; i < eIndex; i++) {%>
                            <tr>
                                <td><%=listBillDetails.get(i).getId()%></td>
                                <td><%=listBillDetails.get(i).getBill().getFullName()%></td>
                                <td><%=listBillDetails.get(i).getProduct().getName()%></td>
                                <td><%=listBillDetails.get(i).getQuantity()%></td>
                                <td><%=listBillDetails.get(i).getAmount()%>></td>
                                <td><%=listBillDetails.get(i).getBill().getStatus()%></td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <button class="btn-delete">Xóa</button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>

                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <div class="wrapper-pagination">
<%--                            <div class="wrapper-qty-row">--%>
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
                                    <p id="currentPage"></p>
                                </div>
                                <div class="previous">
                                    <button onclick="previousPages()">&#8592;</button>
                                    <input style="display: none" id="st" name="startIndex" >
                                </div>
                                <div class="next">
                                    <button onclick="nextPages()">&#8594;</button>
                                </div>
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
    <%=jsonBillDetails%>
</script>
<script src="<c:url value="../../assets/js/admin.pagination.js"/>">
</script>

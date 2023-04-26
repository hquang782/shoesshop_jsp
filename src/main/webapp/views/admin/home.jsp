<%@ page import="com.dev4fun.model.Bill" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dev4fun.model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Dashboard</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>
        <!-- main content -->
        <div class="main-container" style="display: flex;">

            <div class="left-side">
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            ICON
                        </p>
                        <div class="info-recap">
                            <h4>Tổng khách hàng</h4>
                            <p><b><%=request.getAttribute("ttAcc")%> khách hàng</b></p>
                            <p class="total-info">This is list khách hàng.</p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            ICON
                        </p>
                        <div class="info-recap">
                            <h4>Tổng sản phẩm</h4>
                            <p><b><%=request.getAttribute("ttProd")%> sản phẩm</b></p>
                            <p class="total-info">Tổng số sản phẩm được quản lý.</p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            ICON
                        </p>
                        <div class="info-recap">
                            <h4>Tổng đơn hàng</h4>
                            <p><b><%=request.getAttribute("ttBill")%> đơn hàng</b></p>
                            <p class="total-info">Tổng số hóa đơn bán hàng.</p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            ICON
                        </p>
                        <div class="info-recap">
                            <h4>Hết hàng</h4>
                            <p><b><%=request.getAttribute("ttExpired")%> sản phẩm</b></p>
                            <p class="total-info">Số sản phẩm đã hết hàng.</p>
                        </div>
                    </div>
                </div>
                <!-- box show new bills -->
                <div class="box-info mini-table">
                    <div class="wrap-info box">
                        <div class="table-content">
                            <div class="box-info-title">
                                <h3>Trạng thái đơn hàng</h3>
                            </div>
                            <table>
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Bill bill : (ArrayList<Bill>) request.getAttribute("newBill")) { %>
                                <tr>
                                    <td title="<%=bill.getId()%>"><%=bill.getId()%>
                                    </td>
                                    <td title="<%=bill.getFullName()%>"><%=bill.getFullName()%>
                                    </td>
                                    <td title="<%=bill.getTotalAmount()%>"><%=bill.getTotalAmount()%>đ</td>
                                    <td title="<%=bill.getStatus()%>"><span><%=bill.getStatus()%></span></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                        <div class="link-page">
                            <a href="<c:url value="/admin/order"/>">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <!-- Box show new user -->
                <div class="box-info mini-table">
                    <div class="wrap-info box">
                        <div class="table-content">
                            <div class="box-info-title">
                                <h3>Tài khoản khách hàng mới</h3>
                            </div>
                            <table>
                                <thead>
                                <tr>
                                    <th>Tên người dùng</th>
                                    <th>Họ và tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Account account : (ArrayList<Account>) request.getAttribute("newAcc")) { %>
                                <tr>
                                    <td title="<%=account.getUsername()%>"><%=account.getUsername()%></td>
                                    <td title="<%=account.getFullName()%>"><%=account.getFullName()%></td>
                                    <td title="<%=account.getEmail()%>"><%=account.getEmail()%></td>
                                    <td title="<%=account.getPhoneNumber()%>"><%=account.getPhoneNumber()%></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                        <div class="link-page">
                            <a href="<c:url value="/admin/account"/>">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-side">

                <!-- chart  -->
                <div class="chart box-info mini-table">
                    <div class="wrap-info box">
                        <div class="box-info-title">
                            <h3>Thống kê doanh thu 6 tháng gần đây</h3>
                        </div>
                        <div class="wrap-chart">

                            <!-- TODO -->

                        </div>
                        <div class="link-page">
                            <a href="<c:url value="/admin/sale-stat"/>">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


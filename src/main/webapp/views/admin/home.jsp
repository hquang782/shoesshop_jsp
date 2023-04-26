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
                                <tr>
                                    <td title="1">1</td>
                                    <td title="Nguyen Van B">Nguyen Van B</td>
                                    <td title="19.770.000đ">19.770.000đ</td>
                                    <td title="Done"><span>Done</span></td>
                                </tr>
                                <tr>
                                    <td title="1">2</td>
                                    <td title="Nguyen Thi A">Nguyen Thi A</td>
                                    <td title="16.770.000đ">16.770.000đ</td>
                                    <td title="Done"><span>Done</span></td>
                                </tr>
                                <tr>
                                    <td title="1">3</td>
                                    <td title="Nguyen Van C">Nguyen Van C</td>
                                    <td title="9.400.000đ">9.400.000đ</td>
                                    <td title="Done"><span>Done</span></td>
                                </tr>
                                <tr>
                                    <td title="1">4</td>
                                    <td title="Nguyen Thi B">Nguyen Thi B</td>
                                    <td title="40.650.000đ">40.650.000 đ</td>
                                    <td title="Done"><span>Done</span></td>
                                </tr>
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
                                <tr>
                                    <td title="12/03/2002">Username</td>
                                    <td title="Nguyen Van B">Nguyen Van B</td>
                                    <td title="email123@gmail.com">email123@gmail.com</td>
                                    <td title="0987654321">0987654321</td>
                                </tr>
                                <tr>
                                    <td title="12/03/2002">Username</td>
                                    <td title="Nguyen Thi A">Nguyen Thi A</td>
                                    <td title="email123@gmail.com">email123@gmail.com</td>
                                    <td title="0987654321">0987654321</td>
                                </tr>
                                <tr>
                                    <td title="12/03/2002">Username</td>
                                    <td title="Nguyen Van C">Nguyen Van C</td>
                                    <td title="email123@gmail.com">email123@gmail.com</td>
                                    <td title="0987654321">0987654321</td>
                                </tr>
                                <tr>
                                    <td title="12/03/2002">Username</td>
                                    <td title="Nguyen Thi B">Nguyen Thi B</td>
                                    <td title="email123@gmail.com">email123@gmail.com</td>
                                    <td title="0987654321">0987654321</td>
                                </tr>
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


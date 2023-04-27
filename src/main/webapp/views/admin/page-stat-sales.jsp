<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Thống kê</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <!-- Show total -->
        <div class="main-content">

            <div class="group-box">
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/account.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng nhân viên</h4>
                            <p><b><%=request.getAttribute("totalStaffAccounts")%> nhân viên</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/total-product.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng sản phẩm</h4>
                            <p><b><%=request.getAttribute("totalProducts")%> sản phẩm</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/bill.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng đơn hàng</h4>
                            <p><b><%=request.getAttribute("totalBills")%> đơn hàng</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info end-right">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/total-customer.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng khách hàng</h4>
                            <p><b><%=request.getAttribute("totalClientAccounts")%> khách hàng</b></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="group-box">
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/total-amount.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng doanh thu</h4>
                            <p><b>56 doanh thu</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/product-warning.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Sắp hết hàng</h4>
                            <p><b><%=request.getAttribute("TotalProductNearExpired")%> sản phẩm</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/none-product.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Hết hàng</h4>
                            <p><b><%=request.getAttribute("totalProductExpired")%> sản phẩm</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info end-right">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="../../assets/img/oder-cancelled.png" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Đơn hàng hủy</h4>
                            <p><b>56 đơn hàng</b></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- product top pick -->
        <div class="wrapper-main-container">
            <div class="table-content">
                <div class="wrapper-table-content">
                    <div class="box-info-title">
                        <h3>Sản phẩm bán chạy</h3>
                    </div>
                    <table>
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Danh mục</th>
                            <th>Giá tiền</th>
                            <th>Đã bán</th>
                            <th>Còn lại</th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                            for (ArrayList<String> temp : (ArrayList<ArrayList<String>>) request.getAttribute("topSaleProducts")) {
                        %>
                        <tr>
                            <td><%=temp.get(0)%>
                            </td>
                            <td><%=temp.get(1)%>
                            </td>
                            <td><%=temp.get(2)%>
                            </td>
                            <td><%=temp.get(3)%>
                            </td>
                            <td><%=temp.get(4)%>
                            </td>
                            <td><%=temp.get(5)%>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

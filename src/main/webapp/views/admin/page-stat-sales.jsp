<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.dev4fun.model.Statistic" %>
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
                            <img src="<c:url value="/assets/img/account.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/total-product.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/bill.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/total-customer.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/total-amount.png"/>" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Tổng doanh thu</h4>
                            <%
                                NumberFormat nf = NumberFormat.getNumberInstance();
                                nf.setGroupingUsed(true);
                            %>
                            <p><b><%=nf.format(request.getAttribute("totalIncome"))%> doanh thu</b></p>
                        </div>
                    </div>
                </div>
                <div class="box-info">
                    <div class="wrap-info box">
                        <p class="icon-info">
                            <img src="<c:url value="/assets/img/product-warning.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/none-product.png"/>" width="100%">
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
                            <img src="<c:url value="/assets/img/oder-cancelled.png"/>" width="100%">
                        </p>
                        <div class="info-recap">
                            <h4>Đơn hàng hủy</h4>
                            <p><b><%=request.getAttribute("totalBillCancelled")%> đơn hàng</b></p>
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
                            for (Statistic temp : (ArrayList<Statistic>) request.getAttribute("topSaleProducts")) {
                        %>
                        <tr>
                            <td><%=temp.getProductId()%>
                            </td>
                            <td><%=temp.getProductName()%>
                            </td>
                            <td><%=temp.getCategoryName()%>
                            </td>
                            <td><%=nf.format(temp.getPrice())%>
                            </td>
                            <td><%=temp.getTotalSold()%>
                            </td>
                            <td><%=temp.getRemain()%>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="wrap-chart">
                <canvas id="myChart"></canvas>

            </div>
        </div>
    </div>
</div>

<script>
    const xValues = [50,60,70,80,90,100,110,120,130,140,150];
    const yValues = [7,8,8,9,9,9,10,11,14,14,15];

    new Chart("myChart", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor:"rgba(0,0,255,1.0)",
                borderColor: "rgba(0,0,255,0.1)",
                data: yValues
            }]
        },

    });
</script>
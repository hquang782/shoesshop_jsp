<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="sidebar">
    <div class="sidebar">
        <div class="wrap-link-sidebar">
            <ul class="link-page">
                <div class="link-title">
                    <h6>Controller</h6>
                </div>
                <li>
                    <a href="<c:url value="/admin"/>"><span>
                        <img src="../assets/img/Dashbroad.png" width="8.5%"> </span>Dashboard</a>
                </li>
                <div class="link-title">
                    <h6>Configure</h6>
                </div>
                <li>
                    <a href="<c:url value="/admin/account"/>"><span>
                        <img src="../assets/img/account.png" width="8.5%"> </span>Tài khoản</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/product"/>"><span>
                        <img src="../assets/img/product.png" width="8.5%"> </span>Sản phẩm</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/order"/>"><span>
                        <img src="../assets/img/bill.png" width="8.5%"> </span>Đơn hàng</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/sale-stat"/>"><span>
                        <img src="../assets/img/statistics.png" width="8.5%"> </span>Thống kê</a>
                </li>
            </ul>
        </div>
    </div>
</div>
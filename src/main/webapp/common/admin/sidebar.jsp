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
                        <img src="<c:url value="/assets/img/dashboard.png"/>" style="width: 8.5%" alt=""></span>Dashboard</a>
                </li>
                <div class="link-title">
                    <h6>Configure</h6>
                </div>
                <li>
                    <a href="<c:url value="/admin/account"/>"><span>
                        <img src="<c:url value="/assets/img/account.png"/>" style="width: 8.5%" alt=""> </span>Tài khoản</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/product"/>"><span>
                        <img src="<c:url value="/assets/img/product.png"/>" style="width: 8.5%" alt=""> </span>Sản phẩm</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/order"/>"><span>
                        <img src="<c:url value="/assets/img/bill.png"/>" style="width: 8.5%" alt=""> </span>Đơn hàng</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/sale-stat"/>"><span>
                        <img src="<c:url value="/assets/img/statistics.png"/>" style="width: 8.5%" alt=""> </span>Thống kê</a>
                </li>
            </ul>
        </div>
    </div>
</div>
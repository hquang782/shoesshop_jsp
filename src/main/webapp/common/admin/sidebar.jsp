<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="sidebar">
    <div class="sidebar">
        <div class="wrap-link-sidebar">
            <ul class="link-page">
                <div class="link-title">
                    <h6>Controller</h6>
                </div>
                <li>
                    <a href="<c:url value="/admin"/>"><span>1 </span>Dashboard</a>
                </li>
                <div class="link-title">
                    <h6>Configure</h6>
                </div>
                <li>
                    <a href="<c:url value="/admin/account"/>"><span>2 </span>Tài khoản</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/product"/>"><span>3 </span>Sản phẩm</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/order"/>"><span>4 </span>Đơn hàng</a>
                </li>
                <li>
                    <a href="<c:url value="/admin/sale-stat"/>"><span>5 </span>Thống kê</a>
                </li>
            </ul>
        </div>
    </div>
</div>
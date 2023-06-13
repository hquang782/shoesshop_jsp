<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<style>
    h1 {
        color: #88B04B;
        font-size: 40px;
        margin-bottom: 10px;
    }

    p {
        color: #404F5E;
        font-size: 20px;
        margin: 0;
    }

    i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left: -15px;
    }

    .main-container {
        margin-top: 200px;
        text-align: center;
    }

    .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
    }

    .btn-back {
        display: inline-block;
        background-color: #333;
        color: #fff;
        padding: 10px 20px;
        margin-top: 20px;
        text-decoration: none;
        border-radius: 4px;
    }

    .btn-back:hover {
        background-color: #555;
    }
    footer {
        display: none !important;
    }
    header {
        display: none !important;
    }
</style>
<title>Đặt đơn hàng thành công</title>
<div class="main-container">
    <div class="card">
        <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
            <i class="checkmark">✓</i>
        </div>
        <h1>Đặt hàng thành công</h1>
        <p>Chúng tôi đã nhận được yêu cầu về đơn hàng của bạn</p>
        <a href="<c:url value="/home"/>" class="btn-back">Trở về trang chủ</a>
    </div>
</div>
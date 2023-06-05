<%@ page import="com.dev4fun.model.Bill" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dev4fun.model.BillDetail" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="<c:url value="/assets/style/user/order-style.css"/>"/>
<div class="main">
    <div class="navigate">
        <a href="<c:url value="/home"/>">Trang chủ</a>
        <span>/</span>
        <a href="<c:url value="/user/orders"/>">Đơn mua</a>
    </div>
    <div class="content">
        <div>
            <%
                ArrayList<Bill> listBills = (ArrayList<Bill>) request.getAttribute("listBills");
                NumberFormat nf = NumberFormat.getNumberInstance();

                if (listBills.size() != 0) {
                    for (Bill bill : listBills) {
            %>
            <div class="wrapper-item">
                <div>
                    <span><%=bill.getStatus()%></span>
                </div>
                <div class="wrapper-product-item">
                    <%
                        for (BillDetail billDetail : bill.getBillDetails()) {
                    %>
                    <div class="product">
                        <div class="detail">
                            <div class="product-img"
                                 style="background-image: url(<%=1%>);">
                                <span class="quantity">x<%=billDetail.getQuantity()%></span>
                            </div>
                            <div class="product-info">
                                <p class="product-name"><%=billDetail.getProduct().getName()%>
                                </p>
                                <div class="store"><span>Shoe Shop</span></div>
                            </div>
                        </div>
                        <div class="price"><span><%=nf.format(billDetail.getAmount())%></span><sup>đ</sup></div>
                    </div>
                    <%}%>
                </div>
                <div class="wrapper-action-item">
                    <div class="total-money">
                        <div class="title">Tổng tiền:</div>
                        <div class="total"><%=nf.format(bill.getTotalAmount())%><sup>đ</sup></div>
                    </div>
                    <div class="button-group">
                        <div>Xem chi tiết</div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="no-item">
                <img src="https://frontend.tikicdn.com/_desktop-next/static/img/account/empty-order.png">
                <p>Chưa có đơn hàng</p>
            </div>
            <%}%>
        </div>
    </div>
</div>


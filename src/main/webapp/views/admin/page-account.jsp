<%@ page import="com.dev4fun.model.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Tài khoản</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <div class="main-container">
            <div class="wrapper-main-container">

                <div class="action-table">
                    <button class="btn-add"><a href="<c:url value="/admin/account/add"/>">Thêm tài khoản</a></button>
                </div>

                <div class="table-content">
                    <div class="search-table-content">
                        <div class="wrapper-search">
                            <form method="get" action="<c:url value="/admin/account"/>">
                                <div class="search-option">
                                    <select name="t" id="optionSearchTable" >
                                        <% if(request.getParameter("t")!=null){%>
                                        <option value="" selected  >${typeSearch}</option>
                                        <%}
                                        else {%>
                                        <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                        <%}%>
                                        <option value="username" style="display: ${username}">Tên người dùng</option>
                                        <option value="email" style="display: ${email}">Email</option>
                                        <option value="phone_number"  style="display: ${phone_number}">Số điện thoại</option>
                                        <option value="role" style="display: ${role}">Loại tài khoản</option>
                                    </select>
                                </div>
                                <div class="search-value">
                                    <input type="text" placeholder="Typing here..." name="v" value="${txt_sAccount}">
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
                                <th>Tên người dùng</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Ngày sinh</th>
                                <th>Loại</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>
                            <% ArrayList<Account> listAccounts = (ArrayList<Account>) request.getAttribute("listAccounts");
                                Gson gson = new Gson();
                                String jsonAccounts = gson.toJson(listAccounts);%>
                            <tbody class="list-accounts"></tbody>
                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <form method="get" action="<c:url value="/admin/account"/>"></form>
                        <div class="wrapper-pagination">
                            <%--                            <div class="wrapper-qty-row">--%>
                            <%--                                <div>--%>
                            <%--                                    <p>Rows per table</p>--%>
                            <%--                                </div>--%>
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
                                    <p>1-2 of 2</p>
                                </div>
                                <div class="previous">
                                    <button onclick="previousPages()">&#8592;</button>
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
    const data = <%=jsonAccounts%>
</script>
<%@ page import="com.dev4fun.model.Account" %>
<%@ page import="java.util.ArrayList" %>
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
                            <div class="search-option">
                                <select name="option_search_table" id="optionSearchTable">
                                    <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                    <option value="name">Tên</option>
                                    <option value="email">Email</option>
                                    <option value="phone_number">Số điện thoại</option>
                                    <option value="role">Loại tài khoản</option>
                                </select>
                            </div>
                            <div class="search-value">
                                <input type="text" placeholder="Typing here...">
                            </div>

                            <div class="btn-search">
                                <button>Tìm kiếm</button>
                            </div>
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
                            <tbody>
                            <%for (Account account : (ArrayList<Account>) request.getAttribute("listAccounts")) {%>
                            <tr>
                                <td><%=account.getUsername()%>
                                </td>
                                <td><%=account.getFullName()%>
                                </td>
                                <td><%=account.getEmail()%>
                                </td>
                                <td><%=account.getPhoneNumber()%>
                                </td>
                                <td><%=account.getDob()%>
                                </td>
                                <td><%=account.getRole()%>
                                </td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <form method="post" action="<c:url value="/admin/account"/>">
                                        <button class="btn-delete" type="submit">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <div class="wrapper-pagination">
                            <div class="wrapper-qty-row">
                                <div>
                                    <p>Rows per table</p>
                                </div>
                                <div>
                                    <select name="qty_row" id="qtyRow">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>
                            </div>

                            <div class="wrapper-action-table">
                                <div class="index">
                                    <p>1-2 of 2</p>
                                </div>
                                <div class="previous">
                                    <p>&#8592;</p>
                                </div>
                                <div class="next">
                                    <p>&#8594;</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
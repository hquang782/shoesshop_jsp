<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Sản phẩm</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <div class="main-container">

            <div class="wrapper-main-container">
                <div class="action-table">
                    <button id="btnAddProduct" class="btn-add"><a href="<c:url value="/admin/product/add"/>">Thêm sản phẩm</a></button>
                    <%--<button class="btn-export">Xuất file Excel</button>--%>
                </div>

                <div class="table-content">
                    <div class="search-table-content">
                        <div class="wrapper-search">
                            <div class="search-option">
                                <select name="option_search_table" id="optionSearchTable">
                                    <option value="" selected disabled hidden>Tìm kiếm theo</option>
                                    <option value="name">Tên sản phẩm</option>
                                    <option value="status">Trạng thái</option>
                                    <option value="category">Danh mục</option>
                                </select>
                            </div>
                            <div class="search-value">
                                <input type="text" placeholder="Gõ ở đây...">
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
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Trạng thái</th>
                                <th>Giá bán</th>
                                <th>Danh mục</th>
                                <th class="action">Action</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>name 2</td>
                                <td>Image 1</td>
                                <td>100</td>
                                <td>Remaining</td>
                                <td>100.000$</td>
                                <td>Converse</td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <button class="btn-delete">Xóa</button>
                                </td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>Name 3</td>
                                <td>Image 3</td>
                                <td>100</td>
                                <td>Remaining</td>
                                <td>100.000$</td>
                                <td>Converse</td>
                                <td>
                                    <button class="btn-edit">Sửa</button>
                                    <button class="btn-delete">Xóa</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="pagination-table-content">
                        <div class="wrapper-pagination">
                            <div class="wrapper-qty-row">
                                <div>
                                    <p>Cột mỗi bảng</p>
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
                                    <p>trang 1</p>
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
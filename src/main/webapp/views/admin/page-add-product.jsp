<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dev4fun.model.Category" %>
<%@ page import="java.util.ArrayList" %>
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

                <div class="form-content">
                    <div class="wrap-title">
                        <div class="item-title">
                            <h3>Thêm sản phẩm</h3>
                        </div>
                    </div>

                    <div>
                        <button class="btn-add" onclick="handleOpenModal(this);" value="modalAddCategory">Thêm danh mục mới</button>
                    </div>

                    <div id="modalAddCategory" class="modal-category">
                        <div class="modal-content">
                            <div>
                                <div class="modal-line">
                                    <h3>Thêm danh mục mới</h3>
                                </div>
                                <form action="<c:url value="/admin/product/add?act=category"/>" method="post">
                                    <div class="modal-line form-line">
                                        <label for="newCategory">Tên danh mục:</label>
                                        <input type="text" name="newCategory" id="newCategory">
                                    </div>
                                    <div class="modal-line form-line">
                                        <label>Danh mục sản phẩm hiện đang có</label>
                                        <ul>
                                            <%for (Category category : (ArrayList<Category>) request.getAttribute("listCategories")) {%>
                                            <li><%=category.getName()%>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="modal-line form-line">
                                        <button class="btn-add" type="submit">Thêm danh mục</button>
                                        <button class="btn-cancel" onclick="handleCloseModal(this);" value="modalAddCategory" type="button">Hủy bỏ</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <form class="form-product" action="<c:url value="/admin/product/add"/>" method="post" enctype='multipart/form-data'>
                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="code">Mã sản phẩm:</label>
                                <input type="text" id="code" name="code" required>
                            </div>

                            <div class="form-line">
                                <label for="name" >Tên sản phẩm:</label>
                                <input type="text" id="name" name="name" required>
                            </div>

                            <div class="form-line">
                                <label for="status">Trạng thái:</label>
                                <select name="status" id="status" required>
                                    <option value="" selected disabled hidden>-- Chọn trạng thái --</option>
                                    <option value="Còn hàng">Còn hàng</option>
                                    <option value="Hết Hàng">Hết hàng</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="category">Danh mục:</label>
                                <select name="category" id="category" required>
                                    <option value="" selected disabled hidden>-- Chọn danh mục --</option>
                                    <%for (Category category : (ArrayList<Category>) request.getAttribute("listCategories")) {%>
                                    <option value="<%=category.getId()%>"><%=category.getName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>

                            <div class="form-line">
                                <label for="price">Giá bán:</label>
                                <input type="text" id="price" name="price" required>
                            </div>

                            <div class="form-line">
                                <label for="cost">Giá gốc:</label>
                                <input type="text" id="cost" name="cost" required>
                            </div>
                        </div>

                        <div class="form-line">
                            <div class="title-list">
                                <label>Chọn size:</label>
                                <button type="button" class="btn-add-div" onclick="addSizeInProduct();">Thêm size</button>
                            </div>
                            <div class="list-size"></div>
                        </div>

                        <div class="form-line">
                            <div class="title-list">
                                <%--@declare id="imageinput"--%>
                                <label for="imageInput">Chọn ảnh:</label>
                                <button type="button" class="btn-add-div" onclick="addImgInProduct();">Thêm ảnh</button>
                            </div>
                            <div class="list-image"></div>
                        </div>

                        <div class="form-line">
                            <label for="description">Mô tả:</label>
                            <textarea id="description" name="description" rows="4"></textarea>
                        </div>

                        <div class="form-line form-line-btn">
                            <button class="btn-add" type="submit">Lưu lại</button>
                            <button class="btn-cancel" type="reset">Xóa hết</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

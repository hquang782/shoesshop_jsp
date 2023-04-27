<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
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

                <div class="form-content">
                    <div class="wrap-title">
                        <div class="item-title">
                            <h3>Thêm tài khoản</h3>
                        </div>
                    </div>
                    <div>
                        <button class="btn-add" onclick="handleOpenModal(this);" value="modalAddCategoryAcc">Thêm loại tài khoản</button>
                    </div>

                    <div id="modalAddCategoryAcc" class="modal-category">
                        <div class="modal-content">
                            <div>
                                <div class="modal-line">
                                    <h3>Thêm loại tài khoản</h3>
                                </div>
                                <div class="modal-line form-line">
                                    <label for="newCategory">Tên loại tài khoản:</label>
                                    <input type="text" name="newCategory" id="newCategory">
                                </div>
                                <div class="modal-line form-line">
                                    <label>Loại tài khoản hiện có:</label>
                                    <ul>
                                        <li>Admin</li>
                                        <li>Manager</li>
                                        <li>Customer</li>
                                    </ul>
                                </div>
                                <div class="modal-line form-line">
                                    <button class="btn-add">Lưu lại</button>
                                    <button class="btn-cancel" onclick="handleCloseModal(this);" value="modalAddCategoryAcc">Hủy bỏ</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form class="form-add">
                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="fname">Họ và tên:</label>
                                <input type="text" id="fname" name="fname">
                            </div>

                            <div class="form-line">
                                <label for="dob">Ngày sinh:</label>
                                <input type="date" id="dob" name="dob">
                            </div>

                            <div class="form-line">
                                <label for="gender">Giới tính:</label>
                                <select name="gender" id="gender">
                                    <option value="" selected disabled hidden>-- Chọn giới tính --</option>
                                    <option value="male">Nam</option>
                                    <option value="female">Nữ</option>
                                    <option value="other">Khác</option>
                                </select>
                            </div>

                        </div>

                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="tel">Số điện thoại:</label>
                                <input type="text" id="tel" name="tel">
                            </div>

                            <div class="form-line">
                                <label for="address">Địa chỉ:</label>
                                <input type="text" id="address" name="address">
                            </div>

                            <div class="form-line">
                                <label for="email">Địa chỉ email:</label>
                                <input type="text" id="email" name="email">
                            </div>

                        </div>

                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="username">Tên tài khoản:</label>
                                <input type="text" id="username" name="username">
                            </div>

                            <div class="form-line">
                                <label for="password1">Mật khẩu:</label>
                                <input type="text" id="password1" name="password1">
                            </div>

                            <div class="form-line">
                                <label for="password2">Nhập lại mật khẩu:</label>
                                <input type="text" id="password2" name="password2">
                            </div>
                            <div class="form-line">
                                <label for="role">Loại tài khoản:</label>
                                <select name="role" id="role">
                                    <option value="" selected disabled hidden>-- Chọn loại tài khoản --</option>
                                    <option value="manager">Manager</option>
                                    <option value="customer">Customer</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-line">
                            <div class="title-list">
                                <label for="imageInput">Chọn ảnh đại diện:</label>
                            </div>
                            <div class="list-image">
                                <div class="item-image">
                                    <label for="imageInput">
                                        <p>Chọn ảnh</p>
                                        <img style="display: none;" alt="">
                                    </label>
                                    <input class="image-input" id="imageInput" type="file" name="imageInput" onchange="handlePutNewImg(this);">
                                </div>
                            </div>
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


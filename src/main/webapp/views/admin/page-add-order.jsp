<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Đơn hàng / Thêm đơn hàng</h3>
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
                            <h3>Thêm đơn hàng mới</h3>
                        </div>
                    </div>

                    <form class="form-product">
                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="name">Tên khách hàng:</label>
                                <input type="text" id="name" name="name">
                            </div>

                            <div class="form-line">
                                <label for="tel">Số điện thoại:</label>
                                <input type="tel" id="tel" name="tel">
                            </div>

                            <div class="form-line">
                                <label for="address">Địa chỉ:</label>
                                <input type="text" id="address" name="address">
                            </div>

                            <div class="form-line">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email">
                            </div>
                        </div>

                        <div class="form-group-line">
                            <div class="form-line">
                                <label for="code">Mã đơn hàng:</label>
                                <input type="text" id="code" name="code">
                            </div>

                            <div class="form-line">
                                <label for="author">Người tạo:</label>
                                <input type="text" id="author" name="author">
                            </div>

                            <div class="form-line">
                                <label for="amount">Tổng tiền:</label>
                                <input type="text" id="amount" name="amount" value="0">
                            </div>

                            <div class="form-line">
                                <label for="status">Trạng thái:</label>
                                <select name="status" id="status">
                                    <option value="" selected disabled hidden>-- Chọn trạng thái --</option>
                                    <option value="done">Đã xử lý</option>
                                    <option value="waiting">Đang chờ</option>
                                    <option value="cancel">Đã hủy</option>
                                </select>
                            </div>

                        </div>

                        <div class="form-line">
                            <div class="title-list">
                                <%--@declare id="imageinput"--%>
                                <label for="imageInput">Thêm sản phẩm cho đơn hàng:</label>
                                <button type="button" class="btn-add-div" onclick="addProductInOrder();">Thêm sản phẩm
                                </button>
                            </div>
                            <div class="list-product"></div>
                        </div>

                        <div class="form-line">
                            <label for="note">Ghi chú:</label>
                            <textarea id="note" name="note" rows="4"></textarea>
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
<script>
    let indexProd = 0;
    window.onload = () => {
        indexProd = 0;
    }

    function addProductInOrder() {
        const listProduct = document.getElementsByClassName('list-product')[0];
        listProduct.innerHTML += `
        <div class="form-group-line">
            <div class="form-line">
                <label for="status">Sản phẩm:</label>
                <select name="status" id="status">
                    <option value="" selected disabled hidden>-- Chọn mã sản phẩm --</option>
                    <option value="done">Đã xử lý</option>
                    <option value="waiting">Đang chờ</option>
                    <option value="cancel">Đã hủy</option>
                </select>
            </div>

            <div class="form-line">
                <label for="quantityProduct${indexProd}">Số lượng:</label>
                <input type="number" id="quantityProduct${indexProd}" name="quantityProduct${indexProd}">
            </div>
        </div>
    `;
        indexProd++;
    }
</script>
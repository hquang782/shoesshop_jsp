<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div>
    <div class="header">
        <a href="<c:url value="/home"/>" class="logo">
            <img src="<c:url value="/assets/img/demo_den.png"/>" alt="Brand">
        </a>
    </div>
    <div class="content">
        <div class="container-login">
            <div class="wrapper">
                <form action="<c:url value="/login"/>" method="post" class="form">
                    <div class="form-title">
                        <div class="wrapper-form-title">
                            <h3>Đăng nhập</h3>
                            <a href="<c:url value="/register"/>">Bạn chưa có tài khoản?</a>
                        </div>
                    </div>
                    <p id="error-message" style="display: block; color: red;">${errorLog}</p>
                    <div>
                        <div class="form-body-line">
                            <div class="wrapper-form-line">
                                <label for="username">Tên đăng nhập</label>
                                <div>
                                    <input type="text" placeholder="Tên đăng nhập" name="username" id="username">
                                </div>
                            </div>
                        </div>

                        <div class="form-body-line">
                            <div class="wrapper-form-line">
                                <label for="password">Mật khẩu</label>
                                <div>
                                    <input type="password" placeholder="Mật khẩu" name="password" id="password">
                                </div>
                            </div>
                        </div>

                        <div class="form-body-line">
                            <div class="wrapper-form-line">
                                <div>
                                    <input type="submit" id="submit" value="Đăng Nhập">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

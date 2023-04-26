<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div>
    <div class="header">
        <a href="#" class="logo">
            <img src="<c:url value="/assets/img/demo.png"/>" alt="">
        </a>
    </div>
    <div class="content">
        <div class="container-register">
            <div class="wrapper">
                <form action="<c:url value="/register"/>" method="post" class="form">

                    <div class="form-title">
                        <div class="wrapper-form-title">
                            <h3>Đăng ký</h3>
                            <a href="<c:url value="/login"/>">Bạn đã có tài khoản?</a>
                        </div>
                    </div>

                    <div class="form-body">
                        <!-- required -->
                        <div class="side-required">
                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="fullName">Họ và tên (*)</label>
                                    <div>
                                        <input type="text" placeholder="Họ và tên" name="fullName" id="fullName" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="username">Tên đăng nhập (*)</label>
                                    <div>
                                        <input type="text" placeholder="Tên đăng nhập" name="username" id="username" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="password">Mật khẩu (*)</label>
                                    <div>
                                        <input type="password" placeholder="Mật khẩu" name="password" id="password" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="password2">Nhập lại mật khẩu (*)</label>
                                    <div>
                                        <input type="password" placeholder="Nhập lại mật khẩu" id="password2" required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- optional -->
                        <div class="side-optional">
                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="email">Email (?)</label>
                                    <div>
                                        <input type="text" placeholder="Email" name="email" id="email">
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="telephone">Số điện thoại (?)</label>
                                    <div>
                                        <input type="text" placeholder="Số điện thoại" name="telephone"
                                               id="telephone">
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label for="dob">Sinh nhật (?)</label>
                                    <div>
                                        <input type="date" placeholder="Sinh nhật" name="dob" id="dob">
                                    </div>
                                </div>
                            </div>

                            <div class="form-body-line">
                                <div class="wrapper-form-line">
                                    <label>Giới tính (?)</label>
                                    <div class="gender">
                                        <div>
                                            <input type="radio" name="gender" value="male">
                                            <p>Nam</p>
                                        </div>
                                        <div>
                                            <input type="radio" name="gender" value="female">
                                            <p>Nữ</p>
                                        </div>
                                        <div>
                                            <input type="radio" name="gender" value="option">
                                            <p>Khác</p>
                                        </div>
                                    </div>
                                </div>
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
                </form>
            </div>
        </div>
    </div>
</div>

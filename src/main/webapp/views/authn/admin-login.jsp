<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div>
    <div class="header">
        <a href="#" class="logo">
            <img src="<c:url value="/assets/img/demo.png"/>" alt="Brand">
        </a>
    </div>
    <div class="content">
        <div class="container-login">
            <div class="wrapper">
                <form action="<c:url value="/admin/login"/>" method="post" class="form">
                    <div class="form-title">
                        <div class="wrapper-form-title">
                            <h3>Đăng nhập</h3>
                        </div>
                    </div>

                    <div>
                        <div class="form-body-line">
                            <div class="wrapper-form-line">
                                <label for="username">Tên đăng nhập</label>
                                <div>
                                    <input type="text" placeholder="Tên đăng nhập" name="username" id="username" value="minhquantt2002" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-body-line">
                            <div class="wrapper-form-line">
                                <label for="password">Mật khẩu</label>
                                <div>
                                    <input type="password" placeholder="Mật khẩu" name="password" id="password" value="minhquan223" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-body-line">
                            <div class="wrapper-form-title">
<%--                                <label for="remember" class="wrapper-form-title">--%>
<%--                                    <div class="wrapper-checkbox">--%>
<%--                                        <input type="checkbox" name="remember" id="remember">--%>
<%--                                    </div>--%>
<%--                                    <h6>Nhớ mật khẩu</h6>--%>
<%--                                </label>--%>
                                <div>
                                    <a href="#">Quên mật khẩu</a>
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

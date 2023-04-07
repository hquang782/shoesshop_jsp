<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="user/components/login.css">
    <!-- ionicons  -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<body>
    <div class="container-login">
        <div class="wrap-login">
            <div class="login-pic wrap-form-item">
                <img src="/img/296117701_201488668875974_917414072759665880_n.jpg" alt="" class="img-login">
            </div>
            <form action="Login" method="post" class="login-form wrap-form-item">
                <span class="login-form-head">
                    <b>Đăng Nhập</b>
                </span>
                <p style="color: red">${message}</p><!-- thong bao -->
                <!-- username -->
                <div class="login-form-input login-item">
                    <span class="symbol-input">
                        <ion-icon name="person-outline"></ion-icon>
                    </span>
                    
                    <input class="input-area" type="text" name="username" placeholder="Tài Khoản">
                </div>
                <!-- password -->
                <div class="login-form-input login-item">
                    <span class="symbol-input">
                        <ion-icon name="key-outline"></ion-icon>
                    </span>
                    <input class="input-area" type="password" name="password" id="password" placeholder="Mật khẩu" />
                    <div class="toggle-password">
                        <ion-icon name="eye-outline" class="eye eye-open" id="togglePassword"></ion-icon>
                        <ion-icon name="eye-off-outline" class="eye eye-close"></ion-icon>
                    </div>
                </div>
                <!-- submit -->
                <div class="login-form-btn">
                    <button type="submit" id="submit" class="login-submit login-item">Đăng Nhập</button>
                </div>
                <p class="login-none login-item">Bạn chưa có tài khoản? <a href="#" class="Sign-up">Đăng kí ngay</a></p>
            </form>
        </div>
    </div>
</body>
<script src="../../layouts/user.js">
</script>

</html>
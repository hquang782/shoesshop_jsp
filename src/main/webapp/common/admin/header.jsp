<%--@elvariable id="ACCOUNT_ADMIN" type="com.dev4fun.model.Account"--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<header>
    <div class="header">
        <div class="wrap-left">
            <div class="logo-item">
                <a href="#"><img width="100%" src="<c:url value="/assets/img/demo.png"/>" alt=""></a>
            </div>
        </div>

        <div class="wrap-right">
            <div class="wrap-btn-sidebar">
                <div class="btn-sidebar">
                    <p>&equiv;</p>
                </div>
            </div>

            <div class="wrap-account">
                <p class="username">Welcome, ${ACCOUNT_ADMIN.fullName}</p>
                <a href="#" class="account-item">
                    <img src="${ACCOUNT_ADMIN.imageLink}"
                         alt="logo">
                </a>
                <ul class="dropdown-account-link">
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Settings</a></li>
                    <li>
                        <form method="post" action="<c:url value="/admin/logout"/>">
                            <button type="submit">Logout</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

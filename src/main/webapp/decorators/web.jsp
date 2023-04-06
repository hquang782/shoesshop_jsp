<%--
  Created by IntelliJ IDEA.
  User: Hạ Quang
  Date: 27/02/2023
  Time: 10:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><dec:title default="Trang chủ"/></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon"
          href="<c:url value="/template/web/assets/favicon.ico"/>"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<c:url value="/template/web/css/styles.css"/>" rel="stylesheet"/>
</head>
<body>
<!-- header-->
<%@include file="/common/web/header.jsp" %>
<!-- Section-->
<section class="py-5">
    <dec:body/>
</section>
<!-- Footer-->
<%@include file="../common/web/footer.jsp" %>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../template/web/js/scripts.js"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title><dec:title default="Admin"/></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="<c:url value="/assets/style/admin-style.css"/>" rel="stylesheet" type="text/css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
<!-- Header-->
<%@include file="/common/admin/header.jsp" %>


<!-- Main-->
<div style="display: flex; height: 100%; min-height: calc(100vh - 60px);">
    <%-- Sidebar--%>
    <%@include file="/common/admin/sidebar.jsp" %>

    <%-- main--%>
    <dec:body/>
</div>

<!-- Footer-->
<%@include file="/common/admin/footer.jsp" %>

</body>
<script type="text/javascript" src="<c:url value="/assets/js/admin.main.js"/>"></script>
</html>

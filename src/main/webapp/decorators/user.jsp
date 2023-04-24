<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title><dec:title default="Trang chủ"/></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    
    <link href="<c:url value="/assets/style/user-style.layout.css"/>" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<!-- Header-->
<%@include file="/common/user/header.jsp" %>

<!-- Main-->
<dec:body/>

<!-- Footer-->
<%@include file="/common/user/footer.jsp" %>

</body>

</html>

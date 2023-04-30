<%@ page import="com.dev4fun.model.Config" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="<c:url value="/assets/style/user/about-style.css"/>" rel="stylesheet" type="text/css"/>
<div class="policy">
    <%
        ArrayList<Config> listConfigs = (ArrayList<Config>) request.getAttribute("listConfigs");
        Config currentConfig = (Config) request.getAttribute("config");
    %>
    <div class="policy-top">
        <a href="<c:url value="/home"/>">Trang chủ </a><span>/</span>
        <a href="/about/<%=currentConfig.getName()%>"><%=currentConfig.getName()%></a>
    </div>
    <div class="policy-content">
        <div class="policy-content-left">
            <%=currentConfig.getContent()%>
        </div>
        <div class="policy-content-right">
            <div class="policy-content-right-content">
                <h3><a href="">Danh mục page</a></h3>
                <ul>
                    <%for (Config cfg : listConfigs) {%>
                    <li><a href="/about/<%=cfg.getId()%>"><%=cfg.getName()%>
                    </a></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>
</div>
<%-- header.jsp - Shared top header / topbar --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="topbar">
    <div>
        <h1>${param.pageTitle}</h1>
        <div class="breadcrumb">${param.breadcrumb}</div>
    </div>
    <div class="date-badge">
        📅 <%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %>
    </div>
</div>

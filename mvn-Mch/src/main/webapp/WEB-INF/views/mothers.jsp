<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mothers - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Mothers Registry"/>
            <jsp:param name="breadcrumb" value="Home / Mothers"/>
        </jsp:include>

        <div class="page-content">

            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">✔ Mother record added successfully!</div>
            </c:if>
            <c:if test="${param.deleted == 'true'}">
                <div class="alert alert-warning">🗑 Mother record deleted.</div>
            </c:if>

            <div class="card">
                <div class="card-header">
                    <h3>👩 Registered Mothers</h3>
                    <a href="${pageContext.request.contextPath}/mothers/add" class="btn btn-primary btn-sm">➕ Add Mother</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty mothers}">
                            <div class="alert alert-info">ℹ No mothers registered yet. Click "Add Mother" to get started.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Age</th>
                                            <th>Contact</th>
                                            <th>Blood Group</th>
                                            <th>Registered On</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="m" items="${mothers}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td><strong>${m.name}</strong></td>
                                                <td>${m.age} yrs</td>
                                                <td>${m.contactNumber}</td>
                                                <td><span class="badge badge-info">${m.bloodGroup}</span></td>
                                                <td>${m.registrationDate}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/mothers/view/${m.id}" class="btn btn-outline btn-sm">👁 View</a>
                                                    <a href="${pageContext.request.contextPath}/mothers/delete/${m.id}"
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('Delete this mother record?')">🗑</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"/>
    </div>
</div>
</body>
</html>

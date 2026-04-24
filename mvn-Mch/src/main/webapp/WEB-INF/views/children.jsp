<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Children - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Children Records"/>
            <jsp:param name="breadcrumb" value="Home / Children"/>
        </jsp:include>

        <div class="page-content">

            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">✔ Child record added successfully!</div>
            </c:if>
            <c:if test="${param.deleted == 'true'}">
                <div class="alert alert-warning">🗑 Child record deleted.</div>
            </c:if>

            <div class="card">
                <div class="card-header">
                    <h3>👶 Registered Children</h3>
                    <a href="${pageContext.request.contextPath}/children/add" class="btn btn-primary btn-sm">➕ Add Child</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty children}">
                            <div class="alert alert-info">ℹ No children registered yet.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Child Name</th>
                                            <th>Date of Birth</th>
                                            <th>Gender</th>
                                            <th>Weight (kg)</th>
                                            <th>Height (cm)</th>
                                            <th>Mother</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="child" items="${children}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td><strong>${child.name}</strong></td>
                                                <td>${child.dateOfBirth}</td>
                                                <td>${child.gender}</td>
                                                <td>${child.weightKg}</td>
                                                <td>${child.heightCm}</td>
                                                <td>${child.mother.name}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${child.healthStatus == 'Healthy'}">
                                                            <span class="badge badge-success">${child.healthStatus}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-warning">${child.healthStatus}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/children/delete/${child.id}"
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('Delete this child record?')">🗑</a>
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

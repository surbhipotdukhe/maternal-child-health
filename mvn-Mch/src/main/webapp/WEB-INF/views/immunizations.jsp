<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Immunizations - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Immunization Records"/>
            <jsp:param name="breadcrumb" value="Home / Immunizations"/>
        </jsp:include>

        <div class="page-content">

            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success">✔ Immunization record added successfully!</div>
            </c:if>
            <c:if test="${param.deleted == 'true'}">
                <div class="alert alert-warning">🗑 Immunization record deleted.</div>
            </c:if>

            <div class="card">
                <div class="card-header">
                    <h3>💉 Immunization Records</h3>
                    <a href="${pageContext.request.contextPath}/immunizations/add" class="btn btn-primary btn-sm">➕ Add Record</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty immunizations}">
                            <div class="alert alert-info">ℹ No immunization records found. Add one to get started.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Child</th>
                                            <th>Vaccine Name</th>
                                            <th>Date Given</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                            <th>Notes</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="imm" items="${immunizations}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td><strong>${imm.child.name}</strong></td>
                                                <td>${imm.vaccineName}</td>
                                                <td>${imm.dateGiven != null ? imm.dateGiven : '—'}</td>
                                                <td>${imm.dueDate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${imm.status == 'Given'}">
                                                            <span class="badge badge-success">Given</span>
                                                        </c:when>
                                                        <c:when test="${imm.status == 'Overdue'}">
                                                            <span class="badge badge-danger">Overdue</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-warning">Pending</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${imm.notes}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/immunizations/delete/${imm.id}"
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('Delete this record?')">🗑</a>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Health Reports - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Health Reports"/>
            <jsp:param name="breadcrumb" value="Home / Reports"/>
        </jsp:include>

        <div class="page-content">

            <!-- Summary Stats -->
            <div class="report-grid">
                <div class="report-stat">
                    <div class="big-number" style="color:#1a6fa8;">${totalMothers}</div>
                    <div class="label">Total Mothers</div>
                </div>
                <div class="report-stat">
                    <div class="big-number" style="color:#28a745;">${totalChildren}</div>
                    <div class="label">Total Children</div>
                </div>
                <div class="report-stat">
                    <div class="big-number" style="color:#fd7e14;">${totalImmunizations}</div>
                    <div class="label">Immunization Records</div>
                </div>
                <div class="report-stat">
                    <div class="big-number" style="color:#dc3545;">${pendingImmunizations}</div>
                    <div class="label">Pending Vaccines</div>
                </div>
            </div>

            <!-- Mothers Report Table -->
            <div class="card">
                <div class="card-header">
                    <h3>👩 Mothers Overview</h3>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty mothers}">
                            <div class="alert alert-info">No mother records available.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th><th>Name</th><th>Age</th>
                                            <th>Blood Group</th><th>Contact</th><th>Registered</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="m" items="${mothers}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td>${m.name}</td>
                                                <td>${m.age}</td>
                                                <td><span class="badge badge-info">${m.bloodGroup}</span></td>
                                                <td>${m.contactNumber}</td>
                                                <td>${m.registrationDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Upcoming Vaccines (next 30 days) -->
            <div class="card">
                <div class="card-header">
                    <h3>📅 Upcoming Vaccines (Next 30 Days)</h3>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty upcomingVaccines}">
                            <div class="alert alert-success">✔ No vaccines due in the next 30 days.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th><th>Child</th><th>Mother</th>
                                            <th>Vaccine</th><th>Due Date</th><th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="imm" items="${upcomingVaccines}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td>${imm.child.name}</td>
                                                <td>${imm.child.mother.name}</td>
                                                <td>${imm.vaccineName}</td>
                                                <td>${imm.dueDate}</td>
                                                <td><span class="badge badge-warning">${imm.status}</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- All Immunizations -->
            <div class="card">
                <div class="card-header">
                    <h3>💉 All Immunization Records</h3>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty allImmunizations}">
                            <div class="alert alert-info">No immunization records found.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th><th>Child</th><th>Vaccine</th>
                                            <th>Date Given</th><th>Due Date</th><th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="imm" items="${allImmunizations}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td>${imm.child.name}</td>
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

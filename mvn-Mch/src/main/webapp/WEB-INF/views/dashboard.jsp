<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">

    <!-- Sidebar -->
    <jsp:include page="layout/sidebar.jsp"/>

    <!-- Main Content -->
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Dashboard"/>
            <jsp:param name="breadcrumb" value="Home / Dashboard"/>
        </jsp:include>

        <div class="page-content">

            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stat-card blue">
                    <div class="stat-icon">👩</div>
                    <div class="stat-info">
                        <div class="stat-number">${totalMothers}</div>
                        <div class="stat-label">Registered Mothers</div>
                    </div>
                </div>
                <div class="stat-card green">
                    <div class="stat-icon">👶</div>
                    <div class="stat-info">
                        <div class="stat-number">${totalChildren}</div>
                        <div class="stat-label">Children Registered</div>
                    </div>
                </div>
                <div class="stat-card orange">
                    <div class="stat-icon">💉</div>
                    <div class="stat-info">
                        <div class="stat-number">${totalImmunizations}</div>
                        <div class="stat-label">Immunization Records</div>
                    </div>
                </div>
                <div class="stat-card red">
                    <div class="stat-icon">⏰</div>
                    <div class="stat-info">
                        <div class="stat-number">${pendingImmunizations}</div>
                        <div class="stat-label">Pending Vaccines</div>
                    </div>
                </div>
            </div>

            <!-- Upcoming Vaccines Table -->
            <div class="card">
                <div class="card-header">
                    <h3>⏰ Upcoming Immunizations (Next 7 Days)</h3>
                    <a href="${pageContext.request.contextPath}/immunizations" class="btn btn-outline btn-sm">View All</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty upcomingVaccines}">
                            <div class="alert alert-info">✔ No upcoming immunizations in the next 7 days.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Child Name</th>
                                            <th>Vaccine</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="imm" items="${upcomingVaccines}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td>${imm.child.name}</td>
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

            <!-- Quick Actions -->
            <div class="card">
                <div class="card-header"><h3>⚡ Quick Actions</h3></div>
                <div class="card-body" style="display:flex; gap:14px; flex-wrap:wrap;">
                    <a href="${pageContext.request.contextPath}/mothers/add"     class="btn btn-primary">➕ Add Mother</a>
                    <a href="${pageContext.request.contextPath}/children/add"    class="btn btn-success">➕ Add Child</a>
                    <a href="${pageContext.request.contextPath}/immunizations/add" class="btn btn-warning">💉 Add Immunization</a>
                    <a href="${pageContext.request.contextPath}/reports"         class="btn btn-outline">📊 View Reports</a>
                </div>
            </div>

        </div>
        <jsp:include page="layout/footer.jsp"/>
    </div>
</div>
</body>
</html>

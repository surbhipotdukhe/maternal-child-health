<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mother Details - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Mother Details"/>
            <jsp:param name="breadcrumb" value="Home / Mothers / View"/>
        </jsp:include>

        <div class="page-content">
            <div class="card">
                <div class="card-header">
                    <h3>👩 ${mother.name}</h3>
                    <a href="${pageContext.request.contextPath}/mothers" class="btn btn-outline btn-sm">← Back to List</a>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" value="${mother.name}" disabled>
                        </div>
                        <div class="form-group">
                            <label>Age</label>
                            <input type="text" value="${mother.age} years" disabled>
                        </div>
                        <div class="form-group">
                            <label>Contact Number</label>
                            <input type="text" value="${mother.contactNumber}" disabled>
                        </div>
                        <div class="form-group">
                            <label>Blood Group</label>
                            <input type="text" value="${mother.bloodGroup}" disabled>
                        </div>
                        <div class="form-group full-width">
                            <label>Address</label>
                            <input type="text" value="${mother.address}" disabled>
                        </div>
                        <div class="form-group full-width">
                            <label>Medical History</label>
                            <textarea disabled>${mother.medicalHistory}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Registration Date</label>
                            <input type="text" value="${mother.registrationDate}" disabled>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Children of this mother -->
            <div class="card">
                <div class="card-header">
                    <h3>👶 Children Linked to ${mother.name}</h3>
                    <a href="${pageContext.request.contextPath}/children/add" class="btn btn-success btn-sm">➕ Add Child</a>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty mother.children}">
                            <div class="alert alert-info">No children registered for this mother yet.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th><th>Name</th><th>Date of Birth</th>
                                            <th>Gender</th><th>Health Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${mother.children}" varStatus="st">
                                            <tr>
                                                <td>${st.count}</td>
                                                <td>${c.name}</td>
                                                <td>${c.dateOfBirth}</td>
                                                <td>${c.gender}</td>
                                                <td><span class="badge badge-success">${c.healthStatus}</span></td>
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

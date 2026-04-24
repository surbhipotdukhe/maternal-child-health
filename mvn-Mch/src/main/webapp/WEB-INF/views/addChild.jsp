<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Child - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Add Child Record"/>
            <jsp:param name="breadcrumb" value="Home / Children / Add"/>
        </jsp:include>

        <div class="page-content">
            <div class="card">
                <div class="card-header">
                    <h3>👶 Child Registration Form</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/children/add" method="post">
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="name">Child's Full Name *</label>
                                <input type="text" id="name" name="name" placeholder="e.g. Aarav Sharma" required>
                            </div>
                            <div class="form-group">
                                <label for="dateOfBirth">Date of Birth *</label>
                                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender *</label>
                                <select id="gender" name="gender" required>
                                    <option value="">-- Select Gender --</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="healthStatus">Health Status</label>
                                <select id="healthStatus" name="healthStatus">
                                    <option value="Healthy">Healthy</option>
                                    <option value="Under Observation">Under Observation</option>
                                    <option value="Critical">Critical</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="weightKg">Weight (kg)</label>
                                <input type="number" step="0.1" id="weightKg" name="weightKg" placeholder="e.g. 3.5">
                            </div>
                            <div class="form-group">
                                <label for="heightCm">Height (cm)</label>
                                <input type="number" step="0.1" id="heightCm" name="heightCm" placeholder="e.g. 50.0">
                            </div>
                            <div class="form-group full-width">
                                <label for="motherId">Link to Mother *</label>
                                <select id="motherId" name="motherId" required>
                                    <option value="">-- Select Mother --</option>
                                    <c:forEach var="m" items="${mothers}">
                                        <option value="${m.id}">${m.name} (Age: ${m.age})</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-success">💾 Save Child Record</button>
                            <a href="${pageContext.request.contextPath}/children" class="btn btn-outline">✖ Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="layout/footer.jsp"/>
    </div>
</div>
</body>
</html>

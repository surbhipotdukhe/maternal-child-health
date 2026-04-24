<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Mother - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Add New Mother"/>
            <jsp:param name="breadcrumb" value="Home / Mothers / Add"/>
        </jsp:include>

        <div class="page-content">
            <div class="card">
                <div class="card-header">
                    <h3>👩 Mother Registration Form</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/mothers/add" method="post">
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="name">Full Name *</label>
                                <input type="text" id="name" name="name" placeholder="e.g. Priya Sharma" required>
                            </div>
                            <div class="form-group">
                                <label for="age">Age *</label>
                                <input type="number" id="age" name="age" placeholder="e.g. 28" min="15" max="60" required>
                            </div>
                            <div class="form-group">
                                <label for="contactNumber">Contact Number</label>
                                <input type="text" id="contactNumber" name="contactNumber" placeholder="e.g. 9876543210">
                            </div>
                            <div class="form-group">
                                <label for="bloodGroup">Blood Group</label>
                                <select id="bloodGroup" name="bloodGroup">
                                    <option value="">-- Select Blood Group --</option>
                                    <option>A+</option><option>A-</option>
                                    <option>B+</option><option>B-</option>
                                    <option>AB+</option><option>AB-</option>
                                    <option>O+</option><option>O-</option>
                                </select>
                            </div>
                            <div class="form-group full-width">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" placeholder="Full residential address">
                            </div>
                            <div class="form-group full-width">
                                <label for="medicalHistory">Medical History / Notes</label>
                                <textarea id="medicalHistory" name="medicalHistory"
                                          placeholder="Any known conditions, allergies, previous pregnancies, etc."></textarea>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">💾 Save Mother Record</button>
                            <a href="${pageContext.request.contextPath}/mothers" class="btn btn-outline">✖ Cancel</a>
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

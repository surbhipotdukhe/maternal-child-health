<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Maternal &amp; Child Health Tracker</title>
    <meta name="description" content="Secure login to the Maternal and Child Health Tracker system">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="login-page">

<div class="login-container">

    <!-- Left Panel -->
    <div class="login-left">
        <div class="logo-icon">🏥</div>
        <h1>Maternal &amp; Child<br>Health Tracker</h1>
        <p>A comprehensive digital health management system for tracking maternal and child wellness records.</p>
        <ul class="login-features">
            <li>✅ Mother Registration & Records</li>
            <li>✅ Child Health Monitoring</li>
            <li>✅ Immunization Tracking</li>
            <li>✅ Automated Reminders</li>
            <li>✅ Health Reports & Analytics</li>
        </ul>
    </div>

    <!-- Right Panel (Login Form) -->
    <div class="login-right">
        <h2>Welcome Back 👋</h2>
        <p class="subtitle">Sign in to access the health management dashboard</p>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">⚠ ${error}</div>
        </c:if>
        <c:if test="${param.logout == 'true'}">
            <div class="alert alert-success">✔ You have been logged out successfully.</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required autofocus>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="login-btn">🔐 Sign In</button>
        </form>

        <div class="login-hint">
            <strong>Default Credentials:</strong><br>
            Username: <code>admin</code> &nbsp;|&nbsp; Password: <code>admin123</code>
        </div>
    </div>
</div>

</body>
</html>

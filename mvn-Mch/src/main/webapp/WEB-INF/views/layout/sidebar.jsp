<%-- sidebar.jsp - Shared sidebar navigation --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="sidebar">
    <div class="sidebar-brand">
        <div class="brand-icon">🏥</div>
        <div>
            <h2>MCH Tracker</h2>
            <span>Health Management System</span>
        </div>
    </div>

    <div class="sidebar-section">Main Menu</div>
    <nav>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/dashboard"
                   class="${pageContext.request.servletPath == '/WEB-INF/views/dashboard.jsp' ? 'active' : ''}">
                    <span class="icon">📊</span> Dashboard
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/mothers">
                    <span class="icon">👩</span> Mothers
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/children">
                    <span class="icon">👶</span> Children
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/immunizations">
                    <span class="icon">💉</span> Immunizations
                </a>
            </li>
        </ul>
    </nav>

    <div class="sidebar-section">Reports</div>
    <nav>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/reports">
                    <span class="icon">📈</span> Health Reports
                </a>
            </li>
        </ul>
    </nav>

    <div class="sidebar-footer">
        <div class="user-info">
            <div class="avatar">👤</div>
            <div>
                <div class="user-name">${sessionScope.loggedInUser.username}</div>
                <div class="user-role">${sessionScope.loggedInUser.role}</div>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">🚪 Logout</a>
    </div>
</div>

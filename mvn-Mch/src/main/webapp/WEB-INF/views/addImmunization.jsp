<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Immunization - MCH Tracker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="layout">
    <jsp:include page="layout/sidebar.jsp"/>
    <div class="main-content">
        <jsp:include page="layout/header.jsp">
            <jsp:param name="pageTitle" value="Add Immunization Record"/>
            <jsp:param name="breadcrumb" value="Home / Immunizations / Add"/>
        </jsp:include>

        <div class="page-content">
            <div class="card">
                <div class="card-header">
                    <h3>💉 Immunization Record Form</h3>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/immunizations/add" method="post">
                        <div class="form-grid">
                            <div class="form-group full-width">
                                <label for="childId">Select Child *</label>
                                <select id="childId" name="childId" required>
                                    <option value="">-- Select Child --</option>
                                    <c:forEach var="child" items="${children}">
                                        <option value="${child.id}">${child.name} (Mother: ${child.mother.name})</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group full-width">
                                <label for="vaccineName">Vaccine Name *</label>
                                <select id="vaccineName" name="vaccineName" required>
                                    <option value="">-- Select Vaccine --</option>
                                    <option>BCG</option>
                                    <option>Hepatitis B (Birth)</option>
                                    <option>OPV-0</option>
                                    <option>DPT-1</option>
                                    <option>DPT-2</option>
                                    <option>DPT-3</option>
                                    <option>OPV-1</option>
                                    <option>OPV-2</option>
                                    <option>OPV-3</option>
                                    <option>IPV</option>
                                    <option>Hib</option>
                                    <option>PCV</option>
                                    <option>Rotavirus</option>
                                    <option>MMR</option>
                                    <option>Varicella</option>
                                    <option>Typhoid</option>
                                    <option>Vitamin A</option>
                                    <option>Other</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dateGiven">Date Given</label>
                                <input type="date" id="dateGiven" name="dateGiven">
                            </div>
                            <div class="form-group">
                                <label for="dueDate">Due Date *</label>
                                <input type="date" id="dueDate" name="dueDate" required>
                            </div>
                            <div class="form-group">
                                <label for="status">Status *</label>
                                <select id="status" name="status" required>
                                    <option value="Pending">Pending</option>
                                    <option value="Given">Given</option>
                                    <option value="Overdue">Overdue</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="notes">Notes / Remarks</label>
                                <input type="text" id="notes" name="notes" placeholder="Any observations or remarks">
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">💾 Save Record</button>
                            <a href="${pageContext.request.contextPath}/immunizations" class="btn btn-outline">✖ Cancel</a>
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

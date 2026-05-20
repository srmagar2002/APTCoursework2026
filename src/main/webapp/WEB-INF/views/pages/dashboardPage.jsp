<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-16
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/static/imgUpload/logo/logo.svg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
</head>
<body>

<jsp:include page="../components/navbar.jsp"/>

<c:choose>
    <c:when test="${sessionScope.user.role=='ADMIN'}">
        <jsp:include page="../components/adminDashboard.jsp"/>
    </c:when>
    <c:when test="${sessionScope.user.role=='CUSTOMER'}">
        <jsp:include page="../components/userDashboard.jsp"/>
    </c:when>
</c:choose>


</body>
</html>

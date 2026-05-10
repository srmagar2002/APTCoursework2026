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

<jsp:include page="../components/footer.jsp"/>


</body>
</html>

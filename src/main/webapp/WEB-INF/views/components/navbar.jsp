<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-09
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<c:choose>
    <c:when test="${empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </c:when>

    <c:otherwise>
        <p>${sessionScope.user.role}</p>

        <a href="${pageContext.request.contextPath}/logout" class="logout"
           onclick="return confirm('Are you sure you want to logout?');">
            Logout
        </a>
    </c:otherwise>
</c:choose>


</div>
</body>
</html>

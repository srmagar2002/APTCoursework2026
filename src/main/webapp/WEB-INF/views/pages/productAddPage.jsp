<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-15
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>

<jsp:include page="../components/navbar.jsp"/>
<jsp:include page="../components/productAdd.jsp"/>
<jsp:include page="../components/footer.jsp"/>

</body>
</html>

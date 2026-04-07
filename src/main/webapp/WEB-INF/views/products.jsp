
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Products</title>
</head>
<body>
<h1>Products</h1>

<ul>
<c:forEach var="product" items="${products}" varStatus="status">
    <li class="productItem">
        <a class="product" href="#">${status.count}.
        <c:out value="${product.title}"/> </a>
        <img style="max-width: 100px" src="${pageContext.request.contextPath}/imgUpload/${product.thumbnailUrl}" alt="${product.batteryLife}">
        <p>${product.price}</p>
    </li>
</c:forEach>
</ul>

</body>
</html>

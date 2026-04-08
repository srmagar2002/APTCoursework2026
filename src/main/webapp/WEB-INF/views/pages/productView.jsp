<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-08
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>

        <li class="productItem">
            <p class="product" >
                <c:out value="${laptop.title}"/> </p>
            <img style="max-width: 100px" src="${pageContext.request.contextPath}/imgUpload/${laptop.imgUrl}" alt="${product.batteryLife}">
            <p>${laptop.price}</p>
        </li>

</ul>
</body>
</html>

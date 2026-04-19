<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-08
  Time: 08:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/imagetest"
      method="post"
      enctype="multipart/form-data">

    <label>Laptop Name:</label>
    <input type="text" name="name" required>

    <label>Image:</label>
    <input type="file" name="image" accept="image/*" required>

    <input type="submit" value="Upload">
</form>

<img src="${pageContext.request.contextPath}/static/${imagePath}" width="200">
</body>
</html>

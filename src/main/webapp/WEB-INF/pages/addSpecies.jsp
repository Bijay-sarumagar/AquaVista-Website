<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Fish Species</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div class="form-wrapper">
        <h2>Add Fish Species</h2>

        <c:if test="${not empty sessionScope.message}">
            <div class="popup-message">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/addSpecies">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="type">Type:</label>
            <input type="text" name="type" required>

            <label for="careLevel">Care Level:</label>
            <input type="text" name="careLevel" required>

            <label for="temperatureRange">Temperature Range:</label>
            <input type="text" name="temperatureRange" required>

            <label for="phRange">pH Range:</label>
            <input type="text" name="phRange" required>

            <div class="form-actions">
                <button type="submit">Add Species</button>
                <a href="${pageContext.request.contextPath}/fishspecies" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
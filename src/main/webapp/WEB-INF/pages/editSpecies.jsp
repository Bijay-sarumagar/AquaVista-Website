<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Fish Species</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>
    <div class="form-wrapper">
        <h2>Edit Fish Species</h2>

        <c:if test="${not empty sessionScope.message}">
            <div class="popup-message">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/editSpecies">
            <input type="hidden" name="speciesId" value="${species.speciesId}">

            <label for="name">Name:</label>
            <input type="text" name="name" value="${species.name}" required>

            <label for="type">Type:</label>
            <input type="text" name="type" value="${species.type}" required>

            <label for="careLevel">Care Level:</label>
            <input type="text" name="careLevel" value="${species.careLevel}" required>

            <label for="temperatureRange">Temperature Range:</label>
            <input type="text" name="temperatureRange" value="${species.temperatureRange}" required>

            <label for="phRange">pH Range:</label>
            <input type="text" name="phRange" value="${species.phRange}" required>

            <div class="form-actions">
                <button type="submit">Update Species</button>
                <a href="${pageContext.request.contextPath}/fishspecies" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

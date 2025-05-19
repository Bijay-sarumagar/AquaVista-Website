<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Aquarium</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>
    <div class="form-wrapper">
        <h2>Edit Aquarium</h2>
        <form method="post" action="${pageContext.request.contextPath}/editAquarium">
            <input type="hidden" name="aquariumId" value="${aquarium.aquariumId}">

            <label for="name">Name:</label>
            <input type="text" name="name" value="${aquarium.name}" required>

            <label for="description">Description:</label>
            <input type="text" name="description" value="${aquarium.description}" required>

            <label for="size">Size (liters):</label>
            <input type="number" name="size" step="0.1" value="${aquarium.size}" required>

            <label for="ownerId">Owner ID:</label>
            <input type="number" name="ownerId" value="${aquarium.ownerId}" required>

            <div class="form-actions">
                <button type="submit">Update Aquarium</button>
                <a href="${pageContext.request.contextPath}/aquariums" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

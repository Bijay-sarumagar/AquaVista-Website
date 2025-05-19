<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Aquarium</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
</head>
<body>
    <div class="form-wrapper">
        <h2>Add Aquarium</h2>
        <form method="post" action="${pageContext.request.contextPath}/addAquarium">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="description">Description:</label>
            <input type="text" name="description" required>

            <label for="size">Size (liters):</label>
            <input type="number" name="size" step="0.1" required>

            <label for="ownerId">Owner ID:</label>
            <input type="number" name="ownerId" required>

            <div class="form-actions">
                <button type="submit">Add Aquarium</button>
                <a href="${pageContext.request.contextPath}/aquariums" class="cancel-link">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

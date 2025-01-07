<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="profile_title" /></title> <!-- Titre dynamique -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .profile-card {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-info {
            margin-top: 20px;
        }
        .profile-card h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .profile-card p {
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container profile-container">
    <div class="profile-card text-center">
        <img src="<spring:url value='/images/user.png'/>" alt="Avatar" class="profile-avatar">

        <h3>${user.firstName} ${user.lastName}</h3>
        <p><strong><spring:message code="email_label" />:</strong> ${user.email}</p>
        <p><strong><spring:message code="phone_label" />:</strong> ${user.phone}</p>
        <p><strong><spring:message code="address_label" />:</strong> ${user.address}</p>
    </div>
</div>

</body>
</html>

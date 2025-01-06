<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="page.title.register" /></title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h2><spring:message code="form.createAccount" /></h2>

  <!-- Utilisation de form:form pour intégrer la gestion des objets Model -->
  <form:form id="form" method="POST" action="/firstSpring/register" modelAttribute="user">

    <div class="form-group">
      <label for="firstName"><spring:message code="form.firstName" /></label>
      <form:input path="firstName" class="form-control" id="firstName" required="true"/>
      <form:errors path="firstName" class="error text-danger" />
    </div>

    <div class="form-group">
      <label for="lastName"><spring:message code="form.lastName" /></label>
      <form:input path="lastName" class="form-control" id="lastName" required="true"/>
      <form:errors path="lastName" class="error text-danger" />
    </div>

    <div class="form-group">
      <label for="email"><spring:message code="form.email" /></label>
      <form:input path="email" type="email" class="form-control" id="email" required="true"/>
      <form:errors path="email" class="error text-danger" />
    </div>

    <div class="form-group">
      <label for="phone"><spring:message code="form.phone" /></label>
      <form:input path="phone" class="form-control" id="phone" required="true"/>
      <form:errors path="phone" class="error text-danger" />
    </div>

    <div class="form-group">
      <label for="address"><spring:message code="form.address" /></label>
      <form:textarea path="address" class="form-control" id="address" required="true"></form:textarea>
      <form:errors path="address" class="error text-danger" />
    </div>

    <div class="form-group">
      <label for="password"><spring:message code="form.password" /></label>
      <form:input path="password" type="password" class="form-control" id="password" required="true"/>
      <form:errors path="password" class="error text-danger" />
    </div>

    <button type="submit" class="btn btn-primary btn-block"><spring:message code="form.signUp" /></button>
  </form:form>

  <p class="text-center mt-3">
    <spring:message code="form.alreadyHaveAccount.question" /><a href="/firstSpring/login"><spring:message code="form.alreadyHaveAccount.cree" /></a>
  </p>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

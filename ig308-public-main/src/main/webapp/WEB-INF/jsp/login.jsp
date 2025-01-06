<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="page.title" /></title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <h2 class="text-center"><spring:message code="page.title.login" /></h2>

      <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
          <spring:message code="error.generic" />
        </div>
      </c:if>

      <form action="/firstSpring/login" method="POST"> <!-- Action modifiée ici -->
        <div class="form-group">
          <label for="email"><spring:message code="form.identifiant" /></label>
          <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="password"><spring:message code="form.password" /></label>
          <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block"><spring:message code="form.submit" /></button>
      </form>

      <p class="text-center mt-3">
        <spring:message code="form.register.question" /><a href="/firstSpring/register"><spring:message code="form.register.cree" /></a>
      </p>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

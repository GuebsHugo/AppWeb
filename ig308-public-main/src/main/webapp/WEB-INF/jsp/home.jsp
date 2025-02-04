<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="page.title.home" /></title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/home"><spring:message code="navbar.home" /></a>
  <ul class="navbar-nav ml-auto">
    <li class="nav-item"><a class="nav-link" href="/catalogue"><spring:message code="navbar.catalogue" /></a></li>
    <li class="nav-item"><a class="nav-link" href="/login"><spring:message code="navbar.login" /></a></li>
    <li class="nav-item"><a class="nav-link" href="/register"><spring:message code="navbar.register" /></a></li>
  </ul>
</nav>

<div class="container">
  <h1><spring:message code="hero.title.home" /></h1>
  <p><spring:message code="hero.subtitle.home" /></p>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

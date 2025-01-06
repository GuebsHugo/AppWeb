<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="page.title.catalogue" /></title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h2><spring:message code="catalog.title" /></h2>
  <div class="row">
    <!-- Boucle sur les catégories -->
    <c:forEach var="category" items="${categories}">
      <div class="col-md-3">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">${category.name}</h5>
            <a href="/category/${category.id}" class="btn btn-primary"><spring:message code="category.title" /></a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</body>
</html>


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
    <c:forEach var="category" items="${categories}">
      <div class="col-md-3">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">${category.name}</h5>
            <a href="/firstSpring/catalogue?categoryId=${category.id}" class="btn btn-primary">
              <spring:message code="category.title" />
            </a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <c:if test="${not empty products}">
    <h3 class="mt-4"><spring:message code="products.title" /></h3>
    <div class="row">
      <c:forEach var="product" items="${products}">
        <div class="col-md-4">
          <div class="card mb-3">
            <div class="card-body">
              <h5 class="card-title">${product.label}</h5>
              <p class="card-text">${product.description}</p>
              <p class="card-text">
                <strong><spring:message code="product.price" />:</strong> ${product.price} €<br>
                <strong><spring:message code="product.stock" />:</strong> ${product.stock}
              </p>
              <form method="post" action="/firstSpring/cart/add">
                <input type="hidden" name="productId" value="${product.id}">
                <c:if test="${not empty categoryId}">
                  <input type="hidden" name="categoryId" value="${categoryId}">
                </c:if>
                <button type="submit" class="btn btn-success">
                  <spring:message code="product.addCart" />
                </button>
              </form>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>
</div>
</body>
</html>

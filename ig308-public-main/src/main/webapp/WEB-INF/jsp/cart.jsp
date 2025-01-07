<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><spring:message code="cart_title" /></title>

  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h1><spring:message code="cart_title" /></h1>

  <c:if test="${empty cart}">
    <p><spring:message code="empty_cart_message" /></p>
    <a href="/firstSpring/catalogue" class="btn btn-primary"><spring:message code="catalogue_button" /></a>
  </c:if>

  <c:if test="${not empty cart}">
    <table class="table">
      <thead>
      <tr>
        <th><spring:message code="product_column" /></th>
        <th><spring:message code="price_column" /></th>
        <th><spring:message code="quantity_column" /></th>
        <th><spring:message code="total_column" /></th>
        <th><spring:message code="actions_column" /></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${cart}">
        <tr>
          <td>${item.product.label}</td>
          <td>${item.product.price} €</td>
          <td>
            <form method="post" action="/firstSpring/cart/update">
              <input type="hidden" name="productId" value="${item.product.id}">
              <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control" style="width: 80px; display: inline;">
              <button type="submit" class="btn btn-sm btn-success"><spring:message code="update_button" /></button>
            </form>
          </td>
          <td>${item.product.price * item.quantity} €</td>
          <td>
            <form method="post" action="/firstSpring/cart/remove">
              <input type="hidden" name="productId" value="${item.product.id}">
              <button type="submit" class="btn btn-sm btn-danger"><spring:message code="remove_button" /></button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <div class="text-right">
      <h3>Total Général : ${total} €</h3>
      <form method="post" action="/firstSpring/paypal">
        <button type="submit" class="btn btn-success"><spring:message code="checkout_button" /></button>
      </form>
      <form method="post" action="/firstSpring/cart/clear">
        <button type="submit" class="btn btn-danger"><spring:message code="clear_cart_button" /></button>
      </form>
    </div>
  </c:if>
</div>
</body>
</html>

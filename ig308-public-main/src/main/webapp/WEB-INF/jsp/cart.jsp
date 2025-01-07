<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Votre Panier</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h1>Votre Panier</h1>

    <!-- Vérifier si le panier est vide -->
    <c:if test="${empty cart}">
      <p>Votre panier est vide.</p>
      <a href="/firstSpring/catalogue" class="btn btn-primary">Retour au catalogue</a>
    </c:if>

    <!-- Affichage des produits si le panier contient des articles -->
    <c:if test="${not empty cart}">
      <table class="table">
        <thead>
          <tr>
            <th>Produit</th>
            <th>Prix Unitaire</th>
            <th>Quantité</th>
            <th>Total</th>
            <th>Actions</th>
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
                  <button type="submit" class="btn btn-sm btn-success">Mettre à jour</button>
                </form>
              </td>
              <td>${item.product.price * item.quantity} €</td>
              <td>
                <form method="post" action="/firstSpring/cart/remove">
                  <input type="hidden" name="productId" value="${item.product.id}">
                  <button type="submit" class="btn btn-sm btn-danger">Supprimer</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- Résumé du panier -->
      <div class="text-right">
        <h3>Total Général : ${total} €</h3>
        <form method="post" action="/firstSpring/cart/checkout">
          <button type="submit" class="btn btn-success">Passer à la Caisse</button>
        </form>
        <form method="post" action="/firstSpring/cart/clear">
          <button type="submit" class="btn btn-danger">Vider le Panier</button>
        </form>
      </div>
    </c:if>
  </div>
</body>
</html>


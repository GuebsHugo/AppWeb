<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catalogue des produits</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <h2>Catalogue des produits</h2>
  <div class="row">
    <!-- Boucle sur les catégories -->
    <c:forEach var="category" items="${categories}">
      <div class="col-md-3">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">${category.name}</h5>
            <a href="/category/${category.id}" class="btn btn-primary">Voir les produits</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>


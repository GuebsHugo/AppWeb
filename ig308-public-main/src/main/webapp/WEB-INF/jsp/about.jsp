<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>À propos de VenteVape</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    /* Hero Section */
    .hero-section {
      background: url('<spring:url value="/images/vape-banner.jpg"/>') no-repeat center center/cover;
      height: 70vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      text-align: center;
      position: relative;
    }

    /* Nouveau style pour le nom de l'entreprise */
    .hero-section h1 {
      font-family: 'Playfair Display', serif;
      font-size: 4rem;
      font-weight: 900;
      text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.7);
      letter-spacing: 2px;
      color: #2c3e50; /* Sombre, couleur plus élégante */
    }

    /* Sous-titre */
    .hero-section p {
      font-family: 'Roboto', sans-serif;
      font-size: 1.25rem;
      font-weight: 400;
      margin-top: 1rem;
      color: #bdc3c7;
    }

    /* Section Mission */
    .mission-section, .team-section {
      padding: 3rem 0;
    }

    /* Section Équipe */
    .team-member {
      text-align: center;
      margin-bottom: 2rem;
    }

    .team-member img {
      border-radius: 50%;
      max-width: 100px;
      margin-bottom: 1rem;
    }

    .team-member h5 {
      margin-top: 0.5rem;
      color: #34495e;
      font-weight: 600;
    }

    /* Utilisation de Flexbox pour centrer les membres sur une seule ligne */
    .team-row {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 2rem; /* Espace entre les membres */
    }

    /* Section Valeurs */
    .values-section {
      background-color: #f8f9fa;
      padding: 3rem 0;
    }

    .values-section .icon {
      font-size: 3rem;
      color: #007bff;
      margin-bottom: 1rem;
    }

    /* Section Arômes */
    .aroma-section {
      background: #f5f5f5;
      padding: 2rem 0;
      border-radius: 10px;
    }
  </style>
</head>
<body>
<!-- Section Bannière -->
<div class="hero-section">
  <div>
    <h1>VenteVape</h1> <!-- Nouveau style pour le nom de l'entreprise -->
    <p class="lead">Découvrez une nouvelle expérience de vape avec des produits de qualité.</p>
  </div>
</div>

<!-- Section Mission -->
<div class="container mission-section">
  <div class="row">
    <div class="col-md-6">
      <h2>Notre mission</h2>
      <p>
        Chez VenteVape, notre mission est de proposer les meilleures vapes, recharges et arômes pour offrir à nos clients
        une expérience unique et satisfaisante. Nous mettons un point d'honneur à garantir des produits de qualité
        et une large gamme de saveurs pour répondre à toutes les envies.
      </p>
    </div>
    <div class="col-md-6">
      <img src="<spring:url value='/images/mission-vape.jpg'/>" class="img-fluid rounded" alt="Notre mission">
    </div>
  </div>
</div>

<!-- Section Valeurs -->
<div class="values-section">
  <div class="container">
    <h2 class="text-center">Nos valeurs</h2>
    <div class="row text-center mt-4">
      <div class="col-md-4">
        <div class="icon">🌿</div>
        <h5>Qualité</h5>
        <p>Nous sélectionnons soigneusement chaque produit pour garantir une expérience haut de gamme.</p>
      </div>
      <div class="col-md-4">
        <div class="icon">🍓</div>
        <h5>Variété</h5>
        <p>Explorez un large choix d'arômes et de saveurs pour personnaliser votre vape.</p>
      </div>
      <div class="col-md-4">
        <div class="icon">🚚</div>
        <h5>Service</h5>
        <p>Un service client réactif et une livraison rapide pour votre satisfaction.</p>
      </div>
    </div>
  </div>
</div>

<!-- Section Arômes -->
<div class="container aroma-section text-center my-5">
  <h2>Découvrez nos arômes exclusifs</h2>
  <p>
    Des saveurs classiques comme la menthe fraîche et la vanille aux mélanges exotiques comme mangue-passion,
    nous avons tout pour satisfaire vos envies.
  </p>
  <a href="/products" class="btn btn-primary">Voir nos produits</a>
</div>

<!-- Section Équipe -->
<div class="container team-section">
  <h2 class="text-center">Rencontrez notre équipe</h2>
  <div class="team-row">
    <div class="team-member">
      <img src="<spring:url value='/images/wiwi.jpg'/>" alt="Wiwi">
      <h5>Wiwi</h5>
      <p>Fondateur & Directeur Créatif</p>
    </div>
    <div class="team-member">
      <img src="<spring:url value='/images/nico.jpg'/>" alt="Nico">
      <h5>Nico</h5>
      <p>Responsable Marketing & Communication</p>
    </div>
    <div class="team-member">
      <img src="<spring:url value='/images/peps.jpg'/>" alt="Peps">
      <h5>Peps</h5>
      <p>Responsable Produit & Innovation</p>
    </div>
  </div>
</div>

<!-- Section Contact -->
<div class="container text-center mt-5">
  <h2>Contactez-nous</h2>
  <p>Vous avez une question ou une suggestion ? Nous sommes là pour vous aider !</p>
  <a href="/contact" class="btn btn-primary">Contactez-nous</a>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

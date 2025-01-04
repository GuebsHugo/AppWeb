<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/importTags.jsp" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link type="text/css" href="<spring:url value='/css/first.css'/>" rel="Stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <title>${title}</title>

        <spring:url var="localeFr" value="">
            <spring:param name="locale" value="fr" />
        </spring:url>

        <spring:url var="localeEn" value="">
            <spring:param name="locale" value="en" />
        </spring:url>


    </head>

    <body>



        <!-- Menu de navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<spring:url value='/home'/>">Accueil</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <!-- Liens de navigation -->
        <li class="nav-item">
          <a class="nav-link" href="<spring:url value='/catalogue'/>">Catalogue</a>
        </li>

        <!-- Partie connexion / déconnexion -->
          <c:choose>
              <c:when test="${empty sessionScope.user}">
                  <li class="nav-item">
                      <a class="nav-link" href="<spring:url value='/login'/>">Se connecter</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<spring:url value='/register'/>">S'inscrire</a>
                  </li>
              </c:when>
              <c:otherwise>
                  <li class="nav-item">
                      <span class="navbar-text">Bienvenue, ${sessionScope.user.username} !</span>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<spring:url value='/logout'/>">Se déconnecter</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<spring:url value='/profile'/>">Mon compte</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="<spring:url value='/cart'/>">Panier</a>
                  </li>
              </c:otherwise>
          </c:choose>

          <!-- Drapeaux pour changer de langue -->
        <li class="nav-item">
          <a class="nav-link" href="?locale=fr">
            <img src="${pageContext.request.contextPath}/images/fr.jpg"
                 alt="Français" class="flag"/>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="?locale=en">
            <img src="${pageContext.request.contextPath}/images/en.jpg"
                 alt="English" class="flag"/>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

        <img src="<spring:url value='/images/images.jpg'/>" />

        <!-- Contenu principal -->
        <div>
            <tiles:insertAttribute name="main-content" />
        </div>
        <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
        </script>

    </body>
</html>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/importTags.jsp" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link type="text/css" href="<spring:url value='/css/first.css'/>" rel="Stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title><spring:message code="page.title.template" /></title>

    <spring:url var="localeFr" value="">
        <spring:param name="locale" value="fr" />
    </spring:url>

    <spring:url var="localeEn" value="">
        <spring:param name="locale" value="en" />
    </spring:url>

    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Assurez-vous que le body occupe toute la hauteur de la fenêtre */
        }

        .content {
            flex: 1; /* Permet au contenu de remplir l'espace restant */
        }

        footer {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
            text-align: center;
            margin-top: auto; /* Garantit que le footer reste en bas même si le contenu est petit */
        }
        .user {
            width: 35px; /* Définissez la largeur de l'image */
            height: 35px; /* Définissez la hauteur de l'image */
            object-fit: cover; /* Garantit que l'image est bien ajustée sans être déformée */
        }

    </style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="<spring:url value='/hello/welcome'/>">
            <img src="<spring:url value='/images/logo.png'/>" alt="Logo" style="height: 40px;"/>
            <span>Accueil</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value='/catalogue'/>"><spring:message code="nav.catalogue" /></a>
                </li>

                <c:choose>
                    <c:when test="${empty pageContext.request.userPrincipal.principal.username}">
                        <li class="nav-item">
                            <a class="nav-link" href="<spring:url value='/login'/>"><spring:message code="nav.login" /></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<spring:url value='/register'/>"><spring:message code="nav.register" /></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="<spring:url value='/logout'/>"><spring:message code="nav.logout" /></a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value='/about'/>"><spring:message code="nav.about" /></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="?locale=fr">
                        <img src=<spring:url value='/images/fr.png'/> alt="Français" class="flag"/>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?locale=en">
                        <img src=<spring:url value='/images/en.png'/> alt="English" class="flag"/>
                    </a>
                </li>

                <c:choose>
                    <c:when test="${not empty pageContext.request.userPrincipal.principal.username}">
                        <li class="nav-item">
                            <a class="nav-link" href="/firstSpring/profile">
                                <img src="<spring:url value='/images/user.png'/>" alt="user" class="user"/>
                            </a>
                        </li>
                    </c:when>
                </c:choose>

                <li class="nav-item">
                    <a class="nav-link cart-icon" href="<spring:url value='/cart'/>">
                        <i class="bi bi-cart" style="font-size: 1.5rem;"></i>
                        <span class="badge bg-danger text-white">
                            <c:out value="${sessionScope.cart != null ? sessionScope.cart.size() : 0}" />
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="content">
    <div class="container mt-4">
        <div class="text-center">
            <img src="<spring:url value='/images/images.jpg'/>" class="img-fluid" alt="Image principale" />
        </div>
        <div class="text-center mt-4">
            <tiles:insertAttribute name="main-content" />
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <p class="mb-0"><spring:message code="footer.copyright" /></p>
        <p class="mb-0">
            <spring:message code="footer.connected" />
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <span>${pageContext.request.userPrincipal.name}</span>
                </c:when>
                <c:otherwise>
                    <span><spring:message code="footer.notconnected" /></span>
                </c:otherwise>
            </c:choose>
        </p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/importTags.jsp" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="<spring:url value='/hello/welcome'/>"><spring:message code="nav.home" /></a>
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
                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value='/catalogue'/>"><spring:message code="nav.catalogue" /></a>
                </li>

                <c:choose>
                    <c:when test="${empty sessionScope.user}">
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
                        <li class="nav-item">
                            <a class="nav-link" href="<spring:url value='/profile'/>">${sessionScope.user.username}</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item">
                    <a class="nav-link" href="<spring:url value='/about'/>"><spring:message code="nav.about" /></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="?locale=fr">
                        <img src="${pageContext.request.contextPath}/images/fr.png" alt="Français" class="flag"/>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?locale=en">
                        <img src="${pageContext.request.contextPath}/images/en.png" alt="English" class="flag"/>
                    </a>
                </li>

                <!-- Icône du panier -->
                <!-- Icône du panier -->
                <li class="nav-item">
                    <a class="nav-link cart-icon" href="<spring:url value='/cart'/>">
                        <i class="bi bi-cart" style="font-size: 1.5rem;"></i>
                        <!-- Affichage dynamique du nombre d'articles -->
                        <span class="badge bg-danger text-white">
                            <!-- Utilisation de JSTL pour récupérer la taille du panier -->
                            <c:out value="${sessionScope.cart != null ? sessionScope.cart.size() : 0}" />
                        </span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>


<img src="<spring:url value='/images/images.jpg'/>" />

<div>
    <tiles:insertAttribute name="main-content" />
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
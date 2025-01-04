<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/importTags.jsp" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
    <style>
        .flags-container {
            position: absolute;
            top: 10px; /* Positionné en haut */
            right: 10px; /* Positionné à gauche */
        }

        .flag {
            width: 30px; /* Taille des drapeaux */
            height: 30px; /* Hauteur des drapeaux */
            margin-right: 10px; /* Espacement entre les drapeaux */
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar .right {
            float: right;
        }
    </style>

    <head>
        <link type="text/css" href="<spring:url value='/css/first.css'/>" rel="Stylesheet">
        <title>${title}</title>
        <img src="<spring:url value='/images/images.jpg'/>" />

        <spring:url var="localeFr" value="">
            <spring:param name="locale" value="fr" />
        </spring:url>

        <spring:url var="localeEn" value="">
            <spring:param name="locale" value="en" />
        </spring:url>

        <div class="flags-container">
            <a href="?locale=fr">
                <img src="${pageContext.request.contextPath}/images/fr.jpg" alt="Français" class="flag"/>
            </a>
            <a href="?locale=en">
                <img src="${pageContext.request.contextPath}/images/en.jpg" alt="English" class="flag"/>
            </a>
        </div>
    </head>

    <body>
        <!-- Menu de navigation -->
        <div class="navbar">
            <a href="<spring:url value='/home'/>">Accueil</a>
            <a href="<spring:url value='/catalogue'/>">Catalogue</a>

            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <!-- Si l'utilisateur n'est pas connecté -->
                    <a href="<spring:url value='/login'/>">Se connecter</a>
                    <a href="<spring:url value='/register'/>">S'inscrire</a>
                </c:when>
                <c:otherwise>
                    <!-- Si l'utilisateur est connecté -->
                    <span style="color: white;">Bienvenue, ${sessionScope.user.username} !</span>
                    <a href="<spring:url value='/logout'/>">Se déconnecter</a>
                    <a href="<spring:url value='/profile'/>">Mon compte</a>
                    <a href="<spring:url value='/cart'/>">Panier</a>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Contenu principal -->
        <div>
            <tiles:insertAttribute name="main-content" />
        </div>

    </body>
</html>

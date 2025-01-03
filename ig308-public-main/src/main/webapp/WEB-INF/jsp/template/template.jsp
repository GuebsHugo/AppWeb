<%@ page pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>

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
</style>

<head>
    <link type="text/css" href="<spring:url value='/css/first.css'/>"
          rel="Stylesheet">
    <title>${title}</title>
    <img src='<spring:url value='/images/images.jpg'/>' />

    <spring:url var ="localeFr" value="">
        <spring:param name="locale" value = "fr"/>
    </spring:url>

    <spring:url var ="localeEn" value="">
        <spring:param name="locale" value = "en"/>
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
<div>
</div>

<div>
    <tiles:insertAttribute name="main-content" />
</div>

</body>
</html>

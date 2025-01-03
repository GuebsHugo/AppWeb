<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>
<html>
<head>
    <title> Welcome </title>
</head>
<body>
<h1>Welcome to our site!</h1>

<form:form id="form" method="POST" action="/firstSpring/hello/send" modelAttribute="magicKeyForm">
    <form:label path="magicKey">
        <spring:message code ="magicKeyLabel"/>
    </form:label>
    <form:input path="magicKey" />

    <form:button type="submit">
        <spring:message code ="magicKeySendButton"/>
    </form:button>
</form:form>

</body>
</html>

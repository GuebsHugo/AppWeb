<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/importTags.jsp"%>

<html>
<head>
    <title>Inscription</title>
</head>
<body>
<h1>Welcome on the inscription page!</h1>
<form:form id="form" method="POST" action="/firstSpring/user" modelAttribute="currentUser">
    <div>
        <form:label path="name">Name</form:label>
        <form:input path="name" />
        <form:errors path="name" cssClass="error" />
    </div>
    <div>
        <form:label path="age">Age</form:label>
        <form:input path="age" />
        <form:errors path="age" cssClass="error" />
    </div>
    <div>
    <label>Sexe</label>
        <form:radiobutton path="male" value="true" label="Boy" />
        <form:radiobutton path="male" value="false" label="Girl" />
        <form:errors path="male" cssClass="error" />
    </div>
    <div>
        <label>Hobby</label>
        <form:select path="hobby">
            <form:option value="" label="Select a hobby"/>
            <form:options items="${hobbies}" itemValue="id" itemLabel="name"/>
        </form:select>
        <form:errors path="hobby" cssClass="error" />
    </div>

    <div>
    <form:button type="submit">Send</form:button>
    </div>
</form:form>
</body>
</html>

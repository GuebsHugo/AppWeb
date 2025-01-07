<%--
  Created by IntelliJ IDEA.
  User: hugog
  Date: 07-01-25
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@include file="include/importTags.jsp"%>

<div style="display:flex; justify-content: center">
    <h1>Hello there !</h1>
    <sec:authorize access="isAuthenticated()">
        <p>You're logged</p>
    </sec:authorize>
    <sec:authorize access="hasRole('ADMIN')">
        <p><a href="<spring:url value='/admin'/>">Go to admin</a></p>
    </sec:authorize>
</div>
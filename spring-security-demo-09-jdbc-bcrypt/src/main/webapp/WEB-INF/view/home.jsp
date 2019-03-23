<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

	<html>

<head>
<title>luv2code Company Home Page</title>
</head>

<body>

<h2>luv2code Company Home Page</h2>
<hr> 
<p>
Welcome to the luv2code company Home Page
</p>
<hr>
<!-- display username and role -->

<p>
User:<security:authentication property="principal.username"/>
<br><br>
Role(s): <security:authentication property="principal.authorities"/>
</p>
<hr>
<security:authorize access="hasRole('MANAGER')">
<!--  add a link to point to /leaders... this is for the managers -->
<p>
<a href="${pageContext.request.contextPath }/leaders">Leadership Meeting</a>
(Only for Manager peeps)
</p>
<hr>
</security:authorize>
<security:authorize access="hasRole('ADMIN')">
<!-- add a link to point to /systems.... this is for admins -->
<p>
<a href="${pageContext.request.contextPath }/systems">IT systems Meeting</a>
(Only for Admin peeps)
</p>
<hr>
</security:authorize>
<!-- add a logout button -->
<form:form action="${pageContext.request.contextPath }/logout" method="POST">

<input type="submit" value="logout"/>
</form:form>
</body>
</html>
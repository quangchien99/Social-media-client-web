<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css">
<title>Login</title>
</head>
<body>
	<div class="container-login100"
		style="background-color: #aacfcf;">
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<span class="fadeIn first"> Login</span>
				<form id="form-login"
					action="${pageContext.request.contextPath}/login" method="post"
					onsubmit="return validateForm()">
					<input type="text" id="username" class="fadeIn second"
						name=username placeholder="Username"> <input
						type="password" id="password" class="fadeIn third" name="password"
						placeholder="Password"><br>
					<c:if test="${not empty errorMessage}">
						<font color="red"> <c:out value="${errorMessage}" />
						</font>
					</c:if>

					<div><a href="${pageContext.request.contextPath}/forgot">Forgot Password?</a></div>
						
					
					<div><a href="${pageContext.request.contextPath}/register">Register</a></div>
						
					

					<input type="submit" id="submit" class="fadeIn fourth"
						value="Log In">

					<div><a href="https://www.facebook.com/dialog/oauth?client_id=889791844829993&redirect_uri=http://localhost:8080/social-media-platform/AccessFacebook">Login with <strong>Facebook</strong></a>
					</div>
						
				</form>
			</div>
		</div>
	</div>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
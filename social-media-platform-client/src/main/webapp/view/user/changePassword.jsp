<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/changepassword.css">

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Change password</title>
</head>
<body>
	<div class="container-login100">
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<span class="fadeIn first">Change Password</span>
				<form id="form-login"
					action="${pageContext.request.contextPath}/changePassword"
					method="post" onsubmit="return validateForm()">
					<input type="password" id="newpassword" class="fadeIn second"
						name="newpassword" placeholder="New Password *"> <input
						type="password" id="confirmpassword" class="fadeIn third"
						name="confirmpassword" placeholder="Confirm Password *">
					<c:if test="${not empty errorMessage3}">
						<font color="red"> <c:out value="${errorMessage3}" />
						</font>
					</c:if>
					<c:if test="${not empty errorMessage1}">
						<font color="red"> <c:out value="${errorMessage1}" />
						</font>
					</c:if>
					<input type="submit" id="submit" class="fadeIn fourth" value="Save">

				</form>
				<c:if test="${not empty errorMessage}">
					<font color="red"> <c:out value="${errorMessage}" />
					</font>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
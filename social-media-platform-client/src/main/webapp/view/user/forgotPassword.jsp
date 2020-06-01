<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/forgotpassword.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<style>
body {
	background-color: #aacfcf;
}
</style>
</head>
<body>
	<div class="form-gap"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Forgot Password?</h2>
							<p>You can reset your password here.</p>
							<div class="panel-body">

								<form id="register-form" role="form" autocomplete="off"
									class="form" method="post">

									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input id="username" name="username"
												placeholder="User Name *" class="form-control" type="text">
										</div>
									</div>
									<c:if test="${not empty errorMessage0}">
										<font color="red"> <c:out value="${errorMessage0}" />
										</font>
									</c:if>
									<div class="form-group">
										<select class="form-control" name="question">
											<option class="hidden" selected disabled>Select Your
												Security Question</option>
											<option value='What is your
												favourite book?'>What
												is your favorite book?</option>
											<option value='What is your nickname?'>What is your
												nickname?</option>
											<option value='What is your favourite food?'>What is
												your favorite food?</option>
											<option value="What is your pet's name?">What is
												your pet's name?</option>
											<option
												value="What kinds of instrument do you know how to
												play?">What
												kinds of instrument do you know how to play?</option>
										</select>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" name="answer"
											placeholder="Enter Your Answer *" value="" />
									</div>
									<c:if test="${not empty errorMessage}">
										<font color="red"> <c:out value="${errorMessage}" />
										</font>
									</c:if>
									<div class="form-group">
										<input name="recover-submit"
											class="btn btn-lg btn-primary btn-block"
											value="Reset Password" type="submit">

									</div>

									<input type="hidden" class="hide" name="token" id="token"
										value="">
									<div>
										<a href="${pageContext.request.contextPath}//login">Back to <strong>Login</strong></a>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
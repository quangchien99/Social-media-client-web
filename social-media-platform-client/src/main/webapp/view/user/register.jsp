<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css">
<script src="${pageContext.request.contextPath}/js/register.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>Welcome to HANU social networking!</p>
			</div>
			<div class="col-md-9 register-right">

				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<h3 class="register-heading">Create Account</h3>
						<form id="form-login" action="" method="post"
							onsubmit="return validateForm()">
							<div class="row register-form">
								<div class="col-md-6">
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-user"></i>
											</span>
										</div>
										<input id="firstname" name="firstName" class="form-control"
											placeholder="First Name *" type="text">
									</div>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-user"></i>
											</span>
										</div>
										<input id="lastname" name="lastName" class="form-control"
											placeholder="Last Name *" type="text">
									</div>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-user"></i>
											</span>
										</div>
										<input id="username" name="profileName" class="form-control"
											placeholder="User Name *" type="text">
									</div>
									<c:if test="${not empty errorMessage}">
										<font color="red"> <c:out value="${errorMessage}" />
										</font>
									</c:if>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="fa fa-building"></i>
											</span>
										</div>
										<input id="address" name="address" type="text"
											class="form-control" placeholder="Address *" value="" />
									</div>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="fa fa-envelope"></i>
											</span>
										</div>
										<input id="email" name="email" class="form-control"
											placeholder="Email address *" type="email"><br>
										<c:if test="${not empty errorMessage1}">
											<font color="red"> <c:out value="${errorMessage1}" />
											</font>
										</c:if>
									</div>
									<p class="text-center">
										Have an account? <a
											href="${pageContext.request.contextPath}/login">Log In</a>
									</p>

								</div>
								<div class="col-md-6">

									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-phone"></i>
											</span>
										</div>

										<input id="phonenumber" name="phoneNumber"
											class="form-control" placeholder="Phone number *" type="text"><br>

									</div>
									<c:if test="${not empty errorMessage2}">
										<font color="red"> <c:out value="${errorMessage2}" />
										</font>
									</c:if>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-lock"></i>
											</span>
										</div>
										<input id="password" name="password" class="form-control"
											placeholder="Create Password *" type="password"><br>
										<c:if test="${not empty errorMessage3}">
											<font color="red"> <c:out value="${errorMessage3}" />
											</font>
										</c:if>
									</div>
									<div class="form-group input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="fa fa-lock"></i>
											</span>
										</div>
										<input id="confirmpassword" name="confirmPassword"
											class="form-control" placeholder="Confirm Password *"
											type="password"><br>

									</div>
									<c:if test="${not empty errorMessage4}">
										<font color="red"> <c:out value="${errorMessage4}" />
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
										<c:if test="${not empty errorMessage6}">
											<font color="red"> <c:out value="${errorMessage6}" />
											</font>
										</c:if>
									</div>

									<div class="form-group">
										<input id="answer" name="answer" class="form-control"
											placeholder="Enter Your Answer *" type="text">
										<c:if test="${not empty errorMessage5}">
											<font color="red"> <c:out value="${errorMessage5}" />
											</font>
										</c:if>
									</div>

									<input id="submit" type="submit" class="btnRegister"
										value="Register" />
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.hanu.social_media_platform_client.model.Status"%>
<%@ page import="edu.hanu.social_media_platform_client.model.Comment"%>
<%@ page import="edu.hanu.social_media_platform_client.model.Profile"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Social Media</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/profile.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<%
		Profile profile = (Profile) request.getAttribute("profile");
	%>
	<%
		List<Profile> friends = (List<Profile>) request.getAttribute("friends");
	%>
	<%
		List<Status> statuses = (List<Status>) request.getAttribute("statuses");
	%>
	<%
		List<Comment> comments = (List<Comment>) request.getAttribute("comments");
	%>
	<jsp:include page="nav-bar.jsp"></jsp:include>
	<hr>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-10">
				<h1>
					<c:out value="${profile.getFirstName()} ${profile.getLastName()}" />
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->
				<div class="text-center">
					<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
						class="avatar img-circle img-thumbnail" alt="avatar">
				</div>
				</hr>
				<br>
				<div class="card">
					<div class="card-body">
						<div class="h4">
							<strong>Information</strong>
						</div>

						<div class="h5 text-muted">
							<c:out value="${profile.getFirstName()} ${profile.getLastName()}" />
						</div>
						<div class="h5 text-muted">
							<c:out value="${profile.getPhoneNumber()}" />
						</div>
						<div class="h5 text-muted">
							<c:out value="${profile.getEmail()}" />
						</div>

					</div>
				</div>

				<fieldset class="form-group">
					<div class="form-inline h5 text-muted">
						Following  &nbsp;&nbsp; <i class="fa fa-users"></i>
						&nbsp;&nbsp;&nbsp;&nbsp;

						<div class="form-inline h5"><c:out value="${friends.size()}" /></div>

					</div>
				</fieldset>

				<div class="panel panel-default">
					<div class="h5 panel-heading">Copy Right</div>
					<div class="panel-body">
						<form class="h6 form-inline my-2 my-lg-0">@ 2020 Faculty of
							Information Technology - Hanoi University. All Right Reversed.</form>
					</div>
				</div>

			</div>
			<!--/col-3-->
			<div class="col-sm-9">
				<ul class="nav nav-tabs">
					<li class="active h4"><a data-toggle="tab" href="#home">Status</a></li>
					<li class="h4"><a data-toggle="tab" href="#friends">Following</a></li>
					<li class="h4"><a data-toggle="tab" href="#settings">Edit
							Profile</a></li>
				</ul>


				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>


						<form
							action="${pageContext.request.contextPath}/postStatusProfile"
							method="post">
							<div class="card gedf-card">
								<div class="card-header">
									<ul class="nav nav-tabs card-header-tabs" id="myTab"
										role="tablist">
										<li class="nav-item"><a class="nav-link active h4"
											id="posts-tab" data-toggle="tab" href="#posts" role="tab"
											aria-controls="posts" aria-selected="true"> Create a post</a>
										</li>
									</ul>
								</div>
								<div class="card-body">
									<div class="h5 tab-content" id="myTabContent">
										<div class="form-group">
											<label class="sr-only" for="message">post</label>
											<textarea class="form-control form-control-lg" id="message"
												rows="3" name="status" placeholder="What are you thinking?"></textarea>
										</div>
									</div>
									<c:if test="${not empty errorMessage}">
											<script>alert("INVALID User")</script>	
									</c:if>
									<c:if test="${not empty errorMessage1}">
											<script>alert("Invalid email !")</script>	
									</c:if>
									<c:if test="${not empty errorMessage2}">
											<script>alert("Invalid Phone Number")</script>	
									</c:if>
									<c:if test="${not empty errorMessage3}">
											<script>alert("Password must be above 8 characters, contain at least one uppercase, one number, and one special character !")</script>	
									</c:if>
									<c:if test="${not empty errorMessage4}">
											<script>alert("Passwords do not match !"")</script>	
									</c:if>
									<div class="h5 btn-toolbar justify-content-left">
										<div class="btn-group">
											<button type="submit" class=" btn btn-outline-primary btn-lg">Share</button>
										</div>
									</div>
								</div>
							</div>
						</form>



						<div class="card gedf-card">
							<c:forEach items="${statuses}" var="statuses" varStatus="i"
								begin="0">
								<div class="card-header">
									<div class="d-flex justify-content-between align-items-center">
										<div class="d-flex justify-content-between align-items-center">
											<div class="mr-2">
												<img class="rounded-circle" width="45"
													src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
													alt="">
											</div>
											<div class="ml-2">

												<div class="h4 m-0">
													<c:out
														value="${statuses.getProfile().getFirstName()} ${statuses.getProfile().getLastName()}" />
												</div>
											</div>
										</div>
										<br> <br>
										<div>
											<div class="dropdown">
												<button class="btn btn-link dropdown-toggle" type="button"
													id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="fa fa-ellipsis-h"></i>
												</button>
												<div class="dropdown-menu dropdown-menu-right"
													aria-labelledby="gedf-drop1">
													<a class="h5 dropdown-item"
														href="deleteStatus?id=${statuses.getId()}" onclick="bcd()"><strong>Delete</strong>
														<script>
															function bcd() {
																confirm("Are you sure you want to delete this status?");
															}
														</script></a>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="card-body">

									<div class="text-muted h6 mb-2">
										<i class="fa fa-clock-o"></i>
										<c:out value="${statuses.getProfile().getCreated()}" />
									</div>


									<h5 class="card-text">
										<c:out value="${statuses.getStatus()}" />
									</h5>

								</div>

								<div class="card-footer">

									<button type="submit" class="h5 btn btn-outline-danger btn-lg">
										<i class="fa fa-gittip"></i> Like
									</button>

									<br> <br>
									<c:forEach items="${comments}" var="comments" varStatus="i"
										begin="0">
										<div class="comment-box">
											<c:if
												test="${statuses.getId() == comments.getStatus().getId()}">
												<span class="commenter-pic"> <img
													src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
													class="img-fluid"> <a href="profile.jsp" class="h4">

														<c:out
															value="${comments.getProfile().getFirstName()} ${comments.getProfile().getLastName()} " />
												</a> <span class="comment-time h6"> <c:out
															value="${comments.getCreated()}" />
												</span> <span class="dropdown">
														<h5 class="comment-txt more">
															<c:out value="${comments.getComment()}" />
														</h5>
												</span>
												</span>
											</c:if>
										</div>
									</c:forEach>
									<br>
									<div class="comment-box add-comment">
										<div class="form-inline">
											<span class="commenter-pic"> <img
												src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
												class="img-fluid">
											</span>&nbsp;&nbsp;&nbsp;&nbsp;
											<div class="commenter-name h5">
												<form class="form"
													action="${pageContext.request.contextPath}/commentStatusProfile"
													method="post" id="comment">
													<label class="sr-only" for="comment">post</label>
													<textarea class="form-control form-control-lg" id="comment"
														name="comment" rows="3" placeholder="Add a public comment"></textarea>

													<button type="submit" class="btn btn-outline-info btn-sm">
														<i class="fa fa-comment"></i>Comment

													</button>

													<input type="hidden" id="statusId" name="statusId"
														value="<c:out value="${statuses.getId()}" />"> <input
														type="hidden" id="statusProfileName"
														name="statusProfileName"
														value="<c:out value="${statuses.getProfile().getProfileName()}" />">
													<c:if test="${not empty errorMessage1}">
														<font color="red"> <c:out value="${errorMessage1}" />
														</font>
													</c:if>
												</form>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<br>
						<hr>
					</div>
					
					
					<!--/tab-pane-->
					<div class="tab-pane" id="friends">
						<div class="col-12">
							<div class="container ">
								<br> <br>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="h4">Followers name</th>
											<th class="h4">Options</th>
										</tr>
									</thead>
									<c:forEach items="${friends}" var="friends" varStatus="i"
								begin="0">
								
									<tbody>

										<tr>
											<td class="h4"><c:out value="${friends.getFirstName()} ${friends.getLastName()}" /></td>
											
											<td class="h4"><a href="unFriend?friendName=${friends.getProfileName()}">
													<button type="submit" onclick="abc()"
														class=" btn btn-outline-info btn-lg">Unfollow</button>
											</a> <script>
												function abc() {
													confirm("Are you sure you want to unfriend this person?");
												}
											</script>
											
											</td>
										</tr>

									</tbody>
									
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					
					<!--/tab-pane-->



					<div class="tab-pane" id="settings">


						<hr>
						<form class="form" action="editProfile" method="post" id="registrationForm">
							<div class="form-group">

								<div class="col-xs-6">
									<label for="firstName"><h4>First name</h4></label> <input
										type="text" class="form-control form-control-lg"
										name="firstName" id="firstName" placeholder="Enter your first name"
										title="Enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="lastName"><h4>Last name</h4></label> <input
										type="text" class="form-control form-control-lg"
										name="lastName" id="lastName" placeholder="Enter your last name"
										title="Enter your last name if any.">
								</div>
							</div>

							<div class="form-group">

								<div class="col-xs-6">
									<label for="phoneNumber"><h4>Phone Nummber</h4></label> <input
										type="text" class="form-control form-control-lg"
										name="phoneNumber" id="phoneNumber" placeholder="Enter phone number"
										title="Enter your phone number if any.">
								</div>
								<c:if test="${not empty errorMessage2}">
										<font color="red"> <c:out value="${errorMessage2}" />
										</font>
									</c:if>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label for="profileName"><h4>User Name</h4></label> <input
										type="text" class="form-control form-control-lg"
										name="profileName" id="profileName"
										placeholder="Enter mobile number"
										title="Enter your mobile number if any.">
								</div>
								<c:if test="${not empty errorMessage}">
										<script>alert("INVALID PROFILE NAME!")</script>	
									</c:if>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Email</h4></label> <input type="email"
										class="form-control form-control-lg" name="email" id="email"
										placeholder="Enter your email." title="Enter your email.">
								</div>
								<c:if test="${not empty errorMessage1}">
											<script>alert("INVALID EMAIL!")</script>	
										</c:if>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="address"><h4>Address</h4></label> <input
										type="text" class="form-control form-control-lg"
										name="address" id="address" placeholder="Enter a location"
										title="Enter a location">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password"><h4>Password</h4></label> <input
										type="password" class="form-control form-control-lg"
										name="password" id="password" placeholder="Enter your password."
										title="Enter your password.">
								</div>
								<c:if test="${not empty errorMessage2}">
											<script>alert("INVALID PHONE NUMBER")</script>	
										</c:if>
										<c:if test="${not empty errorMessage3}">
											<script>alert("Password must be above 8 characters, contain at least one uppercase, one number, and one special character !")</script>	
										</c:if>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Confirm Password</h4></label> <input
										type="password" class="form-control form-control-lg"
										name="password2" id="password2" placeholder="Enter your confirm password"
										title="Enter your password2.">
								</div>
								
										<c:if test="${not empty errorMessage4}">
									<script>alert("PASSWORD NOT MATCH")</script>	
									</c:if>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success pull-right" type="submit">
										<i class="glyphicon glyphicon-ok-sign"></i> Save
									</button>
								</div>
							</div>
						</form>
					</div>

				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->

		</div>
		<!--/col-9-->
	</div>
	<!--/row-->

</body>
</html>
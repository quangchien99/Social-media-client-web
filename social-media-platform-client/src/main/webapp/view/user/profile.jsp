<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<title>Social Media</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<jsp:include page="nav-bar.jsp"></jsp:include>
	<hr>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-sm-10">
				<c:forEach var="profile" items="${listProfile}">
				<h1><c:out value="${profile.profileName}"/>Khanh Linh</h1>
				</c:forEach>
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
						<c:forEach var="profile" items="${listProfile}">
						<div class="h5 text-muted"><c:out value="${profile.firstName}"/>Khanh Linh</div>
						<div class="h5 text-muted"><c:out value="${profile.lastName}"/>Vuong</div>
						<div class="h5 text-muted"><c:out value="${profile.phoneNumber}"/>0123456789</div>
						<div class="h5 text-muted"><c:out value="${profile.email}"/>linh@gmail.com</div>
					    </c:forEach>
					</div>
				</div>

				<fieldset class="form-group">
					<div class="form-inline h5 text-muted">
						Friends List <i class="fa fa-users"></i> &nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="profile" items="${listProfile}">
						<div class="form-inline h5">523</div>
						</c:forEach>
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
					<li class="h4"><a data-toggle="tab" href="#friends">Friends</a></li>
					<li class="h4"><a data-toggle="tab" href="#settings">Edit Profile</a></li>
				</ul>


				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<hr>
						<div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active h4" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">
                                Create a post</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="h5 tab-content" id="myTabContent">   
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control form-control-lg" id="message" rows="3" name="status" placeholder="What are you thinking?"></textarea>
                                </div>                         
                        </div>
                        <div class="h5 btn-toolbar justify-content-left">
                            <div class="btn-group">
                                <button type="submit" class=" btn btn-outline-primary btn-lg">Share</button>
                            </div>
                        </div>
                    </div>
                </div>
						<form class="form" action="##" method="post" id="registrationForm">
							<div class="card gedf-card">
								<div class="card-header">
									<div class="d-flex justify-content-between align-items-center">
										<div class="d-flex justify-content-between align-items-center">
											<div class="mr-2">
												<img class="rounded-circle" width="45"
													src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="">
											</div>
											<div class="ml-2">
											    <c:forEach var="profile" items="${listProfile}">
												<div class="h4 m-0"><c:out value="${profile.profileName}"/>Khanh Linh</div>
												</c:forEach>
											</div>
										</div>
										<div>
											<div class="dropdown">
												<button class="btn btn-link dropdown-toggle" type="button"
													id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="fa fa-ellipsis-h"></i>
												</button>
												<div class="dropdown-menu dropdown-menu-right"
													aria-labelledby="gedf-drop1">
													<a class="h5 dropdown-item" href="delete?id =${status.statusId}" onclick="bcd()"><strong>Delete</strong>
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
									<c:forEach var="profile" items="${listProfile}">
									<div class="text-muted h6 mb-2">
										<i class="fa fa-clock-o"></i>
										<c:out value="${profile.created}"/>10 min ago
									</div>
									</c:forEach>
									<c:forEach var="status" items="${listStatus}">
									<h5 class="card-text"><c:out value="${status.status}"/>Lorem ipsum dolor sit amet
										consectetur adipisicing elit.</h5>
									</c:forEach> 
								</div>

								<div class="card-footer">							
									
									<button type="submit" class="h5 btn btn-outline-danger btn-lg" >
										<i class="fa fa-gittip"></i> Like
									</button>
									
									
									<button type="submit" class="h5 btn btn-outline-info btn-lg" >
										<i class="fa fa-comment"></i> Comment
									</button>
													
									<br>
									<br>
									<div class="comment-box add-comment">
										<span class="commenter-pic form-inline"> <img
											src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
											class="img-fluid">
										</span>&nbsp;&nbsp;&nbsp;&nbsp; <span class="commenter-name h5"> 
									
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control form-control-lg" id="message" name="comment" rows="3" placeholder="Add a public comment"></textarea>
                                 		
											<button type="submit" class="btn btn-outline-info btn-lg">
												<i class="fa fa-comment"></i>Comment
											</button>
										</span>
									</div>
									<br>
									<div class="comment-box">
										<span class="commenter-pic"> <img
											src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
											class="img-fluid">
										</span> <span class="commenter-name">
										<c:forEach var="profile" items="${listProfile}">
										 <a href="profile.jsp" class="h4"><c:out value="${profile.profileName}"/>Happy
												uiuxStream</a> <span class="comment-time h6"><c:out value="${profile.created}"/>2 hours ago</span>
												<span class="dropdown">
												<button class="btn btn-link dropdown-toggle" type="button"
													id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<i class="fa fa-ellipsis-h"></i>
												</button>
												<span class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
													<a class="h6 dropdown-item" href="delete?id =${comment.commentId}" onclick="acd()"><strong>Delete</strong>
													<script>
												function acd() {
													confirm("Are you sure you want to delete this comment?");
												}
											</script></a>
												
										</span>
										<c:forEach var="comment" items="${listComment}">
										<h5 class="comment-txt more"><c:out value="${comment.profile}"/>Suspendisse massa enim,
											condimentum sit amet maximus quis, pulvinar sit amet ante.
											Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</h5>
											</c:forEach>
											</span>
											</c:forEach>
											</span>
									</div>
									<br>
								</div>
							</div>
						</form>
						<br>
						<hr>
					</div>
					<!--/tab-pane-->
					<div class="tab-pane" id="friends">
						<div class="col-12">
							<div class="container ">
								<div class="custom-control-inline h3">
									Friend List<i class="fa fa-users"></i>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<form class="custom-control-inline">
										<input class="form-control form-control-lg" type="text"
											placeholder="Search" aria-label="Search">
											&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-outline-success btn-lg"
											type="submit">Search</button>
									</form>
								</div>
								<br>
								<br>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="h4">Friend name</th>
											<th class="h4">Options</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="profile" items="${listProfile}">
										<tr>
											<td class="h4"><c:out value="${profile.profileName}" />Nguyen The An</td>
											<td class="h4"><a href="delete?id =${profile.profileId}">
													<button type="button" onclick="abc()" class=" btn btn-outline-info btn-lg">Unfriend</button>
											</a> <script>
												function abc() {
													confirm("Are you sure you want to unfriend this person?");
												}
											</script></td>
										</tr>
							           </c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						

					</div>
					<!--/tab-pane-->

					<div class="tab-pane" id="settings">


						<hr>
						<form class="form" action="##" method="post" id="registrationForm">
							<div class="form-group">

								<div class="col-xs-6">
									<label for="firstName"><h4>First name</h4></label> <input
										type="text" class="form-control form-control-lg" name="firstName"
										id="firstName" placeholder="first name"
										title="enter your first name if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="lastName"><h4>Last name</h4></label> <input
										type="text" class="form-control form-control-lg" name="lastName" id="lastName"
										placeholder="last name" title="enter your last name if any.">
								</div>
							</div>

							<div class="form-group">

								<div class="col-xs-6">
									<label for="phoneNumber"><h4>Phone Nummber</h4></label> <input
										type="text" class="form-control form-control-lg" name="phoneNumber"
										id="phoneNumber" placeholder="enter phone"
										title="enter your phone number if any.">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-6">
									<label for="profileName"><h4>User Name</h4></label> <input
										type="text" class="form-control form-control-lg" name="profileName"
										id="profileName" placeholder="enter mobile number"
										title="enter your mobile number if any.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="email"><h4>Email</h4></label> <input type="email"
										class="form-control form-control-lg" name="email" id="email"
										placeholder="you@email.com" title="enter your email.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="address"><h4>Address</h4></label> <input
										type="text" class="form-control form-control-lg" name="address" id="address"
										placeholder="somewhere" title="enter a location">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password"><h4>Password</h4></label> <input
										type="password" class="form-control form-control-lg" name="password"
										id="password" placeholder="password"
										title="enter your password.">
								</div>
							</div>
							<div class="form-group">

								<div class="col-xs-6">
									<label for="password2"><h4>Confirm Password</h4></label> <input
										type="password" class="form-control form-control-lg" name="password2"
										id="password2" placeholder="confirm password"
										title="enter your password2.">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-12">
									<br>
									<button class="btn btn-lg btn-success pull-right" type="submit">
										<i class="glyphicon glyphicon-ok-sign"></i> Save
									</button>
									<button class="btn btn-lg" type="reset">
										<i class="glyphicon glyphicon-repeat"></i> Reset
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
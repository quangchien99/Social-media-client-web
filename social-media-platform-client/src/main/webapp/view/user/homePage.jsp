<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="edu.hanu.social_media_platform_client.model.Status"%>
<%@ page import="edu.hanu.social_media_platform_client.model.Comment"%>
<%@ page import="java.util.List"%>
<html>
<head>
<title>Social Media</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/homepage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
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
			<div class="col-3">
				<div class="panel panel-default">
					<div class="h5 panel-heading">Copy Right</div>
					<div class="panel-body">
						<form class="h6 form-inline my-2 my-lg-0">@ 2020 Faculty of
							Information Technology - Hanoi University. All Right Reversed.</form>
					</div>
				</div>
			</div>
			<!--/col-3-->
			<div class="col-6">
				<!-- 				<ul class="nav nav-tabs"> -->
				<!-- 					<li class="active h4"><a data-toggle="tab" href="#home">Status</a></li> -->
				<!-- 				</ul> -->
				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<form action="${pageContext.request.contextPath}/postStatus"
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
										<font color="red"> <c:out value="${errorMessage}" />
										</font>
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
														href="delete?id =${status.statusId}" onclick="bcd()"><strong>Delete</strong>
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
									<form class="form"
										action="${pageContext.request.contextPath}/like" method="post"
										id="like">
										<label class="sr-only" for="like">post</label>
										<button type="submit" class="h5 btn btn-outline-danger btn-sm">
											<i class="fa fa-gittip"></i> Like
										</button>
									</form>
																	<c:forEach items="${comments}" var="comments" varStatus="i"
									begin="0">
									<div class="comment-box">
										<c:if
											test="${statuses.getId() == comments.getStatus().getId()}">
											<span class="commenter-pic"> <img
												src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
												class="img-fluid"> <a href="profile.jsp" class="h4">
												
													<c:out value="${comments.getProfile().getFirstName()} ${comments.getProfile().getLastName()} " /> 
													</a> <span class="comment-time h6">
													<c:out value="${comments.getCreated()}" /> 
													 </span> <span class="dropdown">
													
													<h5 class="comment-txt more">
														<c:out value="${comments.getComment()}" />

													</h5>

											</span>
											</span>
										</c:if>
									</div>
								</c:forEach>
									<br> <br>
									<div class="comment-box add-comment">
										<div class="form-inline">
											<span class="commenter-pic"> <img
												src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
												class="img-fluid">
											</span>&nbsp;&nbsp;&nbsp;&nbsp;
											<div class="commenter-name h5">
												<form class="form"
													action="${pageContext.request.contextPath}/comment"
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
									<hr>
									<br>
								</div>
							</c:forEach>
						</div>

					</div>
					<div id="imgGallary" class="col-3 slider position-fixed">
						<img
							src="${pageContext.request.contextPath}/image/social-media.jpg"
							alt="" width="80%" height="150" /> <img
							src="${pageContext.request.contextPath}/image/slider2.jpg" alt=""
							width="80%" height="150" /> <img
							src="${pageContext.request.contextPath}/image/slider3.jpg" alt=""
							width="80%" height="150" /> <img
							src="${pageContext.request.contextPath}/image/slider.jpg" alt=""
							width="80%" height="150" /> <img
							src="${pageContext.request.contextPath}/image/slider6.jpg" alt=""
							width="80%" height="150" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/homepage.js"></script>
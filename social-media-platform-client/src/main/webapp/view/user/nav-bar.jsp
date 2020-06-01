<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Social Media</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nav-bar.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-icon-top sticky-top navbar-expand-lg navbar-light" style="background-color: #AACFCF">
  <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/image/icon.png" width="50" height="50" alt="Home Page"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="homepage.jsp">
          <i class="fa fa-home"></i>
          Home
          <span class="sr-only">(current)</span>
          </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="profile.jsp">
          <i class="fa fa-user">
          </i>
          Profile
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="notification.jsp">
          <i class="fa fa-globe">
            <span class="badge badge-success">11</span>
          </i>
          Notification
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="messages.jsp">
          <i class="fa fa-envelope-o">
            <span class="badge badge-danger">11</span>
          </i>
          Messages
        </a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control form-control-lg" width="200" type="text" placeholder="Search" aria-label="Search">
      &nbsp;&nbsp;&nbsp;&nbsp;
      <button class="btn btn-outline-success btn-lg" type="submit" >Search</button>
    </form>
    <ul class="navbar-nav ">
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-users">
            <span class="badge badge-info">11</span>
          </i>
          Friend Request
        </a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="#"> 
          <i class="fa fa-power-off">
          </i>
          Log out
        </a>
      </li>
    </ul>   
  </div>
</nav>
</body>
</html>
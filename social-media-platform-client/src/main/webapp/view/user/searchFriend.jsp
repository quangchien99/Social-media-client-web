<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="edu.hanu.social_media_platform_client.model.Profile"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/followRequest.css">
<link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Search Friend</title>
</head>
<body>
<%
		List<Profile> profiles = (List<Profile>) request.getAttribute("profiles");
	%>
	<%
		List<Profile> friends = (List<Profile>) request.getAttribute("friends");
	%>
<jsp:include page="nav-bar.jsp"></jsp:include>
<br>
<div class="container bootstrap snippet">
 <div class="jumbotron list-content">
    <ul class="list-group">
      <li href="#" class="list-group-item title">
       People
      </li>
      
      
      
      
            <c:forEach items="${friends}" var="friends" varStatus="i"	begin="0">
      <li href="#" class="list-group-item text-left">
        <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/avatar.jpg">
        <label class="name">
            <c:out	value="${friends.getFirstName()} ${friends.getLastName()}" /><br>
        </label>
        
        <label class="pull-right">
             <a  class="btn btn-success btn-xs glyphicon glyphicon-ok" href="unFriend?friendName=${friends.getProfileName()}" title="Following">
          <i class="fa fa-check" aria-hidden="true"></i>
            </a>
        
        </label>
        
        
        
        <div class="break"></div>
      </li>
      </c:forEach>
      
      
      
      
      <c:forEach items="${profiles}" var="profiles" varStatus="i"
								begin="0">
      <li href="#" class="list-group-item text-left">
        <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/avatar.jpg">
        <label class="name">
            <c:out	value="${profiles.getFirstName()} ${profiles.getLastName()}" /><br>
        </label>
        
        <label class="pull-right">
             <a  class="btn btn-success btn-xs glyphicon glyphicon-ok" href="addFriend?friendName=${profiles.getProfileName()}" title="Follow">
          <i class="fa fa-check" aria-hidden="true"></i>
            </a>
        
        </label>
        
        
        
        <div class="break"></div>
      </li>
      </c:forEach>
    </ul>
  </div>
  
   <p class="text-center top_spac">© 2020 Faculty of Information Technology - Hanoi University. All Rights Reserved. </p>
  </div>

</body>
</html>
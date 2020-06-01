<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Comment</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/comment.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src = "${pageContext.request.contextPath}/js/comment.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-12">
      <div class="comments">
        <div class="comments-details">
          <span class="total-comments comments-sort">117 Comments</span>
          <span class="dropdown">
              <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">Sort By <span class="caret"></span></button>
              <div class="dropdown-menu">
                <a href="#" class="dropdown-item">Top Comments</a>
              <a href="#" class="dropdown-item">Newest First</a>
              </div>
          </span>     
        </div>
        <div class="comment-box add-comment">
          <span class="commenter-pic">
            <img src="${pageContext.request.contextPath}//images/user-icon.jpg" class="img-fluid">
          </span>
          <span class="commenter-name">
            <input type="text" placeholder="Add a public comment" name="Add Comment">
            <button type="submit" class="btn btn-default">Comment</button>
            <button type="cancel" class="btn btn-default">Cancel</button>
          </span>
        </div>
        <div class="comment-box">
          <span class="commenter-pic">
            <img src="/images/user-icon.jpg" class="img-fluid">
          </span>
          <span class="commenter-name">
            <a href="#">Happy uiuxStream</a> <span class="comment-time">2 hours ago</span>
          </span>       
          <p class="comment-txt more">Suspendisse massa enim, condimentum sit amet maximus quis, pulvinar sit amet ante. Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</p>
          <div class="comment-meta">
            <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
            <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
            <button class="comment-reply reply-popup"><i class="fa fa-reply-all" aria-hidden="true"></i> Reply</button>         
          </div>
          <div class="comment-box add-comment reply-box">
            <span class="commenter-pic">
              <img src="/images/user-icon.jpg" class="img-fluid">
            </span>
            <span class="commenter-name">
              <input type="text" placeholder="Add a public reply" name="Add Comment">
              <button type="submit" class="btn btn-default">Reply</button>
              <button type="cancel" class="btn btn-default reply-popup">Cancel</button>
            </span>
          </div>
        </div>
        <div class="comment-box">
          <span class="commenter-pic">
            <img src="/images/user-icon.jpg" class="img-fluid">
          </span>
          <span class="commenter-name">
            <a href="#">Happy uiuxStream</a> <span class="comment-time">2 hours ago</span>
          </span>       
          <p class="comment-txt more">Suspendisse massa enim, condimentum sit amet maximus quis, pulvinar sit amet ante. Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</p>
          <div class="comment-meta">
            <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
            <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
            <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> Reply</button>         
          </div>
          <div class="comment-box replied">
            <span class="commenter-pic">
              <img src="/images/user-icon.jpg" class="img-fluid">
            </span>
            <span class="commenter-name">
              <a href="#">Happy uiuxStream</a> <span class="comment-time">2 hours ago</span>
            </span>       
            <p class="comment-txt more">Suspendisse massa enim, condimentum sit amet maximus quis, pulvinar sit amet ante. Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</p>
            <div class="comment-meta">
              <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
              <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
              <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> Reply</button>         
            </div>
            <div class="comment-box replied">
              <span class="commenter-pic">
                <img src="/images/user-icon.jpg" class="img-fluid">
              </span>
              <span class="commenter-name">
                <a href="#">Happy uiuxStream</a> <span class="comment-time">2 hours ago</span>
              </span>       
              <p class="comment-txt more">Suspendisse massa enim, condimentum sit amet maximus quis, pulvinar sit amet ante. Fusce eleifend dui mi, blandit vehicula orci iaculis ac.</p>
              <div class="comment-meta">
                <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
                <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
                <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> Reply</button>         
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
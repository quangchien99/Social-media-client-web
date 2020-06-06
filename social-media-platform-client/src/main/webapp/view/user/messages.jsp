<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messages.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Messages</title>
</head>
<body>
<jsp:include page="nav-bar.jsp"></jsp:include>
<br>
<br>
<div class="headind_srch">
            

                 <form class="form-inline my-2 my-lg-0">
      <input name="userName" class="form-control form-control-lg" type="text" placeholder="User Name" aria-label="Search">
      &nbsp;&nbsp;&nbsp;&nbsp;
      <button name=" submit" class="btn btn-outline-success my-2 btn-lg" type="submit">Connect</button>
    </form>
                 
            
          </div>
          <br>
<div class="container">

      <div class="inbox_msg">
        
        
       
          <div class="msg_history">
          <br>
            <div class="incoming_msg">
            
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test which is a new approach to have all
                    solutions</p>
                  <span class="time_date">Ha Nguyen</span>
                  </div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all
                  solutions</p>
                <span class="time_date">Linh Vuong</span> </div>
            </div>
            <div class="incoming_msg">
             
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test, which is a new approach to have</p>
                  <span class="time_date"> Hien Tran</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
         
              <div class="sent_msg">
                <p>Apollo University, Delhi, India Test</p>
                <span class="time_date"> Chien Pham</span> </div>
            </div>
            <div class="incoming_msg">
              
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>We work directly with our designers and suppliers,
                    and sell direct to you, which means quality, exclusive
                    products, at a price anyone can afford.</p>
                  <span class="time_date">Linda</span></div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button name="send" class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        
      </div>
      
      <p class="text-center top_spac">© 2020 Faculty of Information Technology - Hanoi University. All Rights Reserved. </p>
      <br>
    </div>
    
</body>
</html>
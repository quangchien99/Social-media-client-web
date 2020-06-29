<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/messages.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	type="text/css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var websocket = new WebSocket(
			"ws://localhost:8080/social-media-platform/chatRoomServer");
	websocket.onopen = function(message) {
		processOpen(message);
	};
	websocket.onmessage = function(message) {
		processMessage(message);
	};
	websocket.onclose = function(message) {
		processClose(message);
	};
	websocket.onerror = function(message) {
		processError(message);
	};

	function processOpen(message) {
		textAreaMessage.value += "Server connect... \n";
	}
	function processMessage(message) {
		console.log(message);
		textAreaMessage.value += message.data + " \n";
	}
	function processClose(message) {
		textAreaMessage.value += "Server Disconnect... \n";
	}
	function processError(message) {
		textAreaMessage.value += "Error... " + message + " \n";
	}

	function sendMessage() {
		if (typeof websocket != 'undefined'
				&& websocket.readyState == WebSocket.OPEN) {
			websocket.send(textMessage.value);
			textMessage.value = "";
		}
	}
</script>
<meta charset="ISO-8859-1">
<title>Messages</title>
</head>
<body>
	<jsp:include page="nav-bar.jsp"></jsp:include>
	<br>
	<br>
	<div class="headind_srch">
	</div>
	<br>
	<div class="container">

		<div class="inbox_msg">
		
			<textarea readonly="true" rows="20" cols="150" id="textAreaMessage"></textarea>
			
			<div class="type_msg">
				<div class="input_msg_write">
					<input id="textMessage" type="text" class="write_msg"
						placeholder="Type a message" />
					<button class="msg_send_btn" type="button"
						value="Send Message" onclick="sendMessage()">
						<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
					</button>
				</div>
			</div>

		</div>

		<p class="text-center top_spac">© 2020 Faculty of Information
			Technology - Hanoi University. All Rights Reserved.</p>
		<br>
	</div>

</body>
</html>
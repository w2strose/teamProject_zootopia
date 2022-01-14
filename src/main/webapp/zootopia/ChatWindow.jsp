<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String loginID = (String)session.getAttribute("loginID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<style type="text/css">

#myid{
font-family :sans-serif; font-size: 20px;
}
#mymsg{
padding: 5px; display: flex;
    align-items: center;
    justify-content: flex-end;
font-family :sans-serif; font-size: 14px;
width: 70%; background-color: yellow;
border-radius: 20px;
margin-bottom: 5px;
margin-right: 2px;
}
#sdrmsg2{
	padding: 5px; display: flex;
    align-items: center;
    justify-content: flex-start;
font-family :sans-serif; font-size: 14px;
width: 70%; background-color: white;
border-radius: 20px;
margin-bottom: 5px;
margin-right: 2px;
}
</style>

<script>
var webSocket = new WebSocket(
		"<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
var chatWindow, chatMessage, chatId;

window.onload = function() {
	chatWindow = document.getElementById("chatWindow");
	chatMessage = document.getElementById("chatMessage");
	chatId = document.getElementById('chatId').value;
}

function sendMessage() {
	chatWindow.innerHTML +=  "<div id='mymsg2'><div id='mymsg' class='myMsg'>" + chatMessage.value + "</div></div>"
	webSocket.send(chatId + ':' + chatMessage.value);
	chatMessage.value="";
	chatWindow.scrollTop = chatWindow.scrollHeight;
}

function disconnect() {
	webSocket.close();
	window.close();
}
function enterKey() {
	if(window.event.keyCode == 13){
		sendMessage();
	}
}

webSocket.onopen = function(event){
	chatWindow.innerHTML +=  "[<%=loginID%>]님이 서버에 연결되셨습니다.<br/><br/>";
};

webSocket.onclose = function(event) {
	chatWindow.innerHTML += "[<%=loginID%>]님이 서버를 종료하셨습니다.<br/>";
};
webSocket.onerror = function(event) {
	alert(event.data);
	chatWindow.innerHTML += "채팅중 에러가 발생했습니다.<br/>";
};

webSocket.onmessage = function(event) {
	var message = event.data.split(":"); // 대화명과 메세지 분리
	var sender = message[0];
	var content = message[1];
	if(content != ""){
		if(content.match("/")){ // 귓속말
			if(content.match(("/" + chatId))){
				var temp = content.replace(("/" + chatId), "[귓속말] ");
				chatWindow.innerHTML += "<div id='sdrmsg'>" + sender + " </div> <div id='sdrmsg2' class='myMsg'> " + temp + "</div>";
			}
		}else{
			chatWindow.innerHTML += "<div id='sdrmsg'>" + sender + " </div> <div id='sdrmsg2' class='myMsg'> " + content + "</div>";
		}
	}
	chatWindow.scrollTop = chatWindow.scrollHeight;
};
</script>
<style type="text/css">
	#chatWindow{
		border:1px solid black; width:280px; height: 310px; overflow:scroll; padding:5px; 
	}
	#chatMessage{width: 236px; height: 24px;}
#sendBtn{height: 30px; position: relative; top: 2px; left: -2px;}
#closeBtn{margin-bottom: 3px; position: relative; top: 2px; left: 2px;}
#chatId{width: 158px; height: 24px; border: 1px solid #AAAAAA; background-color: #EEEEEE;}
.myMsg{text-align: right;}
#mymsg2{
display: flex;
	justify-content: flex-end;
}
#sdrmsg{
	display: flex;
	font-family :'Hahmlet', serif;
	font-size: 12px;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
</head>
<body style="overflow-x: hidden; overflow-y: hidden;" bgcolor="orange">
	<div style=" display: flex; flex-direction: column; align-items: center;">
	<div style="display: flex; justify-content: space-between; align-items: center;">
	<div style="font-family: font-family:'Hahmlet';font-size: 20px; font-size: 20px; margin-right: 120px;">대화명 : <%=loginID %></div>
	<input type="hidden" id="chatId" value="${param.chatId }" readonly="readonly"> 
	<button id="closeBtn" onclick="disconnect();" style="font-family:'Hahmlet';font-size: 13px;">채팅종료</button>
	</div>
	<div id="chatWindow" style="overflow-x: hidden; background-color: rgb(246, 246, 246);"></div>
	<div style="margin-top: 2px;">
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();" style="font-family:'Hahmlet';font-size: 13px;">전송</button>
	</div>
	</div>

</body>
</html>
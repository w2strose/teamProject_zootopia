<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="zootopia.zoomemberDAO"></jsp:useBean>
<%
String id = request.getParameter("id");
boolean check = dao.idCheck(id); // true면 중복 false면 사용가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>
</head>
<body bgcolor="#ffffcc" style="position: relative; height: 50%;">
<br>

<div align="center" >
	<b>
	<%= id %>
	</b>
	<%
	if(check){ // true
	out.println("는 이미 존재하는 아이디입니다. <br><br>");	
	}else{// false
		out.println("는 사용가능한 아이디입니다. <br><br>");
	}
	%>
	<a href="#" onClick="javascript:self.close()">닫기</a>
</div>

</body>
</html>
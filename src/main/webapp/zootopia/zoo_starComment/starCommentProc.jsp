<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Star.StarDAO" %>


<%
String loginID = (String)session.getAttribute("loginID");

request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
Double star = Double.parseDouble(request.getParameter("star"));
int r_number = Integer.parseInt(request.getParameter("r_number"));
String coment = request.getParameter("coment");

StarDAO dao = new StarDAO();
dao.insertStar(loginID, r_number, title, star, coment);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	alert("등록 완료");
	window.location = '../comment.jsp';
</script>
</head>

<body>

</body>
</html>
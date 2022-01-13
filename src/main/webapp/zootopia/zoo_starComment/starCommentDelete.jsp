<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Star.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

request.setCharacterEncoding("UTF-8");
String r_number = request.getParameter("r_number");

StarDAO dpPro = new StarDAO();
int result = dpPro.deleteStar(r_number);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%if(result == 1){%>

<script type="text/javascript">
	alert("삭제 완료");
	window.location = '../comment.jsp';
</script>


<%}else{ %>
<script type="text/javascript">
	alert("삭제 실패");
	window.location = 'starCommentUpdate.jsp?r_number=<%=r_number%>';
</script>

<%} %>
</head>

<body>

</body>
</html>

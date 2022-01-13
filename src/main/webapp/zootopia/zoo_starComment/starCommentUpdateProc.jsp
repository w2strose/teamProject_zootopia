<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Star.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

request.setCharacterEncoding("UTF-8");
String r_number = request.getParameter("r_number");
String s_title = request.getParameter("title");
String s_star = request.getParameter("star");
String s_coment = request.getParameter("coment");
    
StarDAO dpPro = new StarDAO();
int result = dpPro.updateStar(r_number, s_title, s_star, s_coment);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%if(result == 1){%>

<script type="text/javascript">
	alert("등록 완료");
	window.location = 'starCommentBoard.jsp?r_number=<%=r_number%>';
</script>


<%}else{ %>
<script type="text/javascript">
	alert("수정 실패");
	window.location = 'starCommentUpdate.jsp?r_number=<%=r_number%>';
</script>

<%} %>
</head>

<body>

</body>
</html>

<%@page import="zoo_qna.Zoo_qnaVO"%>
<%@page import="zoo_qna.Zoo_qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginID = (String)session.getAttribute("loginID");

	int num = Integer.parseInt(request.getParameter("num")); 

	Zoo_qnaDAO dao = new Zoo_qnaDAO();
	Zoo_qnaVO vo = new Zoo_qnaVO();
	vo.setB_number(num);
	dao.deleteQna(vo);
	
	out.println("<script>alert('삭제 완료.'); location.href='qnaList.jsp';</script>");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
</script>
</head>
<body>

</body>
</html>
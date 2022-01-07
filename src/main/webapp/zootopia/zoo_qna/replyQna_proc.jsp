<%@page import="zoo_qna.Zoo_qnaDAO"%>
<%@page import="zoo_qna.Zoo_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginID = (String)session.getAttribute("loginID");

	int num = Integer.parseInt(request.getParameter("num")); 
	
	Zoo_qnaVO vo = new Zoo_qnaVO();
	Zoo_qnaDAO dao = new Zoo_qnaDAO();
	
	vo.setB_number(num);
	vo.setB_answer(request.getParameter("B_answer"));
	dao.replyQna(vo);
	
	out.println("<script>alert('등록 완료.'); location.href='qnaList.jsp';</script>");

%>

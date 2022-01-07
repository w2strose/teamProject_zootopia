<%@page import="zoo_qna.Zoo_qnaDAO"%>
<%@page import="zoo_qna.Zoo_qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String loginID = (String)session.getAttribute("loginID");
	request.setCharacterEncoding("utf-8");
	Zoo_qnaVO vo = new Zoo_qnaVO();
	Zoo_qnaDAO dao = new Zoo_qnaDAO();

	vo.setId(loginID);
	vo.setB_subject(request.getParameter("B_subject"));
	vo.setB_content(request.getParameter("B_content"));
	
	dao.insertQna(vo);
	out.println("<script>alert('등록 완료.'); location.href='qnaList.jsp';</script>");
	
%>    
    
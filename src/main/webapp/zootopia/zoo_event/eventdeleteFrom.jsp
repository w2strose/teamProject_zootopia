<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    
<% 
	request.setCharacterEncoding("utf-8");
	int E_number = Integer.parseInt(request.getParameter("E_number"));
	String pageNum = request.getParameter("pageNum");
	
	Zoo_EventVO event = new Zoo_EventVO();
	
	event.setE_number(E_number);
	
	Zoo_EventDAO zoo_dao = new Zoo_EventDAO();
	zoo_dao.deleteEvent(event);
	
	response.sendRedirect("event.jsp");
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>
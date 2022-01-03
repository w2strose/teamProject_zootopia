<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="dao" class="zoo_Event.Zoo_EventDAO" />
<jsp:useBean id="event" class="zoo_Event.Zoo_EventVO">
	<jsp:setProperty property="*" name="event"/>
</jsp:useBean>

<%
 	String name = request.getParameter("E_name");
	out.println(name);
	
	event.setE_name(request.getParameter("E_name"));
	event.setE_content(request.getParameter("E_content"));
	event.setE_image(request.getParameter("E_image"));
	event.setE_startDate(request.getParameter("E_startDate"));
	event.setE_endDate(request.getParameter("E_endDate"));
	
	//, E_name, E_content, E_image, E_startDate, E_endDate
	dao.insertEvent(event);
 	response.sendRedirect("event.jsp");
	
%>

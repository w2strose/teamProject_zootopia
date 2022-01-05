<%@page import="zoo_Reservation.Zoo_ReservationVO"%>
<%@page import="zoo_Reservation.Zoo_ReservationDAO"%>
<%@page import="zoo_Reservation.Zoo_OperationVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String loginID = (String)session.getAttribute("loginID"); 
	
	Zoo_ReservationVO vo = new Zoo_ReservationVO();
	Zoo_OperationVO ovo = new Zoo_OperationVO();
	vo.setId((String)session.getAttribute("loginID"));
	vo.setR_date(request.getParameter("R_date"));
	vo.setO_number(Integer.parseInt(request.getParameter("O_number")));
	vo.setR_member(Integer.parseInt(request.getParameter("R_member")));
	out.println(loginID);
	ovo.setO_number(Integer.parseInt(request.getParameter("O_number")));
	Zoo_ReservationDAO dao = new Zoo_ReservationDAO();
	if(loginID!=null){
	
	dao.insertResrvation(vo);
	
	dao.updateOK(ovo);
	
	}else{
		
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
alert("로그인 먼저 부탁드립니다.");
history.go(-1);
</script>
<%} %>
</head>
<body>
예약 완료되었습니다.
<a href="../index.jsp"> 돌아가기</a>
</body>
</html>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="zoo_Reservation.Zoo_ReservationDAO"%>
<%@page import="zoo_Reservation.Zoo_OperationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Zoo_OperationVO vo = new Zoo_OperationVO();
	Zoo_ReservationDAO dao = new Zoo_ReservationDAO();
	
	vo.setH_number(Integer.parseInt(request.getParameter("H_number")));
	vo.setO_type(request.getParameter("O_type"));
	vo.setO_date(request.getParameter("O_date"));
	vo.setO_charge(request.getParameter("O_charge"));
	dao.insertOperation(vo);

%>





<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
alert("등록 완료.");
history.go(-2); 
</script>
</head>
<body>

</body>
</html>
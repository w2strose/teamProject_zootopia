<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="zoo_Reservation.Zoo_OperationVO,zoo_Reservation.Zoo_ReservationDAO,java.util.List" %>

<%
	request.setCharacterEncoding("utf-8");
	String loginID = (String)session.getAttribute("loginID");
	String O_number = request.getParameter("O_number");
	out.println(O_number);
	String date = request.getParameter("O_date");
	out.println(date);
	String type = request.getParameter("O_type");
	out.println(type);
	String charge = request.getParameter("O_charge");
	out.println(charge);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html;">
<title>ZootopiaMain</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 호텔, 이벤트, 이용후기, 예약 -->
  <header id="header" class="full-header">
        <div id="header-wrap">
          <div class="container_header">
            <!-- Logo -->
            <div id="logo"> 
              <a href="../index.jsp"><img id="main__logo" src="../img/pomelogo.png" width="70px" height="70px"/></a>
              <div align="center">ZOOTOPIA</div>            
  
            </div>
            <!-- #logo end -->

            <!-- Primary Navigation
					============================================= -->
            <nav id="primary-menu">
              <ul class="nav_ul">
                  <li class="nav_li"><a href="reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="../hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="../zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../Q&A.jsp">Q&A</a></li>   
                
              </ul>
            </nav>
            <!-- #primary-menu end -->
            <a href="../login.jsp"><img id="login__logo" src="../img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>

<section>
	<div class="section_bar">
		Reservation Section
	
	</div>
	<form action="reservation_proc.jsp" method="post" >
	<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" >
 		
 		<tr>
 			<td width="200"  align="center">예약날짜</td>
 			<td width="200" align="left"><%=date %>
 			</td>
 		</tr>
 		<tr>
 			<td width="200"  align="center">방 종류</td>
 			<td width="200" align="left"><%=type %>
 			</td>
 		</tr>
 		<tr>
 			<td width="200"  align="center">방 가격</td>
 			<td width="200" align="left"><%=charge %>
 			</td>
 		</tr>
 		<tr>
 			<td width="200"  align="center">맡기실 마리 수</td>
 			<td width="200" align="left">
				<input type="text" name="R_member">
 			</td>
 		<tr>
 			<td colspan="2"  align="center"> 
 				<input type="hidden" name="R_date" value="<%=date%>">
				<input type="hidden" name="O_number" value="<%=O_number%>">
 				<input type="submit" value="예약하기">
 				<input type="reset" value="다시작성">
  			</td>
 		
 		</tr>
	</table>
</form>

</section>

<footer>
	<div class="container_footer">
		<ul style="padding-left: 20px;">
			<li></li>
			<li>copyright ⓣunderDog</li>
		</ul>
		</div>
		<ul class="footer_ul" style="padding-left: 20px; padding-right: 20px;">
			<li class="footer_li">Terms</li>
			<li class="footer_li">Privacy</li>
			<li class="footer_li">Security</li>
			<li class="footer_li">Status</li>
			<li class="footer_li">API</li>
			<li class="footer_li">About</li>
		</ul>
</footer>

</body>
</html>
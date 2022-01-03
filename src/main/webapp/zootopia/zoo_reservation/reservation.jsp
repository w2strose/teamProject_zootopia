<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="zoo_Reservation.Zoo_OperationVO,zoo_Reservation.Zoo_ReservationDAO" %>

<%
	request.setCharacterEncoding("utf-8");
	Calendar cal = Calendar.getInstance();

	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	String fyear = request.getParameter("year");
	String fmonth = request.getParameter("month");
	
	
	int year = nowYear;
	int month = nowMonth;
	
	if(fyear != null){
		year = Integer.parseInt(fyear);
	}
	if(fmonth != null){
		month = Integer.parseInt(fmonth);
	}
	
	cal.set(year, month-1,1);
	
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	String loginID = (String)session.getAttribute("loginID");
	Zoo_ReservationDAO dao = new Zoo_ReservationDAO();
	int day;
	
			
		
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
	<div>
	<a href="reservation.jsp?year=<%=year%>&month=<%=month-1%>">이전달</a>&nbsp;
	<b><%=year %>년&nbsp;&nbsp;<%=month %>월</b>
	<a href="reservation.jsp?year=<%=year%>&month=<%=month+1%>">&nbsp;다음달</a>
	<table border="1">
		<tr>
			<td style=color:red;>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td style=color:blue;>토</td>
		</tr>
		
		<tr>
			<%
				for(int i=1;i<week;i++){
			%>
			<td height="20">&nbsp;</td>
			<%
				}
			%>
			<%
				for(int j=1; j<=endDay;j++){
					week++;
					if(week%7 ==2){
			%>
		</tr>
		<tr>
			<%} %>
			<%if(week%7 ==2){ %>
			<td>
			<a href="reservation.jsp?year=<%=year %>&month=<%=month %>&day=<%=j%>" style="color:red"><%=j %></a>
			</td>
			<%}else if(week%7==1){ %>
			<td>
			<a href="reservation.jsp?year=<%=year %>&month=<%=month %>&day=<%=j%>" style="color:blue"><%=j %></a>
			</td>
			<%}else { %>
			<td>
			<a href="reservation.jsp?year=<%=year %>&month=<%=month %>&day=<%=j%>" style="color:black"><%=j %></a>
			</td>
				<%}
			}%>
		</tr>
	</table>
	<%
	
	if(request.getParameter("day")!=null){ 
		day = Integer.parseInt(request.getParameter("day"));
		
		Zoo_OperationVO ovo = dao.operationSearch(year, month, day);
		
		
	%> 
	<table border="1">
		<%if(ovo!=null){ %>
		<tr>
			<td>예약 일자</td>
			<td>예약 번호</td>
			<td>호텔 번호</td>
			<td>방 종류</td>
			<td>예약 가격</td>
			<td>예약 가능여부</td>
		</tr>
		<tr>
			<% 
			%>
			<td><%=year%>-<%=month%>-<%=day%></td>
			<td><%=ovo.getO_number() %></td>
			<td><%=ovo.getH_number() %></td>
			<td><%=ovo.getO_type() %></td>
			<td><%=ovo.getO_charge() %></td>
			<td><% 
			String ok = null;
			if(ovo.getO_ok().equals("1")) {
				ok = "예약가능";			
					
				}
				%>
				<%=ok %>
				</td>
			
			
			
		</tr>
		<%}else{
		%>	
		<tr>
			<td>예약가능한 호텔이 없습니다.</td>
		</tr>
		<%}
		
		
		}
		
		%>
	</table>
	
	
	</div>

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
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="zoo_Reservation.Zoo_OperationVO,zoo_Reservation.Zoo_ReservationDAO,java.util.List" %>

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
<title>Zootopia Reservation</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="../js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  display: flex;
  justify-content: center;
  line-height: 1;
  margin: 20px 10px;
   font-family :'Hahmlet', serif;
}
table.type11 th {
  width: 90px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
   font-family :'Hahmlet', serif;
  background: orange;
}
table.type11 td {
  width: 90px;
  padding: 10px;
   font-family :'Hahmlet', serif;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
table.type12 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  display: flex;
  justify-content: center;
  line-height: 0.5;
  margin: 20px 10px;
   font-family :'Hahmlet', serif;
}
table.type12 th {
  width: 10px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: orange;
  font-family :'Hahmlet', serif;
}
table.type12 td {
  width: 10px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
  font-family :'Hahmlet', serif;
}

</style>
</head>
<body>
 <!-- header -->
   <header id="header" class="full-header">
            <div id="header-wrap">
          <div class="container_header">     
              <a href="../index.jsp"><img id="main__logo" src="../img/pomelogo.png" width="50px" height="50px"/></a>          
             <a href="../index.jsp" id="title__logo" align="center">ZOOTOPIA</a>            
              <a href="../login.jsp"><img id="login__logo" src="../img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
          <div class="inner">
    	<nav id="primary-menu">
              <ul class="nav_ul">
                  <li class="nav_li"><a href="reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="../zoo_hotel/hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="../zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
<!-- section -->
<section style="height: 70%;">
	<div class="section_bar" align="center">
		Reservation Section
	
	</div><br>
	<div align="center">
	<form action="reservation_page.jsp" method="post" align="center" style="font-size: 15px;" >
	<a href="reservation.jsp?year=<%=year%>&month=<%=month-1%>" style="font-family:'Hahmlet', serif;">이전달</a>&nbsp;
	<b style="font-family:'Hahmlet', serif;"><%=year %>년&nbsp;&nbsp;<%=month %>월</b>
	<a href="reservation.jsp?year=<%=year%>&month=<%=month+1%>" style="font-family:'Hahmlet', serif;">&nbsp;다음달</a>
	<table class="type12">
		<tr>
			<th style=color:red;>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th style=color:blue;>토</th>
		</tr>
		
		<tr>
			<%
				for(int i=1;i<week;i++){
			%>
			<td >&nbsp;</td>
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
	</table><br>
	<%
	
	if(request.getParameter("day")!=null){ 
		day = Integer.parseInt(request.getParameter("day"));
		
		Zoo_OperationVO vo = new Zoo_OperationVO();
		List<Zoo_OperationVO> voList = dao.operationSearch(year, month, day);
		
	
	%> 
	<table class="type11" >
		<%	if(voList.size()!=0){ %>
		<tr>
			<th>예약 일자</th>
			<th>예약 번호</th>
			<th>호텔 번호</th>
			<th>방 종류</th>
			<th>예약 가격</th>
			<th>예약 가능여부</th>
		</tr>
		<%for(Zoo_OperationVO ovoo : voList) {%>
		<tr>
			<td><%=year%>-<%=month%>-<%=day%></td>
			<td><%=ovoo.getO_number() %></td>
			<td><%=ovoo.getH_number() %></td>
			<td><%=ovoo.getO_type() %></td>
			<td><%=ovoo.getO_charge() %></td>
			<td><%String ok = null;
				if(ovoo.getO_ok().equals("1")) {
					ok = "예약가능";	%>
				<input type="hidden" name="O_date" value="<%=year%>-<%=month%>-<%=day%>">
				<input type="hidden" name="O_number" value="<%=ovoo.getO_number()%>">
				<input type="hidden" name="O_type" value="<%=ovoo.getO_type()%>">
				<input type="hidden" name="O_charge" value="<%=ovoo.getO_charge()%>">
				
				<%-- <a href="reservation_Proc.jsp?O_number=<%=ovoo.getO_number()%>"><%=ok %></a> --%> 
				<input type="submit" style="font-family:'Hahmlet';" value="<%=ok%>">
				<%}else{ %>
				예약불가
				<%} %>
			</td>	
		</tr>
		<%}
			
		}else {%>
		
			<tr>
				<th>예약 일자</th>
				<th>예약 번호</th>
				<th>호텔 번호</th>
				<th>방 종류</th>
				<th>예약 가격</th>
				<th>예약 가능여부</th>
			</tr>
			<tr>
				<td>-</td>
				<td colspan="4">예약 가능한 방이 없습니다.</td>
				<td>-</td>	
			</tr>
		<%}
		
		} %>
		
	</table><br>
	
	<%
		try{	
	if(loginID.equals("GM")){ %>
		<div align="center">
			<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="방 등록하기" onclick="window.location='insertOperation.jsp'">
		</div>
	<%}else {}
	
	}catch(Exception e){}%>
	
	
	</form>
</div>
</section>

<!-- footer -->
<footer class="site-footer" style="margin-top:326px;">
 <div class="container" style="display: flex; justify-content: space-around; align-items: center;">
      	<div id="footericon">
      		<a href="#" id="footericon"><i class="fab fa-google"></i></a>&nbsp;
      		<a href="#" id="footericon"><i class="fab fa-github"></i></a>
      	</div>
      <div class="col-xs-6 col-md-3">
           
            <ul class="footer-links">
              <!-- <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
              <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
              <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
              <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
              <li><a href="http://scanfcode.com/category/android/">Android</a></li>
              <li><a href="http://scanfcode.com/category/templates/">Templates</a></li> -->
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            
            <ul class="footer-links">
              <li><a href="http://scanfcode.com/about/">About Us</a></li>
              <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
              <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
              <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
              <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
            </ul>
          </div>
          <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12" id="cr">
            <p class="copyright-text">Copyright <i class="far fa-copyright"></i> 2022 All Rights Reserved by 
         <a href="https://github.com/w2strose/teamProject_zootopia">Team UnderDog</a>.
            </p>
          </div>
        </div>
      </div>
 </div>
       
</footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Breakdown.Zoo_breakdownDAO" %>
<%@ page import="zoo_Breakdown.Zoo_breakdownVO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

String loginID = request.getParameter("loginID");
request.setCharacterEncoding("UTF-8");
ArrayList<Zoo_breakdownVO> listBk = null;

Zoo_breakdownDAO dbPro = new Zoo_breakdownDAO();
listBk = dbPro.listBk(loginID);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZootopiaMain</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style type="text/css">

table
{
	margin: auto
}

</style>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  auto:true,
    	  speed:400,
    	  autoControls:true,
    	  touchEnabled:(navigator.maxTouchPoint >0)
    	});
    });
  </script>

</head>
<body>

<!-- 호텔, 이벤트, 이용후기, 예약 --> 
<!-- 상단부 -->
  <header id="header" class="full-header">
        <div id="header-wrap">
          <div class="container_header">
            <!-- Logo -->
            <div id="logo"> 
              <a href="index.jsp"><img id="main__logo" src="img/pomelogo.png" width="70px" height="70px"/></a>
              <div align="center">ZOOTOPIA</div>            
  
            </div>
            <!-- #logo end -->

            <!-- Primary Navigation
					============================================= -->
            <nav id="primary-menu">
              <ul class="nav_ul">
                    <li class="nav_li"><a href="zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="Q&A.jsp">Q&A</a></li>   
                
              </ul>
            </nav>
            <!-- #primary-menu end -->
            <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>

<section style="height: 800px;">
	<div class="section_bar">
		메인 페이지
	</div>
	<br><br>
	<table border="1" cellpadding="0" cellspacing="0" width="500" >
		<tr>
			<td align="center"> 회원 아이디 </td>
			<td align="center"> 호텔 이름 </td>
			<td align="center"> 방 타입 </td>
			<td align="center"> 방 요금 </td>
			<td align="center"> 예약 날짜 </td>
			<td align="center"> 예약 마리 수</td>
		</tr>
		<%for(Zoo_breakdownVO vo : listBk) {%>
		<tr>
			<td align="center"><%=vo.getId() %></td>
			<td align="center"><%=vo.getH_name() %></td>
			<td align="center"><%=vo.getO_type() %></td>
			<td align="center"><%=vo.getO_charge() %></td>
			<td align="center"><%=vo.getR_date() %></td>
			<td align="center"><%=vo.getR_member() %></td>
		</tr>
		<%} %>
	</table>
	

</section>

<!-- 하단부 -->
<footer style="height: 100px;">
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
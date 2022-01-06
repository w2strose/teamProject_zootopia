<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Hotel.zoo_HotelDAO" %>
<%@ page import="zoo_Hotel.zoo_HotelVO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

String loginID = (String)session.getAttribute("loginID");
request.setCharacterEncoding("UTF-8");
ArrayList<zoo_HotelVO> listHt = null;

zoo_HotelDAO dbPro = new zoo_HotelDAO();
listHt = dbPro.listHt(loginID);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZootopiaHotel</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style type="text/css">
table
{
	margin : auto
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
	<h3 align="center"> 호텔 정보 페이지</h3>
	<br><br>
	
	 <% for(zoo_HotelVO vo : listHt) 
	
	
	{	%>
	<table border="1" width="1200" height="500">
		<tr>
			<td colspan="3" align="center"><%=vo.getH_name() %></td>
			<td align="center">방 개수 : <%= vo.getH_roomnumber()%></td>
		</tr>
		<tr>
			<td align="center">전화번호</td>
			<td align="center"><%=vo.getH_phone1() %></td>
			<td align="center"><%=vo.getH_phone2() %></td>
			<td align="center"><%=vo.getH_phone3() %></td>
		</tr>
		<tr>
			<td align="center" colspan="2">주소 : <%=vo.getH_address() %></td>
			<td align="center">우편 번호 : <%=vo.getH_postnum() %></td>
			<td align="center">상세 주소 : <%=vo.getH_jibunaddress() %></td>
		</tr>
		<tr height="500">
			<td colspan="4" align="center"><%=vo.getH_coment() %></td>
		</tr>
	</table>
	<% } %> 
	
	
	
	<!-- 지도 -->
	
	
	
	
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
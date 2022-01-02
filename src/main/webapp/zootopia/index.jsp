<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Event.Zoo_EventDAO" %>
<%@ page import="zoo_Event.Zoo_EventVO" %>
<%@ page import="java.util.List"%>
<%
int count = 0;
List<Zoo_EventVO> eventList = null;
Zoo_EventDAO dbPro = new Zoo_EventDAO();
dbPro = Zoo_EventDAO.getinstance();
count = dbPro.getEventCount();
if(count > 0){
	eventList = dbPro.getEvents();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZootopiaMain</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css">

<script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  auto:true,
    	  speed:500,
    	  autoControls:true,
    	  touchEnabled:(navigator.maxTouchPoint >0)
    	});
    });
  </script>

</head>
<body>
<!-- 호텔, 이벤트, 이용후기, 예약 -->
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
                  <li class="nav_li"><a href="reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="use.jsp">호텔</a></li>
                  <li class="nav_li"><a href="event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="expert.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="Q&A.jsp">Q&A</a></li>     
                
              </ul>
            </nav>
            <!-- #primary-menu end -->
            <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>

<section style="height: 800px;">
	<div class="section_bar"  style="font-size: 34px; color: black;">
		메인 페이지
	</div>
	
	<%if(count == 0){// 이벤트 없을경우 %>
			 <br><br>
		<span>게시판에 저장된 글이 없습니다..</span>
		<%}else{ // 글이 있을경우 %>
	
		
		<div align="center" style="font: 20px bold; margin-top: 10px;">진행중인 이벤트</div>
	 <div class="slider" style="" align="center">
	 <% for(int i = 0; i<eventList.size(); i++){
			Zoo_EventVO event = (Zoo_EventVO)eventList.get(i);	 
		 %>
	 
	 	<a href="eventView.jsp?E_number=<%= event.getE_number()%>">
   			<img alt="" src="img/<%= event.getE_image()%>" style="width: 1000px; height: 500px;" >
   		</a>	
   		<%} %>
   <%} %>
  </div>
		
	

</section>

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
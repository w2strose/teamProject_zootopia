<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>    
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia Event</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<%

	int E_number = Integer.parseInt(request.getParameter("E_number"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	try{
		Zoo_EventDAO dbPro = Zoo_EventDAO.getinstance();	
		Zoo_EventVO event = dbPro.getEvent(E_number);
		
%>

<body>
  <!-- Header -->
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
                  <li class="nav_li"><a href="hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="Q&A.jsp">Q&A</a></li>                  
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
<!-- Section -->      
<section style="height: 1100px;">
	<div class="section_bar" align="left" style="font-size: 34px;
    color: black;
    width: 100%;">
		이벤트 상세
	</div>
	
	 <div class="contents_wrap">
                    
                    <p class="qs_title" style="margin-bottom: 0;">
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/ev_title_img01.png" alt="" />
                        <span><%= event.getE_name() %></span>
                    </p>
                    <div class="qs_info_wrap" style="display: flex; align-items: center; justify-content: space-between; font-size: 15px;">
                  
                    	<div style="margin-left: 20px; font-size: 15px;">
                    		<img src="img/dateicon.png">
                        		<span class="event_date"> <%= event.getE_regdate() %> </span>
                        </div>
                        <div class="qs_info" style="margin-right: 20px; font-size: 15px;">
                            <p><img src="img/viewuser.png" />
                            <%= event.getE_readcount() %>
                            </p>                        
                        </div>
                    </div>
    </div>
    
    
	<div align="center" style="margin-top: 200px; padding: 50px;">
	<img alt="" src="img/<%= event.getE_image()%>" id="viewImage"><br><br><br><br>
	
		<input type="button" value="목록" onclick="document.location.href='event.jsp'">
	</div>
	
	
	
</section>

<!--  Footer -->
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
<%}catch(Exception e){
		e.printStackTrace();
	} 
%>
	
	
	
	
	
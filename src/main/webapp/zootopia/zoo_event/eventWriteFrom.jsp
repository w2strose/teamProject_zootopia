<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%> 
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    
<%@page import="zoo_Event.ConnUtil" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia EventWrite</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
  <!-- Header -->
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
                  <li class="nav_li"><a href="../zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="../hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../Q&A.jsp">Q&A</a></li>                  
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="../login.jsp"><img id="login__logo" src="../img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
<!-- Section -->      
<section style="height: 800px;">
	<div class="section_bar" align="left" >
		이벤트 등록
	</div>
	
	<form action="eventwriteProc.jsp" name="eventwriteForm" method="post"
		onsubmit="return eventWriteSave()" style="margin-top: 50px;">
		
		<input type="hidden" name="E_number">
		
		<table width="600" border="1" cellpadding="0" cellspacing="0"
			align="center">

			<tr>
				<td align="center" colspan="2"><a href="event.jsp"> 이벤트목록 </a></td>
			</tr> 
			
			<tr>
				<td width="200" align="center">이벤트 제목</td>
				<td width="300" >
					<input type="text" size="50" maxlength="50" name="E_name">
				</td>
			</tr>
			<tr>
				<td width="200" align="center">내용</td>
				<td width="300" >
					<textarea rows="13" cols="50" name="E_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td width="200" align="center">이미지</td>
				<td width="300" >
					<textarea rows="13" cols="50" name="E_image"></textarea>
				</td>
			</tr>
		
			<tr>
			<td width="200" align="center">시작일</td>
				<td width="300" >
					<input class="input-field birth" type="date" name="E_startDate" placeholder="2022-01-01">
				</td>
			</tr>
			
			<tr>
			<td width="200" align="center">종료일</td>
				<td width="300" >
					<input class="input-field birth" type="date" name="E_endDate" placeholder="2022-12-31">
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="이벤트쓰기">					
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onClick="window.location='event.jsp'">					
				</td>							
			</tr>
			
			
		</table>
		
	</form>
	
	
	
	
	
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
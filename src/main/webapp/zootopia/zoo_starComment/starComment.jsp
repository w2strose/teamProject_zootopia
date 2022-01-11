<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Hotel.zoo_HotelDAO" %>
<%@ page import="zoo_Hotel.zoo_HotelVO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

	String r_number = request.getParameter("r_number");
	String loginID = (String)session.getAttribute("loginID");
	request.setAttribute("r_number", r_number);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZootopiaHotel</title>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
<link href="../css/style.css" rel="stylesheet" type="text/css">
  
<style type="text/css">
#tableHotel
{
	border : 1px solid;
	border-collapse: separate;
	border-top: 1px solid black;
	border-left: 1px solid black;
}
#tableHotel th
{
	border-right: 1px solid black;
	border-bottom: 1px solid black;	
}
#tableHotel td
{
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}
	
</style>


</head>
<body>
<!-- Header -->
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
                  <li class="nav_li"><a href="../zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="../zoo_hotel/hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="../zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->  

<section style="height: 1500px;">
	<div class="section_bar" align="center">
		별점 / 코멘트 
	</div>
	<h3 align="center">별점/코멘트 입력 게시판</h3>
	<br><br>
	
	<form action="starCommentProc.jsp" method="post">
	
	<input type="hidden" name="r_number" value="<%=r_number %>" >
	<table width="700" border="1px solid black" align="center">
		<tr>
			<td>예약 번호</td>
			<td><%=r_number %></td>
		</tr>
		<tr align="center">
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr align="center">
		<td>별점</td>
		<td>
			<select style="width:50px;height:18px" name="star">
				<option>0.0</option>
				<option>0.5</option>
				<option>1.0</option>
				<option>1.5</option>
				<option>2.0</option>
				<option>2.5</option>
				<option>3.0</option>
				<option>3.5</option>
				<option>4.0</option>
				<option>4.5</option>
				<option>5.0</option>
			</select>
		</td>
		</tr>
		<tr height="300">
			<td colspan="2">
			<textarea rows="20" cols="100" name="coment"></textarea>
			</td>
		</tr>
		</table>
		<input type="submit" value="등록하기">
	</form>
		
	
</section>

<!-- footer -->
<footer class="site-footer">
 <div class="container" style="display: flex; justify-content: space-around; align-items: center;">
      	<div id="footericon">
      		<a href="#" id="footericon"><i class="fab fa-google"></i></a>&nbsp;
      		<a href="#" id="footericon"><i class="fab fa-github"></i></a>
      	</div>
      <div class="col-xs-6 col-md-3">
           
            <ul class="footer-links">
              <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
              <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
              <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
              <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
              <li><a href="http://scanfcode.com/category/android/">Android</a></li>
              <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
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
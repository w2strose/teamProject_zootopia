<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="zoo_Reservation.Zoo_OperationVO,zoo_Reservation.Zoo_ReservationDAO,java.util.List" %>

<%
	request.setCharacterEncoding("utf-8");
	String loginID = (String)session.getAttribute("loginID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html;">
<title>Zootopia insertOperation</title>
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
  margin: 10px 10px;
   font-family :'Hahmlet', serif;
}
table.type11 th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
   font-family :'Hahmlet', serif;
   font-size : 15px;
  background: orange;
}
table.type11 td {
  padding: 10px;
   font-family :'Hahmlet', serif;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
  font-size: 10pt;
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
                 <li class="nav_li"><a href="../zoo_starComment/starComment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
<!-- section -->
<section>
	<div class="section_bar" align="center">
		Reservation Section
	
	</div>
	<form action="insertOperation_proc.jsp" method="post" >
	<table align="center" class="type11">
 		
 		<tr>
 			<th width="200"  align="center">호텔 번호</th>
 			<td width="200" align="left">
 			<input type="text" name="H_number"> 
 			</td>
 		</tr>
 		<tr>
 			<th width="200"  align="center">방 종류</th>
 			<td width="200" align="left">
			<select name="O_type">
				<option value="갓갓갓룸">갓갓갓룸
				<option value="갓갓기룸">갓갓기룸
				<option value="갓갓가룸">갓갓가룸
				<option value="갓민기룸">갓민기룸
				<option value="홍민기룸">홍민기룸
			</select>
 			</td>
 		</tr>
 		<tr>
 			<th width="200"  align="center">예약가능 날짜</th>
 			<td width="200" align="left">
			<input type="text" name="O_date" value="2022-1-5">
 			</td> 
 		</tr>
 		<tr>
 			<th width="200"  align="center">가격</th>
 			<td width="200" align="left">
				<input type="text" name="O_charge">
 			</td>
 		<tr>
 			<td colspan="2"  align="center"> 
 				<input type="submit" style="font-family:'Hahmlet';font-size: 13px;" value="등록하기">
 				<input type="reset" style="font-family:'Hahmlet';font-size: 13px;" value="다시작성">
  			</td>
 		
 		</tr>
	</table>
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
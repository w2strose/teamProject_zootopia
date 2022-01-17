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
boolean coment = false;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZootopiaMain</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style type="text/css">

	#tablebreakDown {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	display: flex;
	justify-content: center;
	line-height: 1;
	margin: auto;
	font-family :'Hahmlet', serif;
	}
	#tablebreakDown #coment_board {
	width : 50%;	
	}
	#tablebreakDown th {
	font-size : 15px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	font-family :'Hahmlet', serif;
	background: orange;
	}
	#tablebreakDown td {
	width: 500px;
	padding: 10px;
	font-family :'Hahmlet', serif;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
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
    
    function values(r_number){
    
    }

    function logoutCheck() {
		if (confirm("정말 로그아웃하시겠습니까??") == true){    //확인
			location.href="logout.jsp";
		}else{   //취소
	    	return false;
		}
	}
 </script>

</head>
<body>

<!-- 호텔, 이벤트, 이용후기, 예약 --> 
<!-- 상단부 -->
  <header id="header" class="full-header">
            <div id="header-wrap">
          <div class="container_header">     
              <a href="index.jsp"><img id="main__logo" src="img/pomelogo.png" width="50px" height="50px"/></a>          
             <a href="index.jsp" id="title__logo" align="center">ZOOTOPIA</a>            
              <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
          <div class="inner">
    	<nav id="primary-menu">
              <ul class="nav_ul">
                  <li class="nav_li"><a href="zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="zoo_hotel/hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      

<section style="height: 800px;">
	<div class="section_bar" align="center">
		과거 예약 내역
	</div>
	<br><br>	
	<div align="center">
		<div class="loginOutside">
	
			<div class="loginInside">
				
				
		<a class="loginbox" href="login.jsp">회원정보</a>
		<a class="loginbox" href="modifyForm.jsp">정보수정</a>
		<a class="loginbox loginboxActive" href="breakForm.jsp?loginID=<%=loginID%>">과거예약</a>
		<a class="loginbox" href="deleteForm.jsp">회원탈퇴</a>
		<a class="loginbox logoutbox" onclick="logoutCheck()">로그아웃</a>
			</div>
	<div style="background: rgb(246, 246, 246);overflow-y:auto;" align="center">
	<table id="tablebreakDown">
		<%if(listBk != null) 
		{ %>
		
		<tr>
			<td align="center"> 예약 번호 </td>
			<td align="center"> 호텔 이름 </td>
			<td align="center"> 방 타입 </td>
			<td align="center"> 방 요금 </td>
			<td align="center"> 예약 날짜 </td>
			<td align="center"> 예약 마리 수</td>
			<td align="center"> 별점 / 코멘트</td>
		</tr>
			<%for(Zoo_breakdownVO vo : listBk) 
			{ %>
		
 			<%coment = dbPro.listBkSet(loginID, vo.getR_number());%>
 		
	 			<%if(coment){ %>
		<tr>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_number() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getH_name() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getO_type() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getO_charge() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_date() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_member() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><input type="submit" value="수정하기"
			onclick="location='zoo_starComment/starCommentUpdate.jsp?r_number=<%=vo.getR_number()%>'"></td>
		</tr>
				<% } 
	 			else { %>
		<tr>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_number() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getH_name() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getO_type() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getO_charge() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_date() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><%=vo.getR_member() %></td>
			<td align="center" style="background: rgb(246, 246, 246)"><input type="submit" value="등록하기"
			onclick="location='zoo_starComment/starComment.jsp?loginID=<%=loginID%>&r_number=<%=vo.getR_number()%>'"></td>
		</tr>
				<%}}}else{%>
		<tr>
			<td align="center"> 예약 번호 </td>
			<td align="center"> 호텔 이름 </td>
			<td align="center"> 방 타입 </td>
			<td align="center"> 방 요금 </td>
			<td align="center"> 예약 날짜 </td>
			<td align="center"> 예약 마리 수</td>
			<td align="center"> 별점 / 코멘트</td>
		</tr>
		<tr>
			<td colspan="7">예약한 호텔이 없습니다 
		</tr>

		<%} %>
	</table>
			</div>	
		</div>
	</div>		
	

</section>

<!-- 하단부 -->
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
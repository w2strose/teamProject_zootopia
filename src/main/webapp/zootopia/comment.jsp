<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Star.StarDAO" %>
<%@ page import="zoo_Star.StarListVO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%

String loginID = (String)session.getAttribute("loginID");
request.setCharacterEncoding("UTF-8");

StarDAO dao = new StarDAO();
ArrayList<StarListVO> listBk = null;

listBk = dao.listBk(loginID);

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
		이용 후기 게시판
	</div>
	<br><br>	
	<table cellpadding="0" cellspacing="0" width="700" id="tablebreakDown">
		<%if(listBk != null) {%>
		
		<tr>
			<th align="center" width="200"> 예약번호 </th>
			<th align="center"> 제목 </th>
			<th align="center"> 별점 </th>
			<th align="center"> 코멘트 날짜 </th>
			<th align="center" id="coment_board"> 내용</th>
		</tr>
		<%for(StarListVO vo : listBk) {
			
			int coment_length = vo.getS_coment().length();
			if(coment_length < 25){%>
		<!-- 코멘트 길이가 30자 이하일 때 -->
		<tr>
			<td align="center" width="200"><%=vo.getR_number() %></td>
			<td align="center"><%=vo.getS_title() %></td>
			<td align="center"><%=vo.getS_star()%></td>
			<td align="center"><%=vo.getS_regdate() %></td>
			<td align="center" id="coment_board"><a href="zoo_starComment/starCommentBoard.jsp?r_number=<%=vo.getR_number()%>"><%=vo.getS_coment() %></a></td>
		</tr>
		<%}else{%>
		<!-- 코멘트 길이가 30자 이상 일 때 -->
		<tr>
			<td align="center" width="200"><%=vo.getR_number() %></td>
			<td align="center"><%=vo.getS_title() %></td>
			<td align="center"><%=vo.getS_star()%></td>
			<td align="center"><%=vo.getS_regdate() %></td>
			<%String coment = vo.getS_coment().substring(0,25); %>
			<td align="center" id="coment_board"><a href="zoo_starComment/starCommentBoard.jsp?r_number=<%=vo.getR_number()%>"><%=coment %> <br><b><font color="red">[더보기]</font></b></a></td>
		</tr>	
		
		
		<%}}}else{%>
		}
		<tr>
			<td>예약한 호텔이 없습니다 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="button" value="돌아가기" onclick="history.back()"></td>
		</tr>

		<%} %>
	</table>
	
	

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

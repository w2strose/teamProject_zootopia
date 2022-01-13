<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Hotel.zoo_HotelDAO" %>
<%@ page import="zoo_Hotel.zoo_HotelVO" %>
<%@ page import="zoo_Star.StarListVO" %>
<%@ page import="zoo_Star.StarDAO" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
int loginID = 1;
 
ArrayList<zoo_HotelVO> listHt = null;

StarDAO starDao = new StarDAO();
zoo_HotelDAO dbPro = new zoo_HotelDAO();
listHt = dbPro.listHt(loginID);

double result = starDao.AvgStar();
int a =0;



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
<style type="text/css">

	#tableHotel {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	display: flex;
	justify-content: center;
	line-height: 1;
	margin: 20px 10px;
	font-family :'Hahmlet', serif;
	}
	#tableHotel th {
	width: 90px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	font-size : 15px;
	font-family :'Hahmlet', serif;
	background: orange;
	}
	#tableHotel td {
	width: 90px;
	padding: 10px;
	font-family :'Hahmlet', serif;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
	}
</style>

<!-- 지도관련 -->

<!-- 사용자 정의 CSS -->
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />

<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>

<!-- plugin 참조 -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="../plugins/gmap/gmaps.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#map 
{ 
	width: 50%; height: 450px; 
	margin:auto;
}
</style>

<!-- 사용자 스크립트 블록 -->
<script type="text/javascript">
	/** 전역변수들 생성 */
	// 구글맵 객체
	var map = null;
	// 위도 기본값
	var lat = 37.498627;
	// 경도 기본값
	var lng = 127.030767;
		$(function() {
		// 구글맵 생성 (기본 사용 방)
		map = new GMaps({
			// 지도가 출력될 div의 id
			"el" : '#map',
			// 지도가 표시될 위/경도
			"lat" : lat,
			"lng" : lng,
			// 줌 컨트롤 사용 여부
			"zoomControl" : true
		});
			// 표시중인 위치에 마커 추가
			map.addMarker({
			"lat" : lat,
			"lng" : lng,
			"title" : '글로벌인',
			"click" : function(e) {
				console.log(e);
			},
			"mouseover" : function(e) {
				console.log(e);
			},
			"infoWindow" : {
				"content" : '<p>글로벌인</p>'
			}
		});
	});
</script>
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

<section style="height: 1000px;">
	<div class="section_bar" align="center">
		호텔 정보 
	</div>
	<br>
	<br><br>
	<% if(listHt == null) {%>
		<table id="tableHotel">
			<tr>
				<td align="center" colspan="4">호텔 정보가<br>없습니다</td>
			</tr>
		</table>
			<% }else{for(zoo_HotelVO vo : listHt) { %>
		<table id="tableHotel">
			<tr>
				<th align="center" colspan="4"><%=vo.getH_name() %></th>
			</tr>
			<tr>
				<td align="center">방 개수</td>
				<td align="center" colspan="3"><%= vo.getH_roomnumber()%></td>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td align="center"><%=vo.getH_phone1() %></td>
				<td align="center"><%=vo.getH_phone2() %></td>
				<td align="center"><%=vo.getH_phone3() %></td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td align="center" colspan="3"><%=vo.getH_address() %></td>
			</tr>
			<tr>
				<td align="center">우편 번호</td>
				<td align="center" colspan="3"><%=vo.getH_postnum() %></td>
			</tr>
			<tr>	
				<td align="center">상세 주소</td>
				<td align="center" colspan="3"><%=vo.getH_jibunaddress() %></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><%=vo.getH_coment() %></td>
			</tr>
		</table>
	
		<% } %> 
		
		<div>
			<table id="tableHotel">
				<tr>
					<td>별점</td>
					<td><%= result %></td>
					<td>
					<%if(result < 1.0){%>
						<img alt="" src="../img/00.png">
					<%}else if(result >= 1.0 && result < 2.0)  {%>
						<img alt="" src="../img/11.png">
						<%}else if(result >= 2.0 && result < 3.0){ %>
							<img alt="" src="../img/22.png">
						<%}else if(result >= 3.0 && result < 4.0) { %>
							<img alt="" src="../img/33.png">
						<%}else if(result >= 4.0 && result < 5.0) {%>
							<img alt="" src="../img/44.png">
						<%}else if(result == 5.0) {%>
							<img alt="" src="../img/55.png">
						<%} %>
					</td>
				</tr>
			</table>
		</div>
		<!-- 지도 -->
		<div class="example">
			<div id="map"></div>
		</div>
	<%} %>
	
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

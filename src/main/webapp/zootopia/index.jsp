<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zoo_Event.Zoo_EventDAO" %>
<%@ page import="zoo_Event.Zoo_EventVO" %>
<%@ page import="java.util.List"%>
<%

String loginID = (String)session.getAttribute("loginID");
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


/* The hero image */
.hero-image {
  /* Use "linear-gradient" to add a darken background effect to the image (photographer.jpg). This will make the text easier to read */
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/7.jpg");

  /* Set a specific height */
  height: 50%;

  /* Position and center the image to scale nicely on all screens */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

/* Place text in the middle of the image */
.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
  font-family :'Hahmlet', serif; 
  font-size: 20px;
}
</style>
<script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  auto:true,
    	  slideWidth: 800,
    	  speed:300,
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

<section style="height: 1200px;">
	<div class="section_bar" align="center">
		메인 페이지
	</div>
	
	<%if(count == 0){// 이벤트 없을경우 %>
			 <br><br>
			  <div align="center">
				<span>현재 진행중인 이벤트가 없습니다..</span>
			</div>
		
		<%}else{ // 글이 있을경우 %>
		
		<div class="hero-image">
  <div class="hero-text">
  	<img id="main__logo" src="img/pome.jpg" width="70px" height="70px"/>
    <h1 id="title__logo1">Zootopia</h1>
    <p>반려동물과 함께 만드는 이야기</p>
    
  </div>
</div>
		
		
		<br>
		<div align="center" style="font: 20px bold; margin-top: 10px;  font-family :'Hahmlet', serif; font-size: 20px;">
			진행중인 이벤트
		</div>
  		<br>
		<div style="display: flex; align-items: center; justify-content: center">
	 <div class="slider" style="" align="center">
	 <% for(int i = 0; i<eventList.size(); i++){
			Zoo_EventVO event = (Zoo_EventVO)eventList.get(i);	 
		 %>
	 
	 	<a href="zoo_event/eventView.jsp?E_number=<%= event.getE_number()%>">
   			<img alt="" src="img/<%= event.getE_image()%>" style="width: 800px; height: 400px;" >
   		</a>	
   		<%} %>
   <%} %>
  </div>
  </div>
		
	<script>
	function chatWinOpen() {
		var options = 'top=400, left=1000, width=330, height=410, status=no, menubar=no, toolbar=no, resizable=no';
		var id = document.getElementById("loginID");
		window.open("ChatWindow.jsp?chatId=" + id.value, "",
				options);
		
	}
	function chatLoginOpen() {
		var id = document.getElementById("loginID");
		alert("로그인을 먼저 해주시기바랍니다.");
		window.open("login.jsp");
	}
	</script>
	<div align="center" style="position: fixed; right: 20px; bottom: 20px;">
	<input type="hidden" id="loginID" value="<%=loginID %>" name="loginValue" />
	
	<%try {if(loginID != null){ %>
	<button onClick="chatWinOpen();" style="background-color:orange;width: 50px;height: 50px;border-radius: 12px;display: flex;justify-content: center;align-items: center;"><img src="img/whitechat.png" alt=""  width="40px;" height="40px;"></button>
	<%}else{ %>
	<button onClick="chatLoginOpen();" style="background-color:orange;width: 50px;height: 50px;border-radius: 12px;display: flex;justify-content: center;align-items: center;"><img src="img/whitechat.png" alt=""  width="40px;" height="40px;"></button>
	<%}}catch(Exception e){} %>
	</div>

</section>

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
              <li><a href="#">About Us</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Contribute</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Sitemap</a></li>
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
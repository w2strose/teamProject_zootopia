<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regForm</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

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
    
<section style="height: 1050px;">
	<div class="section_bar" align="left" >
		회원가입
	</div>
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;" >
		 <form class="form reg" name="regForm" action="regProc.jsp" method="post">
   		 <div class="title">회원가입</div>
   		 <hr>
   		 <div>아이디</div>
   		 <div style='margin-bottom: 5px; position: relative; left: 130px;'>
   		 <input type="button" value="중복확인" onClick="idCheck(this.form.id.value)">
   		 </div>
  		 <input class="input-field" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합" >
  		 <label for="">비밀번호</label>
  		 <input class="input-field" type="password" name="pass" placeholder="8~12자리의 영대소문자와 숫자 조합">
  		 <label for="">비밀번호 확인</label>
  		 <input class="input-field" type="password" name="repass" placeholder="8~12자리의 영대소문자와 숫자 조합">
  	  	 <label for="">이름</label>
  		 <input class="input-field" type="text" name="name" placeholder="">
  		 <label for="">전화번호</label>
  		 <div>
  		 <select name="phone1" class="input-field-phone">
			<option value="02">02</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="042">042</option>
			<option value="010">010</option>
			</select>-
			<input type="text" name="phone2" size="5" class="input-field-phone">-
			<input type="text" name="phone3" size="5" class="input-field-phone">
		</div>	
  	 	 <label for="">이메일</label>
	     <input class="input-field" type="text" name="email" placeholder="example@google.com"> 
	     <label for="">생년월일</label>
  	     <input class="input-field birth" type="date" name="birth" placeholder="2021-12-31">
    
         <button type="button" onClick="inputCheck()">회원 가입</button>
         <button type="reset">다시입력</button>
         </form> 
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
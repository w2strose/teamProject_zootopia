<%@page import="zootopia.zoomemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zootopia.*" %>    
<jsp:useBean id="dao" class="zootopia.zoomemberDAO"/>    
    <%
	String loginID = (String)session.getAttribute("loginID");
	zoomemberVO vo = dao.getMember(loginID);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/script.js"></script>
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
               	   <li class="nav_li"><a href="zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="zoo_qna/qnaList.jsp">Q&A</a></li>                          
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
<section style="height: 1050px;">
	<div class="section_bar" align="left" >
		Member update
		회원정보 수정
	</div>
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;" >
		 <form class="form reg" name="regForm" action="modifyProc.jsp" method="post">
   		 <div class="title">회원정보 수정</div>
   		 <hr>
   		 <div>아이디</div>
  		 <span class="span-field"><%= vo.getId() %></span>
  		 <label for="">비밀번호</label>
  		 <input class="input-field" type="password" name="pass" placeholder="8~12자리의 영대소문자와 숫자 조합">
  		 <label for="">비밀번호 확인</label>
  		 <input class="input-field" type="password" name="repass" placeholder="8~12자리의 영대소문자와 숫자 조합">
  	  	 <label for="">이름</label>
  		  <span class="span-field"><%= vo.getName() %></span>
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
    
         <button type="button" onClick="updateCheck()">정보수정</button>
         <button type="button" onClick="javascript:window.location='login.jsp'">로그인화면으로 돌아가기</button>
         </form> 
	</div>
	

</section>

<footer>
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
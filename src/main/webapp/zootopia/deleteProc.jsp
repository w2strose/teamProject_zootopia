<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="zootopia.*" %>
<jsp:useBean id="dao" class="zootopia.zoomemberDAO" />

<%
	String id=(String)session.getAttribute("loginID");
	String pass = request.getParameter("pass"); //form에서
	int check = dao.deleteMember(id, pass);
	if(check == 1){
		session.invalidate();
%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
                  <li class="nav_li"><a href="reservation.html">예약하기</a></li>
                  <li class="nav_li"><a href="use.html">호텔</a></li>
                  <li class="nav_li"><a href="#">이벤트</a></li>
                 <li class="nav_li"><a href="expert.html">이용후기</a></li>
                
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
<section>

	<div class="section_bar" align="left" >
		Member Register
		회원가입
	</div>
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;" >
	
		회원탈퇴가 완료되었습니다.<br><br>
		이용해주셔서 감사합니다.<br>
		  <a href="login.jsp">로그인화면으로 돌아가기</a>
	
	</div>
	
	<%}else{ %>
	
	<script type="text/javascript">
	alert("비밀번호가 올바르지 않습니다.");
	history.go(-1);
	</script>
	
	<%} %>
	
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
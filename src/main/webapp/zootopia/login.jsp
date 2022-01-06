<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="zootopia.zoomemberVO"%>
<%@page import="zootopia.zoomemberDAO"%>    
<%
	String loginID = (String)session.getAttribute("loginID");
	zoomemberDAO dao = new zoomemberDAO();
	zoomemberVO vo = dao.getMember(loginID);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
                 <li class="nav_li"><a href="Q&A.jsp">Q&A</a></li>                     
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="login.jsp"><img id="login__logo" src="img/login2.png" width="40px" height="40px"/></a>
          </div>
        </div>
      </header>
<section>
	<div class="section_bar" align="left" >
		Member LogIn
		로그인 
	</div>
	<% if(loginID != null){  // 로그인 성공한 경우%>
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;" >
	<table width="300" border="1">
		<tr>
			<td colspan="4" align="center">
				<%= loginID %>님 환영합니다.
			</td>
		</tr>
		<tr>
			<td width="100" align="center">
				<a href="modifyForm.jsp">정보수정</a>
			</td>
			<td width="100" align="center">
				<a href="deleteForm.jsp">회원삭제</a>
			</td>
			<td width="100" align="center"> 
				<a href="logout.jsp">로그아웃</a>
			</td>
			<td width="100" align="center">
				<a href="reservation.jsp">예약내역</a>
			</td>
			<td width="100" align="center">
				<a href="breakForm.jsp?loginID=<%=loginID%>">과거예약</a>
			</td>
		</tr>
		
	</table>
	
	<br><br>
	
		<div> 
			<% if(vo != null){ %>
			<%= loginID %>님의 정보입니다.<br>
			비밀번호는 <%= vo.getPass() %> 입니다. <br>
			성함은 <%= vo.getName() %>입니다. <br>
			전화번호는 <%= vo.getPhone1() %> -  <%= vo.getPhone2() %> - <%= vo.getPhone3() %> 입니다. <br>
			이메일은 <%= vo.getEmail() %> 입니다. <br>
			생년월일은 <%= vo.getBirth() %> 입니다.
			
			<% } %>			
		</div>
	</div>
	<!-- 
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;" >
			
		<div class="member_main" style="width: 80%; height: 50%;" class="logindiv" >
			<div align="center" style="width: 20%; height:400px; flex-direction: column; border: 1px solid black;  display: inline-block;" >
				<div class="logindiv" style=" height: 98px;"><a href="modifyForm.jsp">정보수정</a></div>
				<div class="logindiv" style="height: 98px;"><a href="deleteForm.jsp">회원삭제</a></div>
				<div class="logindiv" style="height: 98px;"><a href="logout.jsp">로그아웃</a></div>
				<div class="logindiv" style="height: 98px;"><a href="logout.jsp">예약확인</a></div>
			</div>
			<div style="width: 60%; height: 400px; border: 1px solid black;  display: inline-block;">
			
			</div>
		</div>
			
	</div> -->
	
	<%}else{ //로그인 안된경우%>
	<div align="center" style="margin-top: 100px; margin-bottom: 100px;">
	<form action="loginProc.jsp" method="post" class="form login">
	     <div class="title">회원 로그인</div>
   		 <div id="msg" class="msg"> </div> 
   		 <label for="">아이디</label>
  		 <input class="input-field" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합">
  		 <label for="">패스워드</label>
  		 <input class="input-field" type="text" name="pass" placeholder="8~12자리의 영대소문자와 숫자 조합" style="margin-bottom: 20px;">
  		
  	  	 <input type="submit" value="로그인" class="form-button">
		 <input type="button" value="회원가입" class="form-button" onClick="javascript:window.location='regForm.jsp'">	
     
	</form>
	</div>
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
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
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
      
<section style="height: 710px;" >
	
	<% if(loginID != null){  // 로그인 성공한 경우%>
	<div class="section_bar" align="center" >
		회원 관리
	</div>
	<div align="center">
		<div class="loginOutside">
	
			<div class="loginInside">
				
				
		<a class="loginbox loginboxActive" href="login.jsp">회원정보</a>
		<a class="loginbox" href="modifyForm.jsp">정보수정</a>
		<a class="loginbox" href="breakForm.jsp?loginID=<%=loginID%>">과거예약</a>
		<a class="loginbox" href="deleteForm.jsp">회원탈퇴</a>
		<a class="loginbox logoutbox" onclick="logoutCheck()">로그아웃</a>
			</div>
			
			<div style="width: 600px; height: 500px; border: 1px solid black;  flex-direction: column;">
				<% if(vo != null){ %>
				<table class="type10">
				<tr>
					<td colspan="2" height="20px" align="center">[<%= loginID %>] 님의 회원정보</td>
				</tr>
				<tr>
					<td class="type10" align="center" width="200px" >아이디</td>
					<td class="type10" width="400px" align="left"><%= vo.getId() %></td>
				</tr>
				<tr>
					<td class="type10" align="center">비밀번호</td>
					<td class="type10" align="left"><%= vo.getPass() %></td>
				</tr>
				<tr>
					<td class="type10" align="center">이름</td>
					<td class="type10" align="left"><%= vo.getName() %></td>
				</tr>
				<tr>
					<td class="type10" align="center">전화번호</td>
					<td class="type10" align="left"><%= vo.getPhone1() %> -  <%= vo.getPhone2() %> - <%= vo.getPhone3() %></td>
				</tr>
				<tr>
					<td class="type10" align="center">이메일</td>
					<td class="type10" align="left"><%= vo.getEmail() %></td>
				</tr>
				<tr>
					<td class="type10" align="center">생년월일</td>
					<td class="type10" align="left"><%= vo.getBirth() %></td>
				</tr>
			
				</table>
			<% } %>	
			</div>
		</div>
	</div>		
	
	<%}else{ //로그인 안된경우%>
	<div class="section_bar" align="center" >
		회원 로그인
	</div>
	    <div style="display: flex; justify-content: center; margin-top: 70px;">
		<div align="center" style="width: 600px; height: 500px; border: 1px solid black; align-items: center; display: flex; justify-content: center; background: rgb(246, 246, 246);">
				<form action="loginProc.jsp" method="post" >
				
					<div style="width: 600px; height: 70px; display: flex; align-items: center; justify-content: center;">
								<b style="font-family :'Hahmlet', serif; font-size: 20px;">[회원 로그인]</b>
					</div>
					<div style="width: 600px; height: 70px; display: flex; align-items: center; justify-content: center;">
							<a href="index.jsp"><img id="main__logo" src="img/pomelogo.png" width="70px" height="70px"/></a>
					</div>
					<div style="width: 300px; height: 100px; display: flex; justify-content: center; flex-direction: column;">						
							<b style="font-family :'Hahmlet', serif; font-size: 18px; margin-bottom: 10px;">
								아이디							
							</b>			
							<input type="text" name="id"  size="20" style="padding: 5px;">	
					</div>
						<div style="width: 300px; height: 100px;display: flex;justify-content: center; flex-direction: column;">
						
								<b style="font-family :'Hahmlet', serif; font-size: 20px; margin-bottom: 10px;">비밀번호 입력</b>
						
								<input type="password" name="pass" size="20" style="padding: 5px;">
							 
						</div>
	
						<div style="width: 300px; height: 100px; display: flex; justify-content: center; flex-direction: column; ">
							
								<input type="submit" value="로그인" style="font-family :'Hahmlet', serif; font-size: 20px;">
								<input type="button" value="회원가입" onClick="javascript:window.location='regForm.jsp'" 
								style="font-family :'Hahmlet', serif; font-size: 20px;">				
							
						</div>
					
				</form>
			</div>
		</div>
	<%} %>
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
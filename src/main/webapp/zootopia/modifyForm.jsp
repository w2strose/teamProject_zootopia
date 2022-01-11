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
      
<section>
	<div class="section_bar" align="center" >
		회원정보 수정
	</div>
	<div align="center">
		<div class="loginOutside">
	
			<div class="loginInside">
				
		<a class="loginbox " href="login.jsp">회원정보</a>
		<a class="loginbox loginboxActive" href="modifyForm.jsp">정보수정</a>
		<a class="loginbox" href="breakForm.jsp?loginID=<%=loginID%>">과거예약</a>
		<a class="loginbox" href="deleteForm.jsp">회원탈퇴</a>
		<a class="loginbox logoutbox" onclick="logoutCheck()">로그아웃</a>
			</div>
			<div align="center" style="width: 600px; height: 500px; border: 1px solid black; align-items: center; display: flex; justify-content: center; background: rgb(246, 246, 246);">
				 <form name="regForm" action="modifyProc.jsp" method="post">
				
					<div style="width: 597px; height: 50px; display: flex; align-items: center; justify-content: center;">
								<b style="font-family :'Hahmlet', serif; font-size: 20px;">[회원 정보 수정]</b>
					</div>
				
					<div style="width: 300px; height: 70px; display: flex; justify-content: center; flex-direction: column;">						
							<b style="font-family :'Hahmlet', serif; font-size: 14px; ">
								아이디							
							</b>			
							<div style="display: flex; justify-content:center; width: 300px; height: 20px; border: 1px solid black;
							background-color: white; font-family :'Hahmlet', serif; font-size: 14px; ">
							  <%= vo.getId() %>
							</div>	
					</div>
						<div style="width: 300px; height: 60px;display: flex;justify-content: center; flex-direction: column;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">비밀번호</b>
								<input  type="password" name="pass" placeholder="8~12자리의 영대소문자와 숫자 조합"  size="20" style="padding: 5px;">
						</div>
						<div style="width: 300px; height: 50px;display: flex;justify-content: center; flex-direction: column;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">비밀번호 확인</b>
								<input  type="password" name="repass" placeholder="8~12자리의 영대소문자와 숫자 조합"  size="20" style="padding: 5px;">
						</div>
						<div style="width: 300px; height: 50px;display: flex;justify-content: center; flex-direction: column;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">이름</b>
								<div style="display: flex; justify-content:center; width: 300px; height: 20px; border: 1px solid black;
							background-color: white; font-family :'Hahmlet', serif; font-size: 14px; ">
							  <%= vo.getName() %>
							</div>	
						</div>
						<div style="width: 300px; height: 40px;display: flex;justify-content: space-around; align-items: center;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">전화번호</b>
								 <select name="phone1" style="padding: 5px;">
									<option value="02">02</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="042">042</option>
									<option value="010">010</option>
								</select>-
								<input type="text" name="phone2" size="7px" style="padding: 5px;">-
								<input type="text" name="phone3" size="7px" style="padding: 5px;">
						</div>
						<div style="width: 300px; height: 50px;display: flex;justify-content: center; flex-direction: column;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">이메일</b>
								<input type="text" name="email" placeholder="example@google.com" size="20" style="padding: 5px;">
						</div>
						<div style="width: 300px; height: 50px;display: flex;justify-content: center; flex-direction: column;">
								<b style="font-family :'Hahmlet', serif; font-size: 14px; margin-bottom: 5px;">생년월일</b>
								<div style="display: flex; justify-content:center; width: 300px; height: 20px; border: 1px solid black;
							background-color: white; font-family :'Hahmlet', serif; font-size: 14px; ">
							  <%= vo.getBirth() %>
							</div>	
						</div>
						
						<div style="width: 300px; height: 100px; display: flex; justify-content: center; flex-direction: column; ">
									
							<button type="button" onClick="inputCheck()" style="font-family :'Hahmlet', serif; font-size: 15px;">회원정보 수정</button>
        					<button type="reset" style="font-family :'Hahmlet', serif; font-size: 15px;">다시입력</button>
						</div>
					
				</form>
			</div>
			<!-- 
			<div align="center" style="width: 600px; height: 500px; border: 1px solid black;">
				 <form name="regForm" action="modifyProc.jsp" method="post">
   		 <div class="title">회원정보 수정</div>
   		 <hr>
   		 <div>  아이디   :    <%= vo.getId() %></div>
  		 
  		 <div>비밀번호   :    <input class="input-field" type="password" name="pass" placeholder="8~12자리의 영대소문자와 숫자 조합"></div>
  		 
  		 <div>비밀번호 확인    :    <input class="input-field" type="password" name="repass" placeholder="8~12자리의 영대소문자와 숫자 조합"></div>
  		 
  	  	 <div>이름    :    <span class="span-field"><%= vo.getName() %></span></div>
  		  
  		 <div>전화번호</div>
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
			
			 -->
		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%> 
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    
<%@page import="zoo_Event.ConnUtil" %>
<%
String loginID = (String)session.getAttribute("loginID");
int E_number = Integer.parseInt(request.getParameter("E_number"));
String pageNum = request.getParameter("pageNum");

	Zoo_EventDAO dbPro = Zoo_EventDAO.getinstance();	
	Zoo_EventVO event = dbPro.getEvent(E_number);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia EventUpdate</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="../js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'writeEvent' ).onclick = function() {
			if ( document.eventWrite.E_name.value.trim() == '' ) {
				alert( '이벤트 제목을 입력해주세요.' );
				document.eventWrite.E_name.focus();
				return false;
			}
			if ( document.eventWrite.E_content.value.trim() == '' ) {
				alert( '내용을 입력해주세요' );
				document.eventWrite.E_content.focus();
				return false;
			}
			if ( document.eventWrite.E_image.value.trim() == '' ) {
				alert( '이미지를 추가해주세요.' );
				document.eventWrite.E_image.focus();
				return false;
			}
			if ( document.eventWrite.E_startDate.value.trim() == '' ) {
				alert( '시작일을 선택해주세요.' );
				document.eventWrite.E_startDate.focus();
				return false;
			}
			if ( document.eventWrite.E_endDate.value.trim() == '' ) {
				alert( '종료일을 선택해주세요.' );
				document.eventWrite.E_endDate.focus();
				return false;
			}
			document.eventWrite.submit();
		}
	}
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
                  <li class="nav_li"><a href="event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->      
<section style="height: 800px;">
	<div class="section_bar" align="center" >
		이벤트 수정
	</div>
	
	<form action="eventupdateProc.jsp?E_number=<%=event.getE_number()%>&pageNum=<%=pageNum %>" enctype="multipart/form-data" method="post" name="eventWrite"
		onsubmit="return eventWriteSave()" style="margin-top: 50px;">
		
		<input type="hidden" name="E_number">
		
		<table width="600" border="1" cellpadding="0" cellspacing="0"
			align="center">

			<tr>
				<td align="center" colspan="2"><a href="event.jsp"> 이벤트목록 </a></td>
			</tr> 
			
			<tr>
				<td width="200" align="center">이벤트 제목</td>
				<td width="300" >
					<input type="text" size="50" maxlength="50" name="E_name" value="<%=event.getE_name() %>">
				</td>
			</tr>
			<tr>
				<td width="200" align="center">내용</td>
				<td width="300" >
					<textarea rows="13" cols="50" name="E_content"><%=event.getE_content() %></textarea>
				</td>
			</tr>
			
			<tr>
				<td width="200" align="center">이미지</td>
				<td width="300" >
					<input type="file" name="E_image" value="<%=event.getE_image() %>"/>
					
				</td>
			</tr>
		
			<tr>
			<td width="200" align="center">시작일</td>
				<td width="300" >
					<input class="input-field birth" type="date" name="E_startDate" placeholder="2022-01-01">
				</td>
			</tr>
			
			<tr>
			<td width="200" align="center">종료일</td>
				<td width="300" >
					<input class="input-field birth" type="date" name="E_endDate" placeholder="2022-12-31">
				</td>
			</tr>
			
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="이벤트수정" id="writeEvent">					
					<input type="reset" value="다시작성">
					<input type="button" value="목록" onClick="window.location='event.jsp'">					
				</td>							
			</tr>
			
			
		</table>
		
	</form>

	
</section>

<!--  Footer -->
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
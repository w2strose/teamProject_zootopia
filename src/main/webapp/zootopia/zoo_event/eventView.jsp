<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia Event</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="../js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function deleteCheck() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    	document.deleteform.submit();
		}else{   //취소
	    	return false;
		}
	}
</script>
</head>
<%
	String loginID = (String)session.getAttribute("loginID");
	int E_number = Integer.parseInt(request.getParameter("E_number"));
	String pageNum = request.getParameter("pageNum");

	try{
		Zoo_EventDAO dbPro = Zoo_EventDAO.getinstance();	
		Zoo_EventVO event = dbPro.getEvent(E_number);
		
%>

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
                 <li class="nav_li"><a href="../zoo_starComment/starComment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->      
<section style="height: 1000px;">
	<div class="section_bar" align="center">
		이벤트 상세
	</div>
	
	 <div class="contents_wrap">
                    
                    <p class="qs_title" style="margin-bottom: 0;">
                        <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/ev_title_img01.png" alt="" />
                        <span><%= event.getE_name() %></span>
                    </p>
                    <div class="qs_info_wrap" style="display: flex; align-items: center; justify-content: space-between; font-size: 15px;">
                  
                    	<div style="margin-left: 20px; font-size: 15px;">
                    		<img src="../img/dateicon.png">
                        		<span class="event_date"> <%= event.getE_startDate() %>~ <%= event.getE_endDate() %> </span>
                        </div>
                        <div class="qs_info" style="margin-right: 20px; font-size: 15px;">
                            <p><img src="../img/viewuser.png" />
                            <%= event.getE_readcount() %>
                            </p>                        
                        </div>
                    </div>
    </div>
    <div align="center" style="margin-top: 230px;">
	<img alt="" src="../img/<%= event.getE_image()%>" id="viewImage"><br><br><br><br>
	<div align="center" style="margin-top: 20px; display: flex; justify-content: center">
	
		<input type="button" value="목록" onclick="document.location.href='event.jsp'">
	<%
	if(session.getAttribute("loginID")==null || session.getAttribute("loginID").equals("") || session.getAttribute("loginID").equals(null)){
		%>
		
		<% } %>
	<% if(loginID.equals("GM")){ %>
			<input type="button" value="이벤트 수정하기" onclick="window.location='eventupdateFrom.jsp?E_number=<%=event.getE_number()%>&pageNum=<%=pageNum%>'">
			<form action="eventdeleteFrom.jsp?E_number=<%=event.getE_number()%>&pageNum=<%=pageNum%>" name="deleteform" method="post">
				<input type="button" value="이벤트 삭제하기" onclick="deleteCheck()">
			</form>
	<%}else{} %>	
		
		</div>
	</div>
	
	<%}catch(Exception e){} %>
	
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

	
	
	
	
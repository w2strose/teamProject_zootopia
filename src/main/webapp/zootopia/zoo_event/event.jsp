<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>    
<%@page import="zoo_Event.ConnUtil" %>

<%
	String loginID = (String)session.getAttribute("loginID");
	try{
	//request.setCharacterEncoding("utf-8");
	//response.setCharacterEncoding("text/html; charset=utf-8");
	//한페이지에 보여줄 목록 수 지정
	int pageSize = 5;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 현재 페이지 설정
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize +1;  
	int endRow = currentPage * pageSize; 
	
	int count = 0;
	int number = 0;
	List<Zoo_EventVO> eventList = null;
	
	
	Zoo_EventDAO dbPro = new Zoo_EventDAO();
	dbPro = Zoo_EventDAO.getinstance();
	
	count = dbPro.getEventCount();
	
	if(count > 0){
		eventList = dbPro.getEvents(startRow, endRow);
	}
	number = count - (currentPage-1) * pageSize;
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia Event</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
  <!-- Header -->
  <header id="header" class="full-header">
        <div id="header-wrap">
          <div class="container_header">
            <!-- Logo -->
            <div id="logo"> 
              <a href="../index.jsp"><img id="main__logo" src="../img/pomelogo.png" width="70px" height="70px"/></a>
              <div align="center">ZOOTOPIA</div>            
  
            </div>
            <!-- #logo end -->

            <!-- Primary Navigation
					============================================= -->
            <nav id="primary-menu">
              <ul class="nav_ul">
                  <li class="nav_li"><a href="../zoo_reservation/reservation.jsp">예약하기</a></li>
                  <li class="nav_li"><a href="../hotel.jsp">호텔</a></li>
                  <li class="nav_li"><a href="event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                  
              </ul>
            </nav>
            <!-- #primary-menu end -->
              <a href="../login.jsp"><img id="login__logo" src="../img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>
      
<!-- Section -->      
<section style="height: 800px;">
	<div class="section_bar" align="left" >
		Event Page
		이벤트 페이지
	</div>
	<div class="eventPage" align="center" style="margin: 50px; ">
	<b>이벤트 목록 (전체이벤트 : <%=count %>)</b>
	</div>
		<%if(count == 0){// 이벤트 없을경우 %>
			 <br><br>
			 <div align="center">
				<span>현재 진행중인 이벤트가 없습니다..</span>
			</div>
		<%}else{ // 글이 있을경우 %>
	
	<div class="events" style="display: flex; justify-content: center">
		<%for(int i = 0; i<eventList.size(); i++){ 
		Zoo_EventVO event = (Zoo_EventVO)eventList.get(i);
		%>
		
			<div align="center">		
				<span style="align-items:cetner; float:left; ;margin: 10px;">
					<a href="eventView.jsp?E_number=<%= event.getE_number()%>&pageNum=<%=currentPage%>">
			<img alt="" src="../img/<%= event.getE_image()%>" id="productImage"><br><br>
			이벤트 이름 : <%= event.getE_name() %><br><br>
			이벤트 내용 : <%= event.getE_content() %><br><br>
			이벤트 이미지 : <%= event.getE_image() %><br><br>
					</a>	
				</span>
			</div>
		
		<%} %>	
		</div>	
	<%} %>

<div class="numberPage" align="center" style="margin: 20px;" >
		<%
		if (count > 0) {
			int pageBlock = 5;

			int imsi = count % pageSize == 0 ? 0 : 1;

			int pageCount = count / pageSize + imsi;

			int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;

			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount) endPage = pageCount;

			if (startPage > pageBlock) {
		%>			
		<a href="event.jsp?pageNum=<%=startPage - pageBlock%>"> [이전page] </a>
		<%
		}		
		for (int i = startPage; i <= endPage; i++) {
		%>
		 <a href="event.jsp?pageNum=<%=i%>"> [<%=i%>]</a>
		<%}
		if (endPage < pageCount) {
		%>
		<a href="event.jsp?pageNum=<%=startPage + pageBlock%>"> [다음page] </a>
		<%
				}
			} 
		%>
		
	</div>	
	
	<%
	if(session.getAttribute("loginID")==null || session.getAttribute("loginID").equals("") || session.getAttribute("loginID").equals(null)){
		%>
		<input type="hidden" value="이벤트 등록하기" onclick="window.location='eventWriteFrom.jsp'">
		<% } %>
	<% if(loginID.equals("GM")){ %>
		<div align="center">
			<input type="button" value="이벤트 등록하기" onclick="window.location='eventWriteFrom.jsp'">
		</div>
	<%}else{} %>
	
</section>

<%}catch(Exception e){} %>

<!--  Footer -->
<footer style="height: 100px;">
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
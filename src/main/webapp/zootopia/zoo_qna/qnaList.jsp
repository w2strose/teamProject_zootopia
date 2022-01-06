<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*,zoo_qna.*" %>
<%

//한 페이지에 보여줄 목록 수 지정
int pageSize = 10;


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum = "1";
}
//현재 페이지
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize+1;
int endRow = currentPage*pageSize;

String searchWhat = request.getParameter("searchWhat");
String searchText = request.getParameter("searchText");


int count = 0;
int number = 0;

List<Zoo_qnaVO> qnaList = null;
Zoo_qnaDAO dao = new Zoo_qnaDAO();
count = dao.getboardCount();// 전체 글수
if(count>0) {
	qnaList = dao.getBoardList(startRow,endRow,searchWhat,searchText);
	
}
number = count -(currentPage-1)*pageSize;





%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html;">
<title>ZootopiaMain</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 호텔, 이벤트, 이용후기, 예약 -->
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
                  <li class="nav_li"><a href="../zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="qnaList.jsp">Q&A</a></li>   
                
              </ul>
            </nav>
            <!-- #primary-menu end -->
            <a href="../login.jsp"><img id="login__logo" src="../img/login2.png" width="30px" height="30px"/></a>
          </div>
        </div>
      </header>

<section>
	<div class="section_bar">
		Q&A Section
	
	</div>
	
	<div align="center"><b>글목록(전체 글:<%=count %>)</b>
	
<%
	if(count==0){ // 저장된 글이 없을 경우
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr align="center">
		<td>Q&A에 저장된 글이 없습니다.</td>
	</tr>
</table>
<%}else{ // 글이 있을 경우%>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" >
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="100">작성자</td>
		<!-- <td align="center" width="150">작성일</td> -->
	
	</tr>
	<%
	for(int i =0;i<qnaList.size();i++){
		Zoo_qnaVO article = (Zoo_qnaVO)qnaList.get(i);
	%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td width="250">
		<%
		//	int wid = 0;
		//	if(article.getDepth()>0){
		//		wid = 5*(article.getDepth());
		%>	
			<%-- <img src="../img/level.gif" width="<%=wid%>"height="16">
			<img src="../img/re.gif"> --%>
		<%//}else{%>
		<%-- 	<img src="../img/level.gif" width="<%=wid%>"height="16"> --%>
		<%//} %>
		<a href="getqna.jsp?num=<%=article.getB_number()%>&pageNum=<%=currentPage%>">
			<%try{if(!article.getB_answer().equals(null)){ %>
			(답변완료)
			<%} }catch(Exception e){}%>
			<%=article.getB_subject()%></a>
			<%-- <%if(article.getReadcount()>=20){ %>
			<img alt="" src="../img/hot.gif" border="0" height="16">
			<%} %></td> --%>
		<td align="center" width="100"><%=article.getId()%></td>
		<%-- <td align="center" width="150"><%=sdf.format(article.getRegdate()) %></td> --%>
	
	</tr>
	 <%} %> 	
</table>
 <%} %> 
 
<%
if(count>0){
	int pageBlock = 5;
	int imsi = count % pageSize == 0 ? 0 : 1;
	int pageCount = count/pageSize + imsi;
	int startPage = (int)((currentPage -1)/pageBlock)*pageBlock+1; 
	int endPage = startPage + pageBlock-1;
	
	if(endPage > pageCount) endPage = pageCount;
	if(startPage > pageBlock) {
		
%>
<a href="qnaList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%} 
	 for(int i = startPage; i<=endPage; i++){
	 if(searchText!=null){%>
	 <a href="qnaList.jsp?searchWhat=<%=searchWhat%>&searchText=<%=searchText%>&pageNum=<%=i%>">[<%=i %>]</a>
	 
	<%	 
	 }else{
	%>
<a href="qnaList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
<%}
}
	if(endPage < pageCount){
		 
	 %>
<a href="qnaList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
	
	<%}
	} %>
	<table width="700">
		<tr>
			<td align="right" >
			<input type="button" value="글쓰기" onclick="window.location='insertQna.jsp'"> 
			</td>
		</tr>
	</table>
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
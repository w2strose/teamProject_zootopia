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
<title>ZootopiaQnA</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="../js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
                  <li class="nav_li"><a href="../zoo_event/event.jsp">이벤트</a></li>
                 <li class="nav_li"><a href="comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->  
<section>
	<div class="section_bar" align="center">
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
		<a href="getQna.jsp?num=<%=article.getB_number()%>&pageNum=<%=currentPage%>">
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
<!-- footer -->
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
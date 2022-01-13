<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*,zoo_qna.*" %>
<%

//한 페이지에 보여줄 목록 수 지정
int pageSize = 10;

String loginID = (String)session.getAttribute("loginID");
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
count = dao.searchCount(loginID);// 전체 글수
if(count>0) {
	qnaList = dao.searchList(startRow,endRow,loginID);
	
}
number = count -(currentPage-1)*pageSize;





%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia QnA</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="../js/script.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@500&family=Single+Day&family=Staatliches&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  display: flex;
  justify-content: center;
  line-height: 1;
  margin: 10px 10px;
   font-family :'Hahmlet', serif;
}
table.type11 th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
   font-family :'Hahmlet', serif;
   font-size : 15px;
  background: orange;
}
table.type11 td {
  padding: 10px;
   font-family :'Hahmlet', serif;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
  font-size: 10pt;
}
</style>
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
                 <li class="nav_li"><a href="../comment.jsp">이용후기</a></li>
                 <li class="nav_li"><a href="../zoo_qna/qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->  
<section>
	<div class="section_bar" align="center">
		Q&A 
	
	</div>
	
	<div align="center" style="margin-top: 70px;"><br>
	
<%
	if(count==0){ // 저장된 글이 없을 경우
%>
<table class="tpye11">
	<tr align="center">
		<td>Q&A에 저장된 글이 없습니다.</td>
	</tr>
</table>
<%}else{ // 글이 있을 경우%>
<table  align="center" class="type11">
	<tr height="30" >
		<th align="center" width="50">번호</th>
		<th align="center" width="400">제목</th>
		<th align="center" width="150">작성자</th>
		<!-- <td align="center" width="150">작성일</td> -->
	
	</tr>
	<%
	for(int i =0;i<qnaList.size();i++){
		Zoo_qnaVO article = (Zoo_qnaVO)qnaList.get(i);
	%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td width="400">
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
		<td align="center" width="150"><%=article.getId()%></td>
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
<a href="qnaList.jsp?pageNum=<%=startPage-pageBlock%>" style="font-family:'Hahmlet';font-size: 13px;">[이전]</a>
	<%} 
	 for(int i = startPage; i<=endPage; i++){
	 if(searchText!=null){%>
	 <a href="qnaList.jsp?searchWhat=<%=searchWhat%>&searchText=<%=searchText%>&pageNum=<%=i%>" style="font-family:'Hahmlet';font-size: 13px;">[<%=i %>]</a>
	 
	<%	 
	 }else{
	%>
<a href="qnaList.jsp?pageNum=<%=i%>" style="font-family:'Hahmlet';font-size: 13px;">[<%=i %>]</a>
<%}
}
	if(endPage < pageCount){
		 
	 %>
<a href="qnaList.jsp?pageNum=<%=startPage+pageBlock%>" style="font-family:'Hahmlet';font-size: 13px;">[다음]</a>
	
	<%}
	} %>
	<table width="650">
		<tr>
			<td align="left" >
			<%try{if(!loginID.equals(null)){ %>
			<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="내가 작성한 글 보기" onclick="window.location='searchList.jsp'"> 
			<%} }catch(Exception e){}%>
			</td>
			<td align="right" >
			<%try{if(!loginID.equals(null)){ %>
			<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="글쓰기" onclick="window.location='insertQna.jsp'"> 
			<%} }catch(Exception e){}%>
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
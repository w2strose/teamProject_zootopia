<%@page import="zoo_qna.Zoo_qnaVO"%>
<%@page import="zoo_qna.Zoo_qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginID = (String)session.getAttribute("loginID");
	
	int num = Integer.parseInt(request.getParameter("num")); 
	String pageNum = request.getParameter("pageNum");

	Zoo_qnaDAO dao = new Zoo_qnaDAO();
	Zoo_qnaVO board = dao.getBoard(num);



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
table.type12 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  display: flex;
  justify-content: center;
  align-content : right;
    line-height: 1;
  margin: 10px 10px;
   font-family :'Hahmlet', serif;
}
table.type12 td {
  padding: none;
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
                 <li class="nav_li"><a href="qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->  
<section>
	<div class="section_bar" align="center">
		Q&A Section
	
	</div>
	
	<div align="center" style="margin-top: 70px;"><br>
	<form action="">
		<table align="center" class="type11">	
			<tr height="30">
				<th align="center" width="125" >글 번호</th>
				<td align="center"><%=board.getB_number()%></td>
				
				<%-- <td align="center" width="125" >조회수</td>
				<td align="center"><%=article.getReadcount() %></td> --%>
			</tr>
			<tr height="30">
				<th align="center" width="125" >작성자</th>
				<td align="center"><%=board.getId()%></td>
				
				<%-- <td align="center" width="125" >작성일</td>
				<td align="center"><%=sdf.format(article.getRegdate()) %></td> --%>
			</tr>
			<tr height="30">
				<th align="center" width="125" >글 제목</th>
				<td align="center" colspan="3"><%=board.getB_subject()%></td>
			
			</tr>
			<tr height="30">
				<th align="center" width="125" >글 내용</th>
				<td align="left" width="375" colspan="3"><%=board.getB_content()%></td>
			</tr>
			<tr height="30">
				<td colspan="4"  align="right">
				<%try{ if(loginID.equals(board.getId())){ %>
				<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="글수정" onclick="document.location.href='updateQna.jsp?num=<%=board.getB_number()%>&pageNum=<%=pageNum%>'">
				&nbsp;&nbsp;
				<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="글삭제" onclick="document.location.href='deleteQna_proc.jsp?num=<%=board.getB_number()%>&pageNum=<%=pageNum%>'">
				<%}}catch(Exception e){} %> 
				&nbsp;&nbsp;
				<%-- <input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'"> 
				&nbsp;&nbsp;&nbsp;&nbsp; --%>
				<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="글목록" onclick="document.location.href='qnaList.jsp?pageNum=<%=pageNum %>'">
				</td>
			
			</tr>
			
		</table>
		<%-- <%}catch(Exception e){} %> --%>

	</form>
	<%try{ if(loginID.equals("GM")||loginID.equals(board.getId())){ %>
	
	
	<form action="">
		<table align="center" class="type11">	
			<tr height="30">
				<th align="center" width="125" >답변글</th>
				<td align="left" width="375" colspan="3">
				<%if(board.getB_answer()==null){ %>			
				답변이 없습니다.
				<%}else{ %>
				<%=board.getB_answer()%>
				<%} %>
				</td>
			</tr>
		</table>	
		<table width="522" border="0" cellpadding="0" cellspacing="0"  align="center" >	
			<tr height="30">
				<td colspan="4" align="right">
					<%try{ if(loginID.equals("GM")){ %>
					<input type="button" style="font-family:'Hahmlet';font-size: 13px;" value="답변달기" onclick="document.location.href='replyQna.jsp?num=<%=board.getB_number()%>&pageNum=<%=pageNum%>'">
					<%}}catch(Exception e){} %>
				</td>
			</tr>
		</table>
	</form>
	<%}}catch(Exception e){} %>
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
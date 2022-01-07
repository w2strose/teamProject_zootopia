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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html;">
<title>Zootopia getQnA</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript">
function check() {

	if(document.reply.B_answer.value==""){
		alert("답변을 입력하세요.");
		document.reply.B_answer.focus();
		return false;
	}
}

</script>
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
                 <li class="nav_li"><a href="qnaList.jsp">Q&A</a></li>                     
              </ul>
            </nav>
    </div> 
      
<!-- Section -->  
<section>
	<div class="section_bar" align="center">
		Q&A Section
	
	</div>
	
	<div align="center"><b>질문에 답변달기</b><br><br>
	<form action="">
		<table width="500" border="1" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30">
				<td align="center" width="125" >글 번호</td>
				<td align="center"><%=board.getB_number()%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" >작성자</td>
				<td align="center"><%=board.getId()%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" >글 제목</td>
				<td align="center" colspan="3"><%=board.getB_subject()%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" >글 내용</td>
				<td align="left" width="375" colspan="3"><pre><%=board.getB_content()%></pre></td>
			</tr>
			<tr height="30">
				<td colspan="4"  align="right">
				<input type="button" value="글목록" onclick="document.location.href='qnaList.jsp?pageNum=<%=pageNum %>'"> 
				</td>
			</tr>
			
		</table>
		<%-- <%}catch(Exception e){} %> --%>

	</form>
	
	<form action="replyQna_proc.jsp" name="reply">
		<table width="500" border="1" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30">
				<td align="center" width="125" >답변글</td>
				<td align="left" width="375" colspan="3">
				<textarea rows="10" cols="50" name="B_answer"><%=board.getB_answer() %></textarea>
				</td>
			</tr>
		</table>	
		<table width="500" border="0" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30" >
				<td colspan="4" align="right">
					<input type="hidden" name="num" value="<%=board.getB_number()%>">
					<input type="submit" value="답변달기" onclick="return check()">
				</td>
			</tr>
		</table>
	</form>
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
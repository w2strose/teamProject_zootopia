<%@page import="zoo_qna.Zoo_qnaVO"%>
<%@page import="zoo_qna.Zoo_qnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginID = (String)session.getAttribute("loginID");

	Zoo_qnaDAO dao = new Zoo_qnaDAO();



%>

<%-- 
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
	
	<div align="center"><b>질문 올리기</b><br><br>
	<form action="">
		<table width="500" border="1" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30">
				<td align="center" width="125" >작성자</td>
				<td align="center"><%=loginID%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" >글 제목</td>
				<td align="center" colspan="3"><input type="text" name="B_subject"> </td>
			
			</tr>
			<tr height="30">
				<td align="center" width="125" >글 내용</td>
				<td align="left" width="375" colspan="3"><textarea rows="10" cols="40" name="B_content"></textarea> </td>
			</tr>
			<tr height="30">
				<td colspan="4"  align="right">
				<input type="button" value="질문 작성" onclick="document.location.href='updateForm.jsp?num=<%=board.getB_number()%>&pageNum=<%=pageNum%>'"> 
				<input type="button" value="글목록" onclick="document.location.href='qnaList.jsp?'"> 
				</td>
			
			</tr>
			
		</table>
		<%}catch(Exception e){} %>

	</form>
	<%try{ if(loginID.equals("GM")||loginID.equals(board.getId())){ %>
	
	
	<form action="">
		<table width="500" border="1" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30">
				<td align="center" width="125" >답변글</td>
				<td align="left" width="375" colspan="3"><%=board.getB_answer()%></td>
			</tr>
		</table>	
		<table width="500" border="0" cellpadding="0" cellspacing="0" align="center" >	
			<tr height="30" >
				<td colspan="4" align="right">
					<%try{ if(loginID.equals("GM")){ %>
					<input type="button" value="답변달기" onclick="document.location.href='updateForm.jsp?num=<%=board.getB_number()%>&pageNum=<%=pageNum%>'">
					<%}}catch(Exception e){} %>
				</td>
			</tr>
		</table>
	</form>
	<%}}catch(Exception e){} %>
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
</footer> --%>

</body>
</html>
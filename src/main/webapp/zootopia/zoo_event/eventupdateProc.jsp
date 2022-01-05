<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="zoo_Event.Zoo_EventDAO"%>    
<%@page import="zoo_Event.Zoo_EventVO"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
      
<% 
int E_number = Integer.parseInt(request.getParameter("E_number"));
String pageNum = request.getParameter("pageNum");

String realFolder = "";
String saveFolder = "/zootopia/img";
int maxFileSize = 1024 * 1024 * 50;
String encType = "utf-8";

ServletContext context = request.getServletContext();
realFolder = context.getRealPath(saveFolder);
System.out.println("============ uploadFilePath = " + realFolder);

MultipartRequest multi 
	= new MultipartRequest(request, realFolder, maxFileSize, encType, new DefaultFileRenamePolicy() ); 

String E_name = multi.getParameter("E_name"); 
String E_content = multi.getParameter("E_content");
String E_image =  multi.getFilesystemName("E_image");
String E_startDate = multi.getParameter("E_startDate");
String E_endDate = multi.getParameter("E_endDate");

File file = multi.getFile( "E_image" );
long filesize = 0;
if ( file != null ) {
	filesize = file.length();
}
	
	Zoo_EventVO vo = new Zoo_EventVO();
	Zoo_EventDAO dao = new Zoo_EventDAO();
	vo.setE_number(E_number);
	vo.setE_name(E_name);
	vo.setE_content(E_content);
	vo.setE_image(E_image);
	vo.setE_startDate(E_startDate);
	vo.setE_endDate(E_endDate);
	int flag = dao.updateEvent(vo);
    
	 out.println( " <script type='text/javascript'> " );
	if( flag == 0 ) {
		out.println( " alert('이벤트 수정에 성공했습니다.'); " );
		out.println( " location.href='event.jsp;'" );
	} else {
		out.println( " alert('이벤트 수정에 실패했습니다.'); " );
		out.println( " history.back(); " );
	}
	out.println( " </script> " ); 
	

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 보기</title>
</head>
<%-- inputForm.jsp --%>
<body>
 <center>
   <h3>공지사항 보기</h3>
   <hr>
   [<a href="control.do">게시물 목록으로</a>]<br><br>
   <form action="control.do?action=insert" method="post">
     <table border="1" cellpadding="5">
       <tr>
         <td bgcolor="#99ccff">제목</td>
         <td>
           <input type="text" name="subject">
         </td>
       </tr>
       <tr>
         <td bgcolor="#99ccff">작성자</td>
         <td>
           <input type="text" name="id">
         </td>
       </tr>
       <tr>
         <td colspan="2">
           <textarea rows="5" cols="30" name="contents"></textarea>
         </td>         
       </tr>
 
     </table>
   </form>
 </center>

</body>
</html>
          </div><!--/row-->
		</div>
	</div>
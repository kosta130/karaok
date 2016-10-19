<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>		
   <h3>자유게시판>글쓰기</h3>
<center>
   <hr>
   
   <form  action="crud.ok?action=insert" method="post" name="write">
   	<input type="hidden" name="num" value="${num }">
      <table border="1" width="300" cellpadding="2" cellspacing="3">
      <tr>
         <td width="100" bgcolor="skyblue">작성자
         </td>
         <td>
         <input type="text" name="id" value="${nickname }">
         </td>
    </tr>
      <tr>
         <td width="100" bgcolor="skyblue">제목</td>
         <td>
         <input type="text" name="subject" value="${subject }" >
         </td>
    </tr>
    <tr>
    <td colspan=2 >
    <textarea rows="5" cols="40" name="contents">${contents }</textarea>
    </td>
    </tr>
      <tr>
         <td colspan="4">
         <input type="submit" value="입력" />
         <input type="reset" value="취소" onclick="location.href='free_list.ok'" />
         </td>
      </tr>
      </table>
   </form>
</center>
</body>
</html>
			</div>
		</div>
	</div>
           
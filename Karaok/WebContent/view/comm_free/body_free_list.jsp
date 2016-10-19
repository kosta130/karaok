<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<center>
<h3>자유게시판</h3>
<hr>

 <table border="1" cellpadding=5 cellspacing=3 >
 <tr  bgcolor="skyblue" >
	 <td>번호</td>
	 <td>작성자</td>
	 <td>제목</td>
	 <td>작성일</td>
 </tr>
    <c:forEach items="${list }" var="dto">
  
       <tr>
         <td>${dto.num }</td>
         <td>${dto.nickname}</td>
         <td><a href="crud.ok?action=upform&id=${dto.nickname }"> ${dto.subject } </a></td>
         <td>${dto.ndate } </td>
       </tr>
	</c:forEach>
 </table>
 <input type="button" value="글쓰기" onclick="location.href='free_write.ok'" />
   <br>
      <c:if test="${page==1}">이전</c:if>
      <c:if test="${page>1}">
         <a href="free_list.ok?action=list&page=${ page-1 }">이전</a>      
      </c:if>
         
      <c:if test="${page==totalPage }">다음</c:if>
      <c:if test="${page<totalPage }" >
         <a href="free_list.ok?action=list&page=${ page+1 }">다음</a>      
      </c:if>
          <br><br>
      <c:forEach begin="1" end="${totalPage }" var="i" >
    [<a href="free_list.ok?action=list&page=${ i }">${i }</a>]
      </c:forEach> 
 </center>
 </body>
 </html>
			</div>
		</div>
	</div>
           
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script type="text/javascript">
	function sessionCheck(currentNickName){
		if(currentNickName=='관리자'){
			document.getElementById('formAction').submit();
		}else{
			alert('글쓰기 권한이 없습니다.');
			return;
		}
	}
</script>
	<style>
	
	   th.no{
	   text-align: right;
	   }
	   
	   .title {
	   text-align: center;
	   }
	</style>
	
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
			<div class="box-body">
            <div align="center">
            	<hr>
            	<table id="example2" class="table table-bordered table-striped">
            	 <thread>
            	 <tr>
            	 	<th style="background-color: #FF5E00" width="10%" class="title"><font color="white">번호</font></th>
            	 	<th style="background-color: #FF5E00" width="50%" class="title"><font color="white">제목</font></th>
            	 	<th style="background-color: #FF5E00" width="15%" class="title"><font color="white">작성자</font></th>
            	 	<th style="background-color: #FF5E00" width="15%" class="title"><font color="white">작성일</font></th>
            	 	<th style="background-color: #FF5E00" width="10%" class="title"><font color="white">조회수</font></th>
            	 	
            	 </tr>
            	 </thread>
            	 <tbody>
             	<c:forEach items="${list }" var="note">
            		<tr>
            			<td align="center">${note.num }</td>
            			<td><a href="note.ok?action=view&num=${note.num}">${note.subject }</td>
            			<td align="center">${note.nickname }</td>
            			<td align="center">${note.ndate }</td>
            			<td align="center">${note.hits }</td>
            		</tr>
            	</c:forEach>
            	</tbody>
            	</table>
            </div>
            <br>
            <div>
			<div align="right">
			<form action="/Karaok/note_input.ok" id="formAction">
				<input class="btn btn-primary" type="button" value="글등록" onclick="sessionCheck('${currentNickName}')">
			</form>
			</div>
            <center>
            <c:if test="${page ==1 }">이전</c:if>
            <c:if test="${page > 1 }">
            	<a href = "note_list.ok?page=${page-1 }">이전</a>
            </c:if>
           	<c:forEach begin="1" end="${totalPage }" var="i">
           		[<a href="note_list.ok?page=${i }">${i }</a>]
           	</c:forEach>  
            <c:if test="${page == totalPage }">다음</c:if> 
            <c:if test="${page < totalPage }"> 
            	<a href="note_list.ok?page=${ page+1 }">다음</a>       
           	</c:if>
           	</center>
            </div>
            </div>
          	</div><!--/row-->
		</div>
	</div>
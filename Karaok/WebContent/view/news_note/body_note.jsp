<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
			<div align="right">
				<button class="btn btn-primary" onclick="location.href='note_input.ok'">글 등록</button>
			</div>
            <div align="center">
            	<h3>개발자 노트</h3>
            	<hr>
            	<table id="example2" class="table table-bordered table-striped">
            	 <thread>
            	 <tr>
            	 	<th width="10%" class="title">번호</th>
            	 	<th width="60%" class="title">제목</th>
            	 	<th width="10%" class="title">작성자</th>
            	 	<th width="20%" class="title">작성일</th>
            	 </tr>
            	 </thread>
            	 <tbody>
             	<c:forEach items="${list }" var="note">
            		<tr>
            			<td align="center">${note.num }</td>
            			<td><a href="note.ok?action=view&num=${note.num}">${note.subject }</td>
            			<td align="center">${note.nickname }</td>
            			<td align="center">${note.ndate }</td>
            		</tr>
            	</c:forEach>
            	</tbody>
            	</table>
            </div>
            <br>
            <div>
            <center>
            <c:if test="${page ==1 }">이전</c:if>
            <c:if test="${page > 1 }">
            	<a href = "note_list.ok?page=${page-1 }">이전</a>
            </c:if>
            <c:if test="${page == totalPage }">다음</c:if> 
            <c:if test="${page < totalPage }"> 
            	<a href="note_list.ok?page=${ page+1 }">다음</a>       
           	</c:if>
           	<br><br>
           	<c:forEach begin="1" end="${totalPage }" var="i">
           		[<a href="note_list.ok?page=${i }">${i }</a>]
           	</c:forEach>  
           	</center>   
            </div>
            </div>
          	</div><!--/row-->
		</div>
	</div>
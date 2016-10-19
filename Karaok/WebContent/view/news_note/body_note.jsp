<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
            <center>
            	<h3>개발자 노트</h3>
            	<hr>
            	<table id="example2" class="table table-bordered table-striped" align="center">
            	 <thread>
            	 <tr>
            	 	<th width="10%" class="title">번호</th>
            	 	<th width="60%" class="title">제목</th>
            	 	<th width="10%" class="title">작성자</th>
            	 	<th width="20%" class="title">작성일</th>
            	 </tr>
            	 </thread>
            	 <tbody>
            	 <tr>
            	 <td>1</td>
            	 <td>1</td>
            	 <td>1</td>
            	 <td>1</td>
            	 </tr>
            	<c:forEach items="${list }" var="note">
            		<tr>
            			<td>${note.num }</td>
            			<td>${note.id }</td>
            			<td>${note.subject }</td>
            			<td>${note.ndate }</td>
            		</tr>
            	</c:forEach>
            	</tbody>
            	</table>
            </center>
            <right>
            	<button onClick="location.href=''"></button>
            </right>
            </div>
          	</div><!--/row-->
		</div>
	</div>
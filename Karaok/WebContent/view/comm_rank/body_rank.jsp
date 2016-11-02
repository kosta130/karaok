<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
      
<script type="text/javascript">
 function search(){
	var keyword=$('input[name=keyword]').val();
	if(keyword==''){
		alert('검색할 단어를 입력해주세요.');
		return false;
	}
	location.href="./rank.ok?keyword="+keyword;
 }
 </script>
     
	<style>
	
	table {
    border-collapse: collapse;
    width: 100%;
	}
	
	th, td {
	    text-align: center;
	    padding: 8px;
	}
	
	tr:nth-child(even){background-color: #f2f2f2}
	
	th {
	    background-color: #ff5555;
	    color: white;
	}
	</style>
	
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
            <div class="box-body">
            <form name="frm">
            <div align="left">
            	<h3>랭킹</h3>
            	<div align="right">
            	<input id="searchId" name="keyword" type="text" class="form-contrl" placeholder="닉네임를 검색하세요..">
            	<button id="add-searchId" type="button" class="btn btn-primary btn-flat" onclick="search()">찾기</button>            	
            	</div>
            	<hr>
            	<table id="example2" class="table table-bordered table-striped">
            	 <thread>
            	 <tr>
            	 	<th width="10%" class="title">등수</th>
            	 	<th width="60%" class="title">닉네임</th>
            	 	<th width="30%" class="title">점수</th>
            	 </tr>
            	 </thread>
            	 <tbody>
            	 <c:forEach items="${list }" var="rank">
            		<tr>
            			<td align="center" style="font-weight:900; color:blue">${rank.rank }</font></td>
            			<td align="center">${rank.nickname }</td>
            			<td align="center">${rank.score }</td>
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
            	<a href = "rank.ok?page=${page-1 }">이전</a>
            </c:if>
           	<c:forEach begin="1" end="${totalPage }" var="i">
           		[<a href="rank.ok?page=${i }">${i }</a>]
           	</c:forEach>  
            
            <c:if test="${page == totalPage }">다음</c:if> 
            <c:if test="${page < totalPage }"> 
            	<a href="rank.ok?page=${ page+1 }">다음</a>       
           	</c:if>
           	</center>
          
            </div>
            </form>
            </div>
          </div><!--/row-->
		</div>
	</div>
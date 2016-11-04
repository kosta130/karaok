<%@page import="com.karaok.notice.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
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
		
              <table id="example1" class="table table-bordered table-striped"align="center">
                <thead>
                <tr>
                  <th style= "background-color: #1DDB16;" "width: 7%" class="title" >글번호</th>
                  <th style= "background-color: #1DDB16;" "width: *%" class="title" >제목</th>
                  <th style= "background-color: #1DDB16;" "width: 10%" class="title">작성자</th>
                  <th style= "background-color: #1DDB16;" "width: 20%" class="title">날짜</th>
                  <th style= "background-color: #1DDB16;" "width: 20%" class="title">조회수</th>
                </tr>
                </thead>
                <tbody>
<c:forEach items="${list }" var="v">
       <tr>
         <td align="center">${v.num }</td>
         <td><a href="/Karaok/notice.ok?action=select&num=${v.num }">${v.subject }</a></td>
         <td align="center">${v.nickname }</td>
         <td align="center">${v.ndate }</td>
         <td align="center">${v.hits }</td>
       </tr>
 </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <form action="./notice3.ok" id="formAction">
             <div class="box-footer" align="center"  style="background:#000000;background:rgba(0,0,0,0);">
             <div align="right">
                <input class="btn btn-primary" type="button" value="글쓰기" onclick="sessionCheck('${currentNickName}')">
                </div>
  <br> 
<c:if test="${page == 1}">이전</c:if> 
<c:if test="${page > 1}"> 
<a href="notice.ok?action=list&page=${ page-1 }">이전</a>       
</c:if> 
 <c:forEach begin="1" end="${totalPage }" var="i"> 
[<a href="notice.ok?action=list&page=${i }">${i }</a>] 
</c:forEach>     
         
<c:if test="${page == totalPage }">다음</c:if> 
<c:if test="${page < totalPage }"> 
 <a href="notice.ok?action=list&page=${ page+1 }">다음</a>       
</c:if> 
                
              </div>
              </form>
              
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
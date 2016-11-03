<%@page import="com.karaok.notice.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		if(currentNickName==''){
			alert('글쓰기 권한이 없습니다.');
			return;
		}else{
			document.getElementById('formAction').submit();
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
<h1>1:1문의내역
	<c:forEach begin="1" end="120">&nbsp</c:forEach>
	<small><button class="btn btn-danger" onclick="location.href='./qna3.ok'">1:1문의하기</button></small>
</h1>
<hr>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="width: 7%" class="title">글번호</th>
                  <th style="width: *%" class="title" >제목</th>
                  <th style="width: 10%" class="title">작성자</th>
                  <th style="width: 20%" class="title">날짜</th>
                  <th style="width: 10%" class="title">진행현황</th>
                  <th style="width: 20%" class="title">조회수</th>
                </tr>
                </thead>
                <tbody>
<c:forEach items="${qlist }" var="v">
       <tr>
         <td align="center">${v.num }</td>
         <td><a href="/Karaok/qna.ok?action=select&num=${v.num }">${v.subject }</a><font color="red">
         <c:if test="${v.reply_count!=0}">
         [${v.reply_count}]</font>
        	</c:if>
         </td>
         <td align="center">${v.nickname }</td>
         <td align="center">${v.ndate }</td>
         <td align="center">
         <c:choose>
         <c:when test="${v.reply_count>0 }">
         <span class="label label-primary">답변완료</span>
         </c:when>
         <c:otherwise>
          <span class="label label-default">답변대기</span>
         </c:otherwise>
         </c:choose>

         
         </td>
         <td align="center">${v.hits }</td>
       </tr>
       </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <form action="./qna3.ok" id="formAction">
             <div class="box-footer" align="center">
             
                
  <br> 
<c:if test="${page == 1}">이전</c:if> 
<c:if test="${page > 1}"> 
<a href="qna.ok?action=qlist&page=${ page-1 }">이전</a>       
</c:if> 
         
<c:if test="${page == totalPage }">다음</c:if> 
<c:if test="${page < totalPage }"> 
 <a href="qna.ok?action=qlist&page=${ page+1 }">다음</a>       
</c:if> 
<br><br> 
 <c:forEach begin="1" end="${totalPage }" var="i"> 
[<a href="qna.ok?action=qlist&page=${i }">${i }</a>] 
</c:forEach>     
                
              </div>
              </form>
              
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
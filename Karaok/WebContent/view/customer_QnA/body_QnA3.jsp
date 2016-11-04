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
                <tr style="background-color: #CB6CFF;">
                  <th style="width: 7%" class="title"><font color="white">글번호</font></th>
                  <th style="width: *%" class="title" ><font color="white">제목</font></th>
                  <th style="width: 10%" class="title"><font color="white">작성자</font></th>
                  <th style="width: 20%" class="title"><font color="white">날짜</font></th>
                  <th style="width: 10%" class="title"><font color="white">진행현황</font></th>
                  <th style="width: 20%" class="title"><font color="white">조회수</font></th>
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
             <div class="box-footer" align="center"  style="background:#000000;background:rgba(0,0,0,0);">
             
                
  <br> 
<nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	
    <li>
    	<c:forEach  begin="1"  end="${pageCount }" var="i">
    	<a href="rank.ok?page=${i}">${i }</a>
    	</c:forEach>
    </li>
    

    
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

	<div align="center">
	<input class="btn btn-info" type="button" value="처음으로" onclick="location.href='./rank.ok?page=1'">
	</div>


</div>
                
              </div>
              </form>
              
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
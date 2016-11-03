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
		if(currentNickName==''){
			alert('권한이 없습니다.');
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
<form action="./free_write.ok" id="formAction">

</form>
<h1><span class="glyphicon glyphicon-time" style="color:black">자유게시판</span></h1><hr>
<br>

              <table id="example1" class="table table-bordered table-striped" align="center">
                <thead>
                <tr>
                  <th style="width: 7%" class="title">글번호</th>
                  <th style="width: *%" class="title" >제목</th>
                  <th style="width: 10%" class="title">작성자</th>
                  <th style="width: 10%" class="title">조회수</th>
                  <th style="width: 20%" class="title">날짜</th>
                </tr>
                </thead>
                <tbody>
		  <c:forEach items="${list }" var="dto">
                   <tr>
                  <td class="title">${dto.num }</td>
                  <td><a href="crud.ok?action=view&num=${dto.num }">${dto.subject }</a></td>
                  <td class="title">${dto.nickname}</td>
                  <td class="title">${dto.hits}</td>
                  <td class="title">${dto.ndate }</td>
		  </c:forEach>
					     
                </tr>
                </tfoot>
              </table>
            <br> 
            <div align="right">
				<input type="button" value="글쓰기"  onclick="sessionCheck('${currentNickName}')">
				<%-- <button type="button" class="btn btn-primary" onclick="sessionCheck('${currentNickName}')">글쓰기</button> --%>
			</div>
         	<center>
			<c:if test="${page == 1}">이전</c:if> 
			<c:if test="${page > 1}"> 
			<a href="free_list.ok?page=${ page-1 }">이전</a>       
			</c:if> 
			 <c:forEach begin="1" end="${totalPage }" var="i"> 
			[<a href="free_list.ok?page=${i }">${i }</a>] 
			</c:forEach> 
			         
			<c:if test="${page == totalPage }">다음</c:if> 
			<c:if test="${page < totalPage }"> 
			 <a href="free_list.ok?page=${ page+1 }">다음</a>       
			</c:if> 
			</center>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  
			    
          </div><!--/row-->
		</div>
	</div>
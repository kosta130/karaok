<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
<form action="./screen_create.ok" id="formAction">
<div align="right" style="background-color: beige">
<input class="btn btn-primary" type="button" value="글쓰기"  onclick="sessionCheck('${currentNickName}')">
</div>
</form>
<br>		
	<div class="tab-content" style="background-color: beige">
	

			<c:forEach items="${list }" var="dto">
				<div class="container" style="background-color: beige">
					<div class="row" style="outline-color: blue;">
								
						<div i class="col-lg-7 col-md-7" style="background-color: beige">
						<a href="screen.ok?action=view&num=${dto.num }">
							 <img width="600" height="250" src="./img_soyoung/${dto.fileName}" alt="">
						</a>
						</div>
						
						<div class="col-lg-5 col-md-4" align="left" style="background-color: beige">
							
						
							<h1>${dto.subject }</h1> <hr>
							<h4>작성자: ${dto.nickname }</h4><hr>
							<h4>조회수: ${dto.seek }</h4><hr>
							<h4>날짜: ${dto.ndate }</h4> 
							
						</div>
						
					</div>

					<hr>
				</div>
			</c:forEach>
			 <br> 
         	<center>
			<c:if test="${page == 1}">이전</c:if> 
			<c:if test="${page > 1}"> 
			<a href="screen_list.ok?page=${ page-1 }">이전</a>       
			</c:if> 
			         
			<c:if test="${page == totalPage }">다음</c:if> 
			<c:if test="${page < totalPage }"> 
			 <a href="screen_list.ok?page=${ page+1 }">다음</a>       
			</c:if> 
			<br><br> 
			 <c:forEach begin="1" end="${totalPage }" var="i"> 
			[<a href="screen_list.ok?page=${i }">${i }</a>] 
			</c:forEach> 
			</center>
			
			<!-- /.container -->
		</div>


	
		
		</div>
	</div>
</div>














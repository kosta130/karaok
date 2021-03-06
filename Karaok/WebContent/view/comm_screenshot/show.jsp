<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var repl=$("#reply");
	
$('#replySubmit').click(function(){
	if(repl.val()==""){
		alert("댓글을 입력하세요.");
		repl.focus();
		return false;
	}
	$.ajax({
		url:'./screenReply.ok?action=insertReply&num=${dto.num}',
		data:{contents:$('#reply').val()},
		success:function(result){
			$('#reply').val('');
			$('#replyResult').html(result); 
		}
	});
	
});
});
function update(up,currentNickName) {
	if(currentNickName==''){
		alert('권한이 없습니다.');
		
	}else if((up=='del' && currentNickName=='${dto.nickname}') || (up=='del' && currentNickName=='관리자')){
		if(confirm('정말삭제?')){
		location.href = 'screen.ok?action=delete&num=${dto.num }';
		}
	}else if(up=='up' && currentNickName=='${dto.nickname}'){
		document.sc_view.submit();
	
	}else{
		alert('권한이 없습니다.');
	}
	
}
</script>
<form role="form"  action="screen.ok?action=edit&num=${dto.num }" method="post" enctype="multipart/form-data" name="sc_view"> 
<h1>스크린샷 글화면</h1>
<hr>
     <div class="box-body">
              	<div align="center"> 	
         		 <img name="fileName" width="600" height="250" src="./img_soyoung/${dto.fileName}" alt="">
         		 </div>	
         		 
                <div class="form-group">
                <input type="hidden" name="num" value="${dto.num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" name="subject" placeholder="제목" value=${dto.subject } readonly="readonly">
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" name="nickname" placeholder="작성자" value=${dto.nickname } readonly="readonly">
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1"></label>
                  <input type="hidden" class="form-control" name="seek" placeholder="조회수" value=${dto.seek } readonly="readonly">
                </div>
                
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;border:0;background-color:transparent" class="form-control" rows="3" placeholder="Enter ..." name="contents" disabled="disabled">${dto.contents }</textarea>
       			</div>
              </div>
              <div class="box-footer" align="center" style="background-color: beige">
                
              
                <button type="button" class="btn btn-primary" onclick="update('up','${currentNickName}')">수정</button>
                <button type="button" class="btn btn-primary" onclick="update('del','${currentNickName}')" >삭제</button>
                <button type="reset" class="btn btn-primary" onclick="location.href='screen_list.ok'">목록</button>
              </div>
             
                <!-------------------------  댓글등록부분--------------------------------->
            <div class="box-footer">
              <div class="input-group">
                <input class="form-control" placeholder="댓글을 입력하세요.." id="reply">

                <div class="input-group-btn">
                  <button type="button" class="btn btn-success" id="replySubmit">댓글등록</button>
                </div>
                
               <!-------------------------  댓글생성부분 --------------------------------->
         		</div>
                <hr>
                <div id="replyResult" align="left">
                <c:forEach items="${list1}" var="v">
               <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> ${v.ndate}</small>
                    <b>${v.nickname }</b> <br>

             		${v.contents }
             		<hr>
			</c:forEach>

                </form>
        
           
        
          </div><!--/row-->
		</div>
	</div>
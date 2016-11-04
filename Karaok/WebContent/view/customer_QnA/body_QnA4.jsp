<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	$('textarea').css({'height':'250pt','width':'100%'});
	$('#replySubmit').click(function(){	
		$.ajax({
			url:'./qnaReply.ok?action=insertReply&num=${dto.num}',
			data:{contents:$('#reply').val()},
			success:function(result){
				$('#reply').val('');
				$('#replyResult').html(result); 
			}
		});
		
	});
});


	function update(up, currentNickName) {
		if(currentNickName==''){
			alert('권한이 없습니다.');
		}else if((up=='del' && currentNickName=='${dto.nickname}') || (up=='del' && currentNickName=='관리자')){
			if (confirm('정말삭제?')){
				location.href = 'qna.ok?action=delete&num=${dto.num }';
			}
		}else if((up=='up' && currentNickName=='${dto.nickname}')){
			document.view.submit();
		}else{
			alert('권한이 없습니다.');
		}
	}
	
</script>
<form role="form" action="qna.ok?action=edit&num=${dto.num }" method="post" name="view">
   <div class="container">
      <div class="row row-offcanvas row-offcanvas-center">
         <div class="row">
         <div class="box-body">
            <h1>1:1문의내역</h1>
            <hr>
            <div align="center">
              
               <hr>
                 
               <table cellpadding="5" class="table table-bordered table-striped">
                <tr>
                   <th width="20%" bgcolor="#949494">글번호</th>
                   <th>${dto.num }</th>
                </tr>
                <tr>
                   <th width="20%" bgcolor="#cccccc">제목</th>
                   <th>${dto.subject }</th>
                </tr>
                <tr>
                   <th width="20%" bgcolor="#949494">작성자</th>
                   <th>${dto.nickname }</th>
                </tr>
                <tr>
                   <th bgcolor="#ccccc">날짜</th>
                   <th>${dto.ndate }</th>
                </tr>
                <tr>
                   <td colspan="2" height="250pt"><textarea disabled="disabled" style="border:0;background-color:transparent">${dto.contents }</textarea></td>
                </tr>
               <tr>
                  <td colspan="2" align="center">
                  
                     <button type="button" class="btn btn-primary" onclick="update('up', '${currentNickName}')">수정</button>
                     <button  type="button" class="btn btn-primary" onclick="update('del', '${currentNickName}')">삭제</button>
               		 <button type="reset" class="btn btn-primary" onclick="location.href='./qna.ok?action=qlist'">목록</button>        
                     
                  </td>
                </tr>
               </table>
               		 <!-------------------------  댓글등록부분--------------------------------->
            <c:if test="${currentNickName=='관리자' }">
            <div class="box-footer">
              <div class="input-group">
                <input class="form-control" placeholder="댓글을 입력하세요.." id="reply">
		
                <div class="input-group-btn">
                  <button type="button" class="btn btn-success" id="replySubmit" onclick="check()">댓글등록</button>
                </div>
  			</c:if>
                
               <!-------------------------  댓글생성부분 --------------------------------->
              </div>
                <hr>
                <div id="replyResult" align="left">
                <c:forEach items="${list1}" var="v">
               <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> ${v.edate}</small>
                    <b>${v.nickname }</b><br>
           
             		${v.contents }
             		<hr>
			</c:forEach>
                
                
                
                </div>
             
            </div>

               </form>
            </div>
            </div>

</form>

                </div>
            </div>
        </div>    

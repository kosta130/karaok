<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>

<script type="text/javascript">

$(document).ready(function(){
	$('textarea').css({'height':'250pt','width':'100%'});
	$('#replySubmit').click(function(){
		if($('#reply').val()==''){
			alert('댓글 내용을 입력하세요');
		}
		else{
		$.ajax({
			url:'./event_confirm.ok?action=insertReply',
			data:{contents:$('#reply').val()},
			success:function(result){
				$('#reply').val('');
				$('#replyResult').html(result);
			}
		});
		}
		
	});
});




function check(){
	if(confirm('정말로 삭제하시겠습니까?')){
		location.href='./event_delete.ok?num='+${num}
	}else{
		return false;
	}
}
</script>

<body>

   
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">이벤트</h3>

              <div class="box-tools pull-right">
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
              <c:if  test="${dto != null}">
                <h1>${dto.subject }</h1>
               </c:if>
               <c:if test="${dto != null }">
                 <h3 align="right"><span style="color: red">${dto.startDate}~${dto.endDate }</span></h3>
                  </c:if>
              </div>
              <!-- /.mailbox-controls -->
				<br><br>
              <div class="mailbox-read-message">
              <c:if test="${dto !=null }">
               <img width="1200" height="400" src="./img/${dto.fileName}"></p>
				</c:if>
				
				<c:if test="${dto !=null }">
				<p><textarea disabled="disabled" style="border:0;background-color:transparent">${dto.contents }</textarea></p>
				<hr>
				</c:if>
				이전글:
				<c:if test="${pre != null }">
				<a href="./event_confirm.ok?action=read&num=${pre.num}">${pre.subject }</a>
				</c:if>
				<br>
				다음글:
				<c:if test="${next != null }">
				<a href="./event_confirm.ok?action=read&num=${next.num }">${next.subject }</a>
				</c:if>
              </div>
              <!-- /.mailbox-read-message -->
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
                <div id="replyResult">
                <c:forEach items="${list}" var="v">
               <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> ${v.edate}</small>
                    ${v.id }<br>
           
             		${v.contents }
             		<hr>
			</c:forEach>
                
                
                
                </div>
             
            </div>
            
              



				<br><br><br>
              <div align="center">
            <form action="./event_list.ok" name="frm">
              	<button type="submit" class="btn btn-primary">목록으로</button>
              	<c:if test="${currentId=='lee52x@naver.com' }">
                 <button type="button" class="btn btn-warning" name="delete" onclick="check()"><i class="fa fa-trash-o" ></i>삭제</button>
                 </c:if>
           	</form>  
              </div>
            </div>
 
</body>
</html>
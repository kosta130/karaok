<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(document).ready(function(){
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


	function update(up) {
		if(up=='del'){
			if (confirm('정말삭제?')){
				location.href = 'qna.ok?action=delete&num=${dto.num }';
			}
		}else{
			document.view.submit();
		}
	}
</script>
<form role="form" action="qna.ok?action=edit&num=${dto.num }" method="post" name="view">
   <div class="container">
      <div class="row row-offcanvas row-offcanvas-center">
         <div class="row">
         <div class="box-body">
            <div align="center">
               <h3>1대1 질문 현황</h3>
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
                   <td colspan="2" height="250pt">${dto.contents }</td>
                </tr>
               <tr>
                  <td colspan="2" align="center">
                  
                     <button type="submit" class="btn btn-primary" onclick="update('up')">수정</button>
                     <button  type="button" class="btn btn-primary" onclick="update('del')">삭제</button>
               		 <button type="reset" class="btn btn-primary" onclick="location.href='qlist.ok'">목록</button>        
                     
                  </td>
                </tr>
               </table>
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
             </div><!--/row-->
      </div>
   </div>
</form>

   <!-- 댓글 영역 --> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
                  <!-- 좌우측의 공간 확보 -->
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                   
                    <table id="commentTable" class="table table-condensed"></table>
                    
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10" value="${currentNickname }">
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">댓글 입력</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                   
                    <script>
   
                        $(function(){
                               
                            //제일 하단에 있는 depth1의 댓글을 다는 이벤트
                            $("#commentParentSubmit").click(function( event ) {
                                   
                                //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
                                var pName = $("#commentParentName");
                                var pText = $("#commentParentText");
                                   
                                if($.trim(pName.val())==""){
                                    alert("이름을 입력하세요.");
                                    pName.focus();
                                }else if($.trim(pText.val())==""){
                                    alert("내용을 입력하세요.");
                                    pText.focus();
                                    return;
                                }
                                   
                                var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                                            '<td colspan=2>'+
                                                                '<strong>'+pName.val()+'</strong> '+' <a style="cursor:pointer;" name="pAdd">댓글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                   
                                //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
                                if($('#commentTable').contents().size()==0){
                                    $('#commentTable').append(commentParentText);
                                }else{
                                    $('#commentTable tr:last').after(commentParentText);
                                }
                                   
                                $("#commentParentName").val("");
                                $("#commentParentText").val("");
                                   
                            });
                               
                            //댓글의 댓글을 다는 이벤트
                            $(document).on("click","#commentChildSubmit", function(){
                                   
                                var cName = $("#commentChildName");
                                var cText = $("#commentChildText");
                                   
                                if($.trim(cName.val())==""){
                                    alert("이름을 입력하세요.");
                                    cName.focus();
                                    return;
                                }else if($.trim(cText.val())==""){
                                    alert("내용을 입력하세요.");
                                    cText.focus();
                                    return;
                                }
                                   
                                var commentChildText = '<tr name="commentChildCode">'+
                                                            '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                                            '<td style="width:99%">'+
                                                                '<strong>'+cName.val()+'</strong> '+' <a style="cursor:pointer;" name="cAdd">댓글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                                                '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>';
                                                           
                                //앞의 tr노드 찾기
                                var prevTr = $(this).parent().parent().parent().parent().prev();
                                //댓글 적는 에디터 삭제
                                $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
                                   
                                //댓글을 타고 올라가며 부모 tr을 찾음
                                while(prevTr.attr("name")!="commentParentCode"){
                                    prevTr = prevTr.prev();
                                }
                                //while를 타는지 체크
                                var check = false;
                                //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
                                var nextTr = prevTr.next();
                                //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
                                if(nextTr.attr("name")!="commentChildCode"){
                                    prevTr.after(commentChildText);
                                }else{
                                    //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
                                    while(nextTr.attr("name")=="commentChildCode"){
                                        nextTr = nextTr.next();
                                        check = true;
                                    }
                                }
                                   
                                if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
                                    nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
                                    nextTr.after(commentChildText);
                                }
                                   
                            });
                               
                            //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
                            $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
                                   
                                if($(this).attr("name")=="pDel"){
                                    if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                                           
                                        var delComment = $(this).parent().parent();
                                        var nextTr = delComment.next();
                                        var delTr;
                                        //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                                        while(nextTr.attr("name")=="commentCode"){
                                            nextTr = nextTr.next();
                                            delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                                            delTr.remove();
                                        }
                                           
                                        delComment.remove();
                                           
                                    }else{   //취소
                                        return;
                                    }
                                }else if($(this).attr("name")=="cDel"){
                                    if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                                        $(this).parent().parent().remove();
                                    }else{   //취소
                                        return;
                                    }
                                }else{
                                    //자기 부모의 tr을 알아낸다.
                                    var parentElement = $(this).parent().parent();
                                    //댓글달기 창을 없앤다.
                                    $("#commentEditor").remove();
                                    //부모의 하단에 댓글달기 창을 삽입
                                    var commentEditor = '<tr id="commentEditor">'+
                                                            '<td style="width:1%"> </td>'+
                                                            '<td>'+
                                                                '<span class="form-inline" role="form">'+
                                                                    '<p>'+
                                                                        '<div class="form-group">'+
                                                                            '<input type="text" value=${currentNickname } id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'+
                                                                        '</div>'+
                                                                        
                                                                        '<div class="form-group">'+
                                                                            '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
                                                                        '</div>'+
                                                                    '</p>'+
                                                                        '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                                                '</span>'+
                                                            '</td>'+
                                                        '</tr>';
                                                           
                                    parentElement.after(commentEditor); 
                                }
                                   
                            });
                            
                        });
                    </script>
                </div>
            </div>
        </div>    

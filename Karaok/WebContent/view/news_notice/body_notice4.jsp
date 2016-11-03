<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('textarea').css({'height':'250pt','width':'100%'});
	});
	function update(up, currentNickName) {
		
		if(up=='del' && currentNickName=='관리자'){
			if (confirm('정말삭제?')){
				location.href = 'notice.ok?action=delete&num=${dto.num }';
			}
		}else if(up=='up' && currentNickName=='관리자'){
			document.view.submit();
		}else{
			alert('권한이 없습니다.');
		}
}

</script>
<form role="form" action="notice.ok?action=edit&num=${dto.num }" method="post" name="view">
   <div class="container">
      <div class="row row-offcanvas row-offcanvas-center">
         <div class="row">
         <div class="box-body">
            <div align="center">
               <h3>공지사항 보기</h3>
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
                  
                     <button type="button" class="btn btn-primary" onclick="update('up','${currentNickName}')">수정</button>
                     <button type="button" class="btn btn-primary" onclick="update('del','${currentNickName}')">삭제</button>
               		 <button type="reset" class="btn btn-primary" onclick="location.href='list.ok'">목록</button>        
                     
                  </td>
                </tr>
               </table>
               </form>
            </div>
            </div>
             </div><!--/row-->
      </div>
   </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function update(up) {
		if(up=='del'){
			if (confirm('정말삭제?')){
				location.href = 'notice.ok?action=delete&num=${dto.num }';
			}
		}else{
			var subject=document.upform.subject.value;
			var contents=document.upform.contents.value;
			
			if(subject==0){
				 alert("제목을 입력하세요.");
				 //subject.focus();왜 포커스는 작동이 되지 않을까?
		         return false;
			}else if(contents==0){
				 alert("내용을 입력하세요.");
		         return false;
			}else if(contents.length < 3){
				alert("내용을 3자 이상 입력하세요.");
	            return false;
			}
			document.upform.submit();
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
                   <td colspan="2" height="250pt">${dto.contents }</td>
                </tr>
               <tr>
                  <td colspan="2" align="center">
                  
                     <button type="submit" class="btn btn-primary" onclick="update('up')">수정</button>
                     <button  type="button" class="btn btn-primary" onclick="update('del')">삭제</button>
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
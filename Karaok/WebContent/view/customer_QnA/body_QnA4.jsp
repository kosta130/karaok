<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
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
               </form>
            </div>
            </div>
             </div><!--/row-->
      </div>
   </div>
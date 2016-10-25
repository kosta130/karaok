<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <script type="text/javascript">
   		function update(up) {
   			if(up=='del') {
   				if(confirm('정말삭제?')) {
   					location.href = 'note.ok?action=delete&num=${dto.num}';
   				}
   			}else {
   				document.view.submit();
   			}
   		}
   </script>
   <form role="form" name="view" action="note.ok?action=upform&num=${dto.num }" method="post">
   <div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
			<div class="box-body">
            <div align="center">
            	<h3>개발자 노트</h3>
            	<hr>
            	<table cellpadding="5" class="table table-bordered table-striped">
            	 <tr>
            	 	<th width="20%" bgcolor="#949494">번호</th>
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
                     <input type="submit" class="bt btn-primary" value="수정" onclick="update('up')">         
                     <input type="button" class="bt btn-primary" value="삭제" onclick="update('del')">
                     <button type="reset" class="bt btn-primary" onclick="location.href='note_list.ok'">목록</button>
		         	</td>
		       	</tr>
            	</table>
            	</form>
            </div>
            </div>
          	</div><!--/row-->
		</div>
	</div>
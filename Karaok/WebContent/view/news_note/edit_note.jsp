<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
			<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script type="text/javascript">
				$(function(){
					var subject = $("#subject");
					var contents = $("#contents");
					
					$("button[type=submit]").click(function(){
						if($.trim(sub.val())==""){
							alert("제목을 입력하여 주십시오.");
							subject.focus();
							return false;
						} else if($.trim(contents.val())==""){
							alert("내용을 입력하여 주십시오.");
							contents.focus();
							return false;
						} else if($.trim(contents.val()).length < 3){
							alert("내용을 3자 이상 입력하세요.");
							contents.focus();
							return false;
						}
						document.write.action="note.ok?action=insert";
						document.write.submit();
					});
					
				});
			</script>
			<form role="form" action="./note.ok?action=update" method="POST" name="upform">
			<h3>개발자 노트 수정</h3>
			<hr>
              <div class="box-body">
                <div class="form-group">
                 <input type="hidden" name="num" value="${dto.num }">
                  <label for="exampleNote1">제목</label>
                  <input type="text" class="form-control" id="subject" placeholder="제목" value=${dto.subject }>
                </div>
                <div class="form-group">
                  <label for="exampleNote1">작성자</label>
                  <input type="text" class="form-control" id="nickname" placeholder="작성자" value=${dto.nickname } readonly="readonly">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력해 주십시오..." name="contents">${dto.contents }</textarea>
                </div>
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                <button class="btn btn-primary">수정</button>
                <button type="submit" class="btn btn-primary" onclick="location.href='note_list.ok'">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>

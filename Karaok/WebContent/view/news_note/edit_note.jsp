<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
			<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script type="text/javascript">
				$(function(){
					var subject = $("#subject");
					var contents = $("#contents");
					
					$("button[type=submit]").click(function(){
						if($.trim(subject.val())==""){
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
						document.update.action="note.ok?action=update&num=${dto.num }";
						document.update.submit();
					});
					
				});
			</script>
			<form role="form"  method="post" id="update" name="update">
			<h3>개발자 노트 수정</h3>
			<hr>
              <div class="box-body">
                 <input type="hidden" name="num" value="${note.num }">
                <div class="form-group">
                  <label for="exampleNote1">제목</label>
                  <input type="text" class="form-control" id="subject" placeholder="제목"name="subject" value=${dto.subject } >
                </div>
                <div class="form-group">
                  <label for="exampleNote1">작성자</label>
                  <input type="text" class="form-control" id="nickname" placeholder="작성자" name="nickname" value=${dto.nickname } readonly="readonly">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" name="contents" id="contents"> ${dto.contents }</textarea>
                </div>
                <input type="hidden" name="hits" value="${dto.hits }">
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center" style="background:#000000;background:rgba(0,0,0,0);">
                <button type="submit" class="btn btn-primary">수정</button>
                <button type="reset" class="btn btn-primary" onclick="location.href='note_list.ok'">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>

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
					var cont = $("#cont");
					
					$("button[type=submit]").click(function(){
						if($.trim(subject.val())==""){
							alert("제목을 입력하여 주십시오.");
							subject.focus();
							return false;
						} else if($.trim(cont.val())==""){
							alert("내용을 입력하여 주십시오.");
							cont.focus();
							return false;
						} else if($.trim(cont.val()).length < 3){
							alert("내용을 3자 이상 입력하세요.");
							cont.focus();
							return false;
						}
						document.write.action="note.ok?action=insert";
						document.write.submit();
					});
					
				});
			</script>
			<form role="form" method="post" name="write" id="write">
            	<h1>개발자 노트 입력</h1>
            	<hr>
            	<div class="box-body">
                <div class="form-group">
                  <input type="hidden" name="num" value="${num }">
                  <label for="exampleNote1">제목</label>
                  <input type="text" class="form-control" id="subject" placeholder="제목" name="subject">
                </div>
                <div class="form-group">
                  <label for="exampleNote1">작성자</label>
                  <input type="text" class="form-control" id="nickname" placeholder="작성자" value="${currentNickName }" name="nickname" readonly="readonly">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" id="cont" class="form-control" rows="3" placeholder="3글자 이상 입력하여 주십시오..." name="contents"></textarea>
                </div>
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-primary" onclick="location.href='note_list.ok'">취소</button>
              </div>
              </form>
        </div>
    </div>
    
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
<script type="text/javascript">
$(document).ready(function(){
	
	  var sub = $("#sub");
	  var con = $("#con");
	  
    $('button[type=submit]').click(function() {
        if($.trim(sub.val())==""){
            alert("제목을 입력하세요.");
            sub.focus();
            return false;
        }else if($.trim(con.val())==""){
            alert("내용을 입력하세요.");
            con.focus();
            return false;
        }else if(con.val().length < 3){
        	alert("내용을 3자 이상 입력하세요.");
            con.focus();
            return false;
        }
        document.write.action="notice.ok?action=insert";
        document.write.submit();
    })
 
});

</script>
			
<form role="form" action="notice.ok?action=update&num=${dto.num }" method="post">
<h1>공지사항 수정</h1>
<hr>
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1"></label>
                  <input type="hidden" class="form-control" id="exampleInputEmail1" placeholder="글번호" value=${dto.num } name="num">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="sub" placeholder="제목" value=${dto.subject } name="subject">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="작성자" value=${dto.nickname } name="nickname" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1"></label>
                  <input type="hidden" class="form-control" id="exampleInputEmail1" value=${dto.hits } name="hitnum">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents" id="con">${dto.contents }</textarea>
                </div>
                
                
 

              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center"  style="background:#000000;background:rgba(0,0,0,0);">
                <button type="submit" class="btn btn-primary" >수정</button>
                <button type="reset" class="btn btn-primary">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>

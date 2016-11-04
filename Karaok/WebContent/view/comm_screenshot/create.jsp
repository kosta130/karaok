<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	  var sub = $("#sub");
	  var con = $("#con");
	  var fn=$("#fn");
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
        }else if(fn.val()==""){
			alert("이미지를 첨부하세요.")
			return false;
        }
        document.sc_create.action="screen.ok?action=insert";
    })
});
</script>
	
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">

<form role="form"  method="post" name="sc_create" id="sc_create" enctype="multipart/form-data"> 
<h1>스크린샷 게시판 입력</h1>
<hr>
              <div class="box-body" >
                <div class="form-group">
                <input type="hidden" name="num" value="${num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="sub" name="subject" placeholder="제목" value="${subject }">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control"  name="nickname" placeholder="작성자" value="${currentNickName }" readonly="readonly">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" id="con" class="form-control" rows="3" placeholder="3자이상 입력해주세요." name="contents">${contents }</textarea>
                </div>
 				<div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName"  id="fn">
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>

              </div>
              
              <!-- /.box-body -->

              <div class="box-footer" align="center" style="background-color: beige">
                <button type="submit" class="btn btn-primary" >등록</button>
                <button type="button" class="btn btn-primary" onclick="location.href='screen_list.ok'">취소</button>
              </div>
        
            </form>
          </div>

          </div><!--/row-->
		</div>
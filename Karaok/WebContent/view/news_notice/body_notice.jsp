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

<form method="POST" action="./notice.ok?action=insert" name="input">

<h1>공지사항 입력</h1>
<hr>
	<input name="subject" type="text" class="form-control" id="sub" placeholder="제목" value="${subject }"><br>
	<input name="nickname" type="text" class="form-control" placeholder="작성자" value="${currentNickName }" readonly="readonly"><br>
	<textarea name="contents" style="height: 300px;" class="form-control" rows="3" id="con">${contents }</textarea>
               
    <div class="box-footer" align="center"  style="background:#000000;background:rgba(0,0,0,0);">
        <button type="submit" class="btn btn-primary" >등록</button>
        <button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
    </div>
        
</form>
 </div>
	</div>
		</div>

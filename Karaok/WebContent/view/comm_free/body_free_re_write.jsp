<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        document.re_write.action="crud.ok?action=insert";
        document.re_write.submit();
    })
 
});

</script>
<form role="form"  method="post" name="re_write" id="re_write"> 
<h1>자유게시판 답글 입력</h1>
<hr>
<%
	request.getSession().setAttribute("currentNickname", "오1");
%>
              <div class="box-body" >
                <div class="form-group">
                <input type="hidden" name="num" value="${num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="sub" name="subject" placeholder="제목" value="${subject }">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control"  name="nickname" placeholder="작성자" value="${currentNickname }" readonly>
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" id="con" class="form-control" rows="3" placeholder="3자이상 입력해주세요." name="contents">${contents }</textarea>
                </div>

              </div>
              
              <!-- /.box-body -->

              <div class="box-footer" align="center" >
                <button type="submit" class="btn btn-primary" >등록</button>
                <button type="button" class="btn btn-primary" onclick="location.href='free_list.ok'">목록</button>
              </div>
        
            </form>
          </div>

          </div><!--/row-->
		</div>
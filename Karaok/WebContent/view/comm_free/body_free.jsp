<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
<script type="text/javascript">
 function update() {
		
		
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
 
</script>
<form role="form"  action="crud.ok?action=update&num=${dto.num }" method="post" name="upform"> 
<h1>자유게시판 글수정</h1>
<hr>
              <div class="box-body">
                <div class="form-group">
                <input type="hidden" name="num" value="${dto.num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" name="subject" placeholder="제목" value=${dto.subject }>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" name="nickname" placeholder="작성자" value=${dto.nickname } readonly="readonly">
                </div>
                <div class="form-group">
                  <input type="hidden" class="form-control" name="hits" placeholder="조회수" value=${dto.hits } >
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents">${dto.contents }</textarea>
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center" style="background-color: beige">
                <button  type="button" class="btn btn-primary" onclick="update()">등록</button>
                <button type="reset" class="btn btn-primary" onclick="history.back()">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>
	</div>
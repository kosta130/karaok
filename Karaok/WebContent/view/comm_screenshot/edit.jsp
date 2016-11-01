<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<script type="text/javascript">
 function update() {
		
			var subject=document.sc_edit.subject.value;
			var contents=document.sc_edit.contents.value;
			
			
			if(subject==0){
				 alert("제목을 입력하세요.");
		         return false;
			}else if(contents==0){
				 alert("내용을 입력하세요.");
		         return false;
			}else if(contents.length < 3){
				alert("내용을 3자 이상 입력하세요.");
	            return false;
			}
			document.sc_edit.submit();
		}
	
 </script> 
<form role="form"  action="screen.ok?action=update&num=${dto.num }" method="post" name="sc_edit" enctype="multipart/form-data"> 
<h1>스크린샷 수정</h1>
<hr>
              <div class="box-body">
                <div class="form-group">
                <input type="hidden" name="num" value="${dto.num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" name="subject" placeholder="제목" value=${dto.subject } >
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" name="nickname" placeholder="작성자" value=${dto.nickname } readonly="readonly">
                </div>
                
                <div class="form-group">
                  <input type="hidden" class="form-control" name="seek"  value=${dto.seek }>
                </div>
                
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents" >${dto.contents }</textarea>
       			</div>
         		 
       			<div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName" id="exampleInputFile">
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                
                <button type="button" class="btn btn-primary" onclick="update()">등록</button>
                <button type="reset" class="btn btn-primary" onclick="history.back()">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>
	</div>
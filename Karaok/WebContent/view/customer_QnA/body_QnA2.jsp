<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<form role="form" action="qna.ok?action=update&num=${dto.num }" method="post">
<h1>1대1 질문글 수정</h1>
<hr>
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">글번호</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="글번호" value=${dto.num } name="num">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="제목" value=${dto.subject } name="subject">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="작성자" value=${currentNickname } name="nickname">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents">${dto.contents }</textarea>
                </div>
                
                
 

              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary" >수정</button>
                <button type="reset" class="btn btn-primary">취소</button>
              </div>
        
            </form>
          </div>
          </div><!--/row-->
		</div>

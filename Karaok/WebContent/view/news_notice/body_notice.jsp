<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">

<form role="form" method="POST" action="./notice.ok?action=insert">
<h1>공지사항 입력</h1>
<hr>
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input name="subject" type="text" class="form-control" id="exampleInputEmail1" placeholder="제목">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input name="nickname" type="text" class="form-control" id="exampleInputEmail1" placeholder="작성자">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>
                
                
 

              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary" onclick="">등록</button>
                <button type="submit" class="btn btn-primary" onclick="history.back()">취소</button>
              </div>
        
            </form>
          </div>





          </div><!--/row-->
		</div>
	</div>
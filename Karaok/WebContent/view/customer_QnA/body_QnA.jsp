<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
		
<h1>1:1문의하기
	<c:forEach begin="1" end="61">
	&nbsp
	</c:forEach>
	<small><button class="btn btn-danger" onclick="location.href='./qna.ok?action=qlist'">문의내역</button></small>
</h1>
<hr>
          
	<form method="POST" action="./qna.ok?action=insert" name="input">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="subject" placeholder="제목을 입력하세요">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="nickname" readonly="readonly" value="${currentNickName }">
                </div>                             
                 <div class="form-group">
                  <label>Textarea</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
                </div>
              </div>
              
              <!-- /.box-body -->
    <div class="box-footer" align="center">
        <button type="submit" class="btn btn-primary" >등록</button>
        <button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
    </div>
              

              
            </form>
 </div>
	</div>
		</div>
		

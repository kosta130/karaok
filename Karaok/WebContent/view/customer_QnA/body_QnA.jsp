<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">

<form method="POST" action="./qna.ok?action=insert" name="input">
<h1>1대1 질문하기</h1>
<hr>
	<input name="subject" type="text" class="form-control" id="exampleInputEmail1" placeholder="제목" value="${subject }"><br>
	<input name="nickname" type="text" class="form-control" id="exampleInputEmail1" placeholder="작성자" value="${currentNickname }"><br>
	<textarea name="contents" style="height: 300px;" class="form-control" rows="3">${contents }</textarea>
               
    <div class="box-footer" align="center">
        <button type="submit" class="btn btn-primary" >등록</button>
        <button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
    </div>
        
</form>
 </div>
	</div>
		</div>

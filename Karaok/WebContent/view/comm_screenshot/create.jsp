<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>


<script>

$(function() {

$(".datepicker").datepicker();

});

</script>

<!-- <script type="text/javascript">
function check(){
	var f=document.create;
	var id=f.id.value;
	var subject=f.subject.value;
	var contents=f.contents.value;
	var fileName=f.fileName.value;
	f.submit();
}
</script> -->
</head>
<body>
<h1 align="left">스크린샷 등록</h1>
<hr>
<%
	request.getSession().setAttribute("currentId", "ojh5797@naver.com");
%>
           <form name="create" method="post" action="screen.ok?action=insert" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                <input type="hidden" name="num" value="${num }" >
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="subject" placeholder="제목을 입력하세요" value="${subject }">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">아이디</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="id" placeholder="작성자 id" value="${currentId }" readonly="readonly">
                </div>
                
                                   
                 <div class="form-group">
                  <label>내용</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력하세요">${contents }</textarea>
                </div>
                


				 <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName" id="exampleInputFile">
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary" >등록</button>
                 <button type="button" class="btn btn-primary">취소</button>
              </div>
              
              
            </form>
</body>
</html>
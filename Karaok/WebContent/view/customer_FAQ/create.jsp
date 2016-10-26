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


</head>
<body>
<h1 align="left">이벤트 등록</h1>
<hr>
           <form name="create" method="post" action="./faq_create_complete.ok" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">자주하는 질문</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="subject" placeholder="제목을 입력하세요">
                </div>
           
                 <div class="form-group">
                  <label>답변</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
                </div>
                


				 <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName" id="exampleInputFile">
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary">등록</button>
                 <button type="button" class="btn btn-primary">취소</button>
              </div>
              
              
            </form>
</body>
</html>
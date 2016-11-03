<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>
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

<script type="text/javascript">
function check(){
	var f=document.create;
	var subject=f.subject.value;
	var point=f.point.value;
	var contents=f.contents.value;
	var fileName=f.fileName.value;
	f.submit();
}
</script>
</head>
<body>
<h1 align="left">이벤트 등록</h1>
<hr>
           <form name="create" method="post" action="./event_create_complete.ok" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="subject" placeholder="제목을 입력하세요">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">핵심 내용</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="point" placeholder="핵심 내용을 입력하세요">
                </div>
                
                                   
                 <div class="form-group">
                  <label>Textarea</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
                </div>
                
               <div><label for="exampleInputEmail1">시작날짜:</label><input type="text" class="datepicker" name="startDate"/> 
               <label for="exampleInputEmail1">종료날짜:</label><input type="text" class="datepicker" name="endDate" />
               </div>

				 <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName" id="exampleInputFile">
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer" align="center">
                <button type="button" class="btn btn-primary" onclick="check()">등록</button>
                 <button type="button" class="btn btn-primary">취소</button>
              </div>
              

              
            </form>
</body>
</html>
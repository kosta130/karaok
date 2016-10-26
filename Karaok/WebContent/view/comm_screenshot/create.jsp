<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h1 align="left">스크린샷 등록</h1>
<hr>
<%
	//request.getSession().setAttribute("currentNickname", "오1");
%>
           <form name="create" method="post" action="screen.ok?action=insert" enctype="multipart/form-data">
              <div class="box-body">
              
                <div class="form-group">
       <%--          <input type="hidden" name="num" value="${num }" > --%>
                  <label >제목</label>
                  <input type="text" class="form-control"  name="subject" placeholder="제목을 입력하세요" value="${subject} ">
                </div>
               
                <div class="form-group">
                  <label for="exampleInputPassword1">작성자</label>
                  <input type="text" class="form-control"  name="nickname" placeholder="작성자 " value="${nickname} " >
                </div>
                
                 <div class="form-group">
                  <label>내용</label>
                  <textarea name="contents" style="height: 300px;" class="form-control" rows="3" placeholder="내용을 입력하세요">${contents }</textarea>
                </div>
                
				 <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="fileName" >
                  <p class="help-block">JPG,JPEG,PNG파일만 가능합니다.</p>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer" align="center">
                <button type="submit" class="btn btn-primary" >등록</button>
                 <button type="button" class="btn btn-primary" onclick="location.href='screen_list.ok'">취소</button>
              </div>
              
            </form>

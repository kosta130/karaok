<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<script type="text/javascript">

</script>
<form role="form"  action="screen.ok?action=edit" method="post" name="sc_view"> 
<h1>스크린샷 글화면</h1>
<hr>
     <div class="box-body">
              	<div align="center"> 	
         		 <img width="600" height="250" src="./img/${dto.fileName}" alt="">
         		 </div>	
                <div class="form-group">
                <input type="hidden" name="num" value="${dto.num }">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="text" class="form-control" name="subject" placeholder="제목" value=${dto.subject } readonly="readonly">
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="text" class="form-control" name="nickname" placeholder="작성자" value=${dto.nickname } readonly="readonly">
                </div>
                
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents" readonly="readonly">${dto.contents }</textarea>
       			</div>
       					
              <!-- /.box-body -->

              <div class="box-footer" align="center">
                
                <button type="button" class="btn btn-primary" onclick="">답글 달기</button>
                <button type="submit" class="btn btn-primary" >수정</button>
                <button type="reset" class="btn btn-primary" onclick="location.href='screen_list.ok'">목록</button>
              </div>
        
            </form>
        
          </div><!--/row-->
		</div>
	</div>
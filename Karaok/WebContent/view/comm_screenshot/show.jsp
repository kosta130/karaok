<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<script type="text/javascript">
function del() {
		confirm('정말삭제?')
		location.href = 'screen.ok?action=delete&num=${dto.num }';
}
</script>
<form role="form"  action="screen.ok?action=edit&num=${dto.num }" method="post" name="sc_view" enctype="multipart/form-data"> 
<h1>스크린샷 글화면</h1>
<hr>
     <div class="box-body">
              	<div align="center"> 	
         		 <img name="fileName" width="600" height="250" src="./img_soyoung/${dto.fileName}" alt="">
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
                
                <div class="form-group">
                  <label for="exampleInputEmail1">조회수</label>
                  <input type="text" class="form-control" name="seek" placeholder="조회수" value=${dto.seek } readonly="readonly">
                </div>
                
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..." name="contents" readonly="readonly">${dto.contents }</textarea>
       			</div>
       					
             

              <div class="box-footer" align="center">
                
              
                <button type="submit" class="btn btn-primary" >수정</button>
                <button type="button" class="btn btn-primary" onclick="del()" >삭제</button>
                <button type="reset" class="btn btn-primary" onclick="location.href='screen_list.ok'">목록</button>
              </div>
        
            </form>
        
          </div><!--/row-->
		</div>
	</div>
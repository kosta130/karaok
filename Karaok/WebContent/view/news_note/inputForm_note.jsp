<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
            <center>
            	<h1>개발자 노트 입력</h1>
            	<hr>
            	     <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">제목</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="제목">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">작성자</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="작성자">
                </div>
                <div class="form-group" >
                  <label>Textarea</label>
                  <textarea  style="height: 300px;" class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>
                
                
 

              </div>
              <!-- /.box-body -->

              <div class="box-footer" align="right">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="submit" class="btn btn-primary">취소</button>
              </div>
            	
         	</center>
        </div>
    </div>
    
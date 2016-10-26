<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

	th.no{
	text-align: right;
	}
	
	.title {
	text-align: center;
	}
</style>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
<div class="box-body">
<div align="right">
<button type="button" class="btn btn-primary" onclick="location.href='screen_create.ok'" >글쓰기</button>
</div>
<br>

              <table id="example1" class="table table-bordered table-striped" align="center">
                <thead>
                <tr>
                  <th style="width: 7%" class="title">글번호</th>
                  <th style="width: *%" class="title" >제목</th>
                  <th style="width: 10%" class="title">작성자</th>
                  <th style="width: 10%" class="title">조회수</th>
                  <th style="width: 20%" class="title">날짜</th>
                </tr>
                </thead>
                <tbody>
		  <c:forEach items="${list }" var="dto">
                   <tr>
	                  <td >${dto.num }</td>
	                  <td><a href="">${dto.subject }</a></td>
	                  <td>${dto.nickname }</td>
	                  <td >${dto.seek}</td>
	                  <td >${dto.ndate }</td>
          </c:forEach>
                   </tr>
                </tfoot>
              </table>
             
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  
			    
          </div><!--/row-->
		</div>
	</div>

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
<button type="button" class="btn btn-primary" onclick="location.href='free_write.ok'" >글쓰기</button>
</div>
<br>
<%
	//request.getSession().setAttribute("currentNickname", "오바사키");
%>
              <table id="example1" class="table table-bordered table-striped" align="center">
                <thead>
                <tr>
                  <th style="width: 7%" class="title">글번호</th>
                  <th style="width: *%" class="title" >제목</th>
                  <th style="width: 10%" class="title">작성자</th>
                  <th style="width: 20%" class="title">날짜</th>
                </tr>
                </thead>
                <tbody>
		  <c:forEach items="${list }" var="dto">
                   <tr>
                  <td class="title">${dto.num }</td>
                  <td><a href="crud.ok?action=view&num=${dto.num }">${dto.subject }</a></td>
                  <td class="title">${dto.nickname}</td>
                  <td class="title">${dto.ndate }</td>
		  </c:forEach>
					     
                </tr>
                </tfoot>
              </table>
            <br> 
         	<center>
			<c:if test="${page == 1}">이전</c:if> 
			<c:if test="${page > 1}"> 
			<a href="free_list.ok?page=${ page-1 }">이전</a>       
			</c:if> 
			         
			<c:if test="${page == totalPage }">다음</c:if> 
			<c:if test="${page < totalPage }"> 
			 <a href="free_list.ok?page=${ page+1 }">다음</a>       
			</c:if> 
			<br><br> 
			 <c:forEach begin="1" end="${totalPage }" var="i"> 
			[<a href="free_list.ok?page=${i }">${i }</a>] 
			</c:forEach> 
			</center>
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
<%@page import="com.karaok.notice.dto.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">

</script>
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
              <table id="example1" class="table table-bordered table-striped"align="center">
                <thead>
                <tr>
                  <th style="width: 7%" class="title">글번호</th>
                  <th style="width: *%" class="title" >제목</th>
                  <th style="width: 10%" class="title">작성자</th>
                  <th style="width: 20%" class="title">날짜</th>
                </tr>
                </thead>
                <tbody>
<c:forEach items="${list }" var="v">
       <tr>
         <td>${v.num }</td>
         <td><a href="/Karaok/notice.ok?action=select&num=${v.num }">${v.subject }</a></td>
         <td>${v.nickname }</td>
         <td>${v.ndate }</td>
       </tr>
 </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <form action="./notice3.ok">
             <div class="box-footer" align="center">
                <input type="submit" value="글쓰기" >
              </div>
              </form>
              
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
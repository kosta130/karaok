<%@page import="com.karaok.notice.dto.noticeDTO"%>
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
		  <c:forEach items="${list }" var="dto">
                   <tr>
                  <td class="title">${dto.num }</td>
                  <td><a href="crud.ok?action=upform&num=${dto.num }">${dto.subject }</a></td>
                  <td class="title">${dto.nickname}</td>
                  <td class="title">${dto.ndate }</td>
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
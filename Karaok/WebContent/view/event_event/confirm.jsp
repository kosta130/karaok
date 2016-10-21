<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>

<body>

   
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">이벤트</h3>

              <div class="box-tools pull-right">
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-read-info">
              <c:if  test="${dto != null}">
                <h1>${dto.subject }</h1>
               </c:if>
               <c:if test="${dto != null }">
                 <h3 align="right"><span style="color: red">${dto.startDate}~${dto.endDate }</span></h3>
                  </c:if>
              </div>
              <!-- /.mailbox-controls -->
				<br><br>
              <div class="mailbox-read-message">
              <c:if test="${dto !=null }">
               <img width="1200" height="400" src="./img/${dto.fileName}"></p>
				</c:if>
				
				<c:if test="${dto !=null }">
				<p>${dto.contents }</p>
				</c:if>
				
				
				
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <div class="box-footer">
              <div class="pull-right">
            <form action="./event_list.ok">
              	<button type="submit" class="btn btn-primary">목록으로</button>
                 <button type="button" class="btn btn-warning" ><i class="fa fa-trash-o"></i>삭제</button>
           	</form>  
              </div>
            </div>
          </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp" flush="true"/>
</head>
<body>
<div class="container">
 	<table>
		<tr>
			<td><!-- nav 메뉴/로그인바 -->
				<jsp:include page="../nav.jsp" flush="true"/>
			</td>
		</tr>
		<tr>
			<td><!-- banner -->
				<jsp:include page="banner.jsp" flush="true"/>
			</td>
		</tr>
		<tr>
			<td><!-- body -->
				<jsp:include page="body_QnA3.jsp" flush="true"/>
			</td>
		</tr>
		<tr>
			<td><!-- footer -->
			<hr><jsp:include page="../footer.jsp" flush="true"/><hr>
			</td>
		</tr>
	</table>
</div><!--/.container-->
<!-- jQuery -->
<jsp:include page="../jQuery.jsp" flush="true"/>
</body>
</html>
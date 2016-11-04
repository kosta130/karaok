<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대기실</title>
<%-- <jsp:include page="../header.jsp" flush="true"/> --%>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		alert("정기점검 시간입니다. 현재 게임 이용이 불가합니다. 11:00~23:00")
	});
	
	$(document).on("click","#bt_create",function(){
		var room_title = prompt('방제목을 입력하세요');
		alert(room_title);
	});
	
	$(document).ready(function(){
		function autoRefresh_sample_div(){
			var currentLocation = window.location;
			$("#div_inwon").reload;
		}
		setInterval('autoRefresh_sample_div()', 1000); //1초 후 새로고침
	});
	
</script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var cacheData;
	var data = $("#div").html();
	var auto_refresh = setInterval(
		function(){
			$.ajax({
				url:"",
				type:'POST',
				data: data,
				dataType: 'html',
				success: function(data){
					if(data != cacheData){
						cacheData = data;
						$('#div').html(data);
					}
				}
			});
		},1000
	);
</script> -->
</head>
<body>
<div class="container">
 	<table border="1" width="80%" align="center" vertical-align="center">
 		<tr>
			<td colspan="2"><!-- banner -->
				<jsp:include page="banner.jsp" flush="true"/>
			</td>
		</tr>
		<tr>
			<th style="width:80%;" align="center">방정보</th>
			<th style="width:20%;" align="center">인원정보</th>
		</tr>
		<tr>
			<td style="width:80%;">
					<select name=room_info id=room_info size="15" style="width:100%">
						
						<option value='' selected></option>
					</select>
			</td>
			<td>
				<div id=div_inwon>
					<select name=room_inwon id=room_inwon size="15" style="width:100%">
							<c:forEach items="${currentNickNameList }" var="nicknameList">
								<option value="${nicknameList }">${nicknameList }</option>
							</c:forEach>
					</select>
				</div>
			</td>
		</tr>
		<tr height="35%">
			<th style="width:80%;" align="center">대기실 정보</th>
			<td style="width:20%;" rowspan="2" align="center">
				<button id=bt_create>방만들기</button><br>
				<button id=bt_enter>방들어가기</button><br>
				<button id=bt_exit>종료</button><br>
			</td>
		</tr>
		<tr>
			<td>
				<select name=wait_info id=wait_info size="15" style="width:100%">
						<option value='' selected></option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><!-- footer -->
			<hr><jsp:include page="../footer.jsp" flush="true"/><hr>
			</td>
		</tr>
	</table>
</div><!--/.container-->
<!-- jQuery -->
<%-- <jsp:include page="../jQuery.jsp" flush="true"/> --%>
</body>
</html>
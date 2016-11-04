<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=0 cellspacing=1 cellpadding=3 bgcolor="black" width=100% height=100%>
<tr bgcolor="black">
	<td colspan=2 height=20>
<b><span id="titleDisp" style="color:white"></span></b>
	</td>
</tr>
<tr bgcolor="white">
	<td>
<iframe id="display" frameborder=0 style="width:100%;height:100%"></iframe>
	</td>
	<td width=150 id="nickdisplay" valign="top" bgcolor="silver" style="font-size:12pt;">
	&nbsp;
	</td>
</tr>
<tr bgcolor="white">
	<td height=1 colspan=2>
	
<table border=0 cellspacing=1 cellpadding=1 width=100%>
<col width=100></col><col width=></col><col width=100></col>
<tr>
	<td width=100%>
<table border=0 cellspacing=1 cellpadding=1 width=100%>
<tr>
	<td width=100>
<select id="earnick" style="width:100%">
<option value="">--ALL--</option>
</select>
	</td>
	<td>
<input id="message" type="text" style="width:100%" onkeydown="onKeyDown(event)">
	</td>
	<td align="right" width=1>
<select id="color" onchange="message.focus()">
<option value="black">까만색</option>
<option value="silver">회색</option>
<option value="orange">오렌지</option>
<option value="red">빨강색</option>
<option value="blue">파랑색</option>
<option value="#FFD700">노랑색</option>
</select>
	</td>
</tr>
</table>
	</td>
</tr>
<tr>
	<td colspan=3 align="right">
<table border=0 cellspacing=0 cellpadding=0 width=100%>
<tr>
	<td align="left">
		<input type="button" value="이모티콘▶" onclick="showEmoticon(event)">
	</td>
	<td align="right">
		<input type="button" value="초대" onclick="sendInventList(event)">
		<input type="button" value="나가기" onclick="outRoom()">
	</td>
</tr>
</table>
	</td>
</tr>
</table>

	</td>
</tr>
<tr>
			<td colspan="2"><!-- footer -->
			<hr><jsp:include page="../footer.jsp" flush="true"/><hr>
			</td>
		</tr>
</table>
</body>
</html>
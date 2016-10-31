<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- response7.jsp(요청페이지로부터 전달된 데이터를 출력) --%>
<c:if test="${state == 0 || state == 3}"><%-- 로그인 실패==0 로그아웃==3 --%>
{
	"msg":"${msg }"
}
</c:if>
<c:if test="${state == 1 || state ==2}"><%-- 로그인 성공 == 1 로그인 상태 == 2 --%>
{
	"msg":"${msg }",
	"currentId":"${currentId}",
	"currentNickName":"${currentNickName}",
	"currentInfo":"${currentInfo}"
}
</c:if>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- response7.jsp(요청페이지로부터 전달된 데이터를 출력) --%>
<c:if test="${state == 0 || state == 1}">
{
	"msg":"${msg }",
	"state":"${state}"
}
</c:if>
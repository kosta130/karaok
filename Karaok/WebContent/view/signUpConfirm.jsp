<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${countResult == 0 }">
${countResult }|사용 가능한 이메일입니다.
</c:if>
<c:if test="${countResult == 1 }">
${countResult }|이미 존재하는 이메일입니다.
</c:if>
<c:if test="${countResult == 2 }">
${countResult }|이메일 형식에 맞지 않습니다.
</c:if>
<c:if test="${countResult >= 3 && countResult <=17 }">
${countResult }|${returnValue }
</c:if>
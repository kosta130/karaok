<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<c:forEach items="${list}" var="v">
               <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> ${v.re_ndate}</small>
                    ${v.re_id }<br>
           
             		${v.re_contents }
             		<hr>
</c:forEach>

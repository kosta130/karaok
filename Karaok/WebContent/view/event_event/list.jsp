<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

			
<div class="row">
    <c:forEach items="${list }" var="v">
  <div class="col-sm-6 col-md-4">
    <table>
    <tr>
    	<td rowspan="3" align="left">
   				 <img width="350" height="150" src="./img/${v.fileName }" alt="...">
      			<div class="caption">
        		<h3>${v.subject }</h3>
       			 <p>${v.contents }</p>
        		<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      			</div>
    	</td>
    </tr>
    </table><hr style="color: blue">
  </div>
      </c:forEach>
</div>
           		<form action="./event_create.ok">
           		<input type="submit" value="글등록">
           		</form>

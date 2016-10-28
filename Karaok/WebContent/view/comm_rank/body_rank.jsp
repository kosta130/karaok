<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
	<style>
	
	table {
    border-collapse: collapse;
    width: 100%;
	}
	
	th, td {
	    text-align: left;
	    padding: 8px;
	}
	
	tr:nth-child(even){background-color: #f2f2f2}
	
	th {
	    background-color: #555555;
	    color: white;
	}
	</style>
	
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
            <div class="box-body">
            <div align="center">
            	<h3>랭킹</h3>
            	<hr>
            	<table id="example2" class="table table-bordered table-striped">
            	 <thread>
            	 <tr>
            	 	<th width="10%" class="title">등수</th>
            	 	<th width="60%" class="title">닉네임</th>
            	 	<th width="30%" class="title">점수</th>
            	 </tr>
            	 </thread>
            	 <tbody>
            	 <c:forEach items="${list }" var="rank">
            		<tr>
            			<td align="center">${rank.rank }</td>
            			<td align="center">${rank.nickname }</td>
            			<td align="center">${rank.score }</td>
            		</tr>
            	</c:forEach>
            	 </tbody>
            	</table>
            </div>
            <br>
            <div>
          </div><!--/row-->
		</div>
	</div>
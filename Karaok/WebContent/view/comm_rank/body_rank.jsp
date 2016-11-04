<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
</style>    
<script type="text/javascript">
 function search(){
	var keyword=$('input[name=keyword]').val();
	if(keyword==''){
		alert('검색할 닉네임을 입력해주세요.');
		return false;
	}
	location.href="./rank.ok?keyword="+keyword;
 }
 </script>
     
	<style>
	
	table {
    border-collapse: collapse;
    width: 100%;
	}
	
	th, td {
	    text-align: center;
	    padding: 8px;
	}
	
	tr:nth-child(even){background-color: #f2f2f2}
	
	th {
	    background-color: #FF00DD;
	    color: white;
	}
	</style>
	
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
            <div class="box-body">
            <form name="frm">
            <div align="left">
            	
<div align="center" >
         <div class="box box-solid" style="width: 500px;">
         
            <div class="box-header with-border" style="background-color: beige">
              <h3 class="box-title"><b>랭킹검색<b></b><small></small></h3>
            </div>
            
            <div class="box-body" style="background-color: beige">
              <!-- /btn-group -->
              <div class="input-group">
                <input id="new-event" name="keyword" type="text" class="form-control" placeholder="검색하세요">
                
                <div class="input-group-btn">
                  <button id="add-new-event" type="button" class="btn btn-primary btn-flat" onclick="search()">찾기</button>
                </div>
                <!-- /btn-group -->
              </div>
              <!-- /input-group -->
            </div>
          </div>
  </div>        
            	
            	<hr>
            	<table id="example2" class="table table-bordered table-striped">
            	 <thread>
            	 <tr style="border-collapse: collapse; border:1px black solid;">
            	 	<th style="background-color: #FF00DD;" width="10%" class="title">계급</th>
            	 	<th style="background-color: #FF00DD;" width="60%" class="title">닉네임</th>
            	 	<th style="background-color: #FF00DD;" width="30%" class="title">점수</th>
            	 </tr>
            	 </thread>
            	 <tbody>
            	 <c:forEach items="${list }" var="rank">
            		<tr style="background-color: beige">
            			<c:choose>
            			<c:when test="${rank.score>1000 }">
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/c.JPG" width="150"> </td>
            			</c:when>
            			<c:when test="${rank.score>800 }">
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/d.JPG" width="150"> </td>
            			</c:when>
            			<c:when test="${rank.score>600 }">
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/p.JPG" width="150"> </td>
            			</c:when>
            			<c:when test="${rank.score>400 }">
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/g.JPG" width="150"> </td>
            			</c:when>
            			<c:when test="${rank.score>200 }">
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/s.JPG" width="150"> </td>
            			</c:when>
            			<c:otherwise>
            			<td align="center" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/b.JPG" width="150"> </td>
            			</c:otherwise>
            			</c:choose>
            			<td style="border-collapse: collapse; border:1px #EAEAEA solid;" align="center" ><b>${rank.nickname }</b></td>
            			<td style="border-collapse: collapse; border:1px #EAEAEA solid;" align="center"><b>${rank.score }</b></td>
            		</tr>
            	</c:forEach>
            	 </tbody>
            	</table>
            </div>
            <br>
            
            </form>
            </div>
            <div align="center">
<nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	
    <li>
    	<c:forEach  begin="1"  end="${pageCount }" var="i">
    	<a href="rank.ok?page=${i}">${i }</a>
    	</c:forEach>
    </li>
    

    
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

	<div align="center">
	<input class="btn btn-info" type="button" value="처음으로" onclick="location.href='./rank.ok?page=1'">
	</div>


</div>
          </div><!--/row-->
		</div>
	</div>
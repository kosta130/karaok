<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
		<div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
         
         
         <div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
              <h2>공지사항</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>작성일</td>
                  <td><span class="badge bg-red">55%</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
          </div><!--/row-->
		</div>
	</div>
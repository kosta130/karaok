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
                  <th style="width: 50px">번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>등록일</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n" begin="1" end="5">
                <tr>
                  <td>${n.num }</td>
                  <td><a href="/Karaok/notice.ok?action=select&num=${n.num }">${n.subject }</a></td>
               	  <td>${n.nickname }</td>
               	  <td>${n.ndate }</td>
                  <td><span class="badge bg-red">12</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
         
         
         <div class="col-xs-5 col-lg-6">
              <h2>개발자 노트</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 50px">번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${note }" var="n1" begin="1" end="5">
                <tr>
                  <td>${n1.num }</td>
                  <td><a href="note.ok?action=view&num=${n1.num}">${n1.subject }</a></td>
               	  <td>${n1.nickname }</td>
                  <td><span class="badge bg-red">12</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
              <h2>자유게시판</h2>
			<table class="table table-bordered">
                <tr>
                  <th style="width: 10px">no</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${free }" var="f" begin="1" end="5">
                <tr>
                  <td>${f.num }</td>
                  <td><a href="crud.ok?action=view&num=${f.num }">${f.subject }</a></td>
               	  <td>${f.ndate }</td>
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
                  <th>등록일</th>
                  <th>조회수</th>
                </tr>
            <c:forEach items="${notice }" var="n">
                <tr>
                  <td>${n.num }</td>
                  <td>${n.subject}</td>
               	  <td>${n.ndate }</td>
                  <td><span class="badge bg-red"></span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-20 col-lg-12">
              <h2>이벤트</h2>
<c:forEach items="${listIng }" var="ing" begin="1" end="1">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div i class="col-lg-7 col-md-7">
						<a href="./event_confirm.ok?action=read&num=${ing.num}">
							 <img width="600" height="250"
								src="./img/${ing.fileName}" alt="">
						</a>	
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-danger">진행중</span>
							</h4>
							<h1>${ing.subject }</h1>
							<h4>기간: ${ing.startDate} ~ ${ing.endDate }</h4>
							<p>${ing.point }</p>
							<!--<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>  -->
						</div>
					</div>

					<hr>
				</div>
			</c:forEach>
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
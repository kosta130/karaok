<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>


 

<style type="text/css">
 #faq_list {border-bottom:1px solid #ccc}
 #faq_list li {border-top:1px solid #ccc; padding:0 5px}
 #faq_list li h4 a {display:block; padding:8px}
 #faq_list li p {border-top:1px dotted #eaeaea; padding:8px; line-height:18px}
 #faq_list li.unfold h4 a {font-weight:bold}
 #faq_list li.fold p {display:none}
 </style>


 <script type="text/javascript">
 jQuery(function($){
  var faqList = $("#faq_list>li"); //리스트를 변수로 저장
 faqList.attr("class","fold"); //dom이 로딩되면 다 접어서 닫아준다
 function unfoldFaq(){
   if($(this).parent().parent("li").hasClass("unfold")){ //열려있으면
    $(this).parent().parent("li").removeClass("unfold").addClass("fold"); //닫아주고
  } else { //닫혀있으면
   faqList.attr("class","fold"); //다른 리스트는 닫아주고
   $(this).parent().parent("li").removeClass("fold").addClass("unfold"); //클릭한 리스트는 열어준다
  }
  }
  faqList.find(">h4>a").click(unfoldFaq);
  
  
 });

 </script>

 
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-center">
			<div class="row">
		<div class="col-xs-5 col-lg-6">
              <h2><span class="glyphicon glyphicon-ok-sign" style="color:green">공지사항</span>
              <c:forEach begin="1" end="31">
              &nbsp
              </c:forEach>
              <small><small><a href="notice.ok?action=list">더보기</a></small></small></h2>
              
              
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
              <h2><span class="glyphicon glyphicon-info-sign" style="color:skyblue">개발자노트</span>
              <c:forEach begin="1" end="28">
              &nbsp
              </c:forEach>
              <small><small><a href="">더보기</a></small></small></h2>
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
           <h2><span class="glyphicon glyphicon-time" style="color:orange">자유게시판</span>
              <c:forEach begin="1" end="28">
              &nbsp
              </c:forEach>
              <small><small><a href="free_list.ok">더보기</a></small></small></h2>
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
           <h2><span class="glyphicon glyphicon-question-sign" style="color:blue">자주묻는질문</span>
              <c:forEach begin="1" end="26">
              &nbsp
              </c:forEach>
              <small><small><a href="faq_list.ok?page=1">더보기</a></small></small></h2>
<ul id="faq_list" >
<c:forEach items="${faq}" var="f" begin="1" end="4">
  <li>
      <h4><a href="#a1">&nbsp${f.subject }</a></h4>
         <p>
         <c:if test="${f.fileName!=null }">
  		<img  src="./img/${f.fileName }"><br>
  		</c:if>
         ${f.contents }</p>
     </li>
   </c:forEach>
 </ul>
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-20 col-lg-12">
              
              <h2><span class="glyphicon glyphicon-exclamation-sign" style="color:red">이벤트</span></h2>     
             <hr>
<c:forEach items="${listIng }" var="ing" begin="2" end="2">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div i class="col-lg-7 col-md-7">
						<a href="./event_confirm.ok?action=read&num=${ing.num}">
							 <img width="550" height="250"
								src="./img/${ing.fileName}" alt="">
						</a>	
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-danger">진행중</span>
										 <c:forEach begin="1" end="49">
              									&nbsp
              							 </c:forEach>
              							 <small><a href="event_list.ok">더보기</a></small>
								
							</h4>
							<h1>${ing.subject }</h1><hr>
							<h4>기간: ${ing.startDate} ~ ${ing.endDate }</h4><hr>
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
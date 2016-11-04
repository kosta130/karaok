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
 
<style type="text/css">
body {background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: right bottom;
      background-color: beige;
}
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
              <h2><span class="glyphicon glyphicon-ok-sign" style="color:black">공지사항</span>
              <c:forEach begin="1" end="31">
              &nbsp
              </c:forEach>
              <small><small><a href="notice.ok?action=list">더보기</a></small></small></h2>
              
              
			<table class="table table-bordered">
                <tr style="background-color: #1DDB16;">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
            <c:forEach items="${notice}" var="n">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n.num }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="/Karaok/notice.ok?action=select&num=${n.num }">${n.subject }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n.nickname }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n.ndate }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n.hits }</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
         
         
         <div class="col-xs-5 col-lg-6">
              <h2><span class="glyphicon glyphicon-info-sign" style="color:black">개발자노트</span>
              <c:forEach begin="1" end="28">
              &nbsp
              </c:forEach>
              <small><small><a href="note.ok?action=list">더보기</a></small></small></h2>
			<table class="table table-bordered">
                <tr style="background-color: #FF5E00">
                  <th style="width: 50px">번호</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
            <c:forEach items="${note }" var="n1">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n1.num }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="note.ok?action=view&num=${n1.num}">${n1.subject }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n1.nickname }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${n1.ndate }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${n1.hits}</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
<div class="col-xs-5 col-lg-6">
           <h2><span class="glyphicon glyphicon-time" style="color:black">자유게시판</span>
              <c:forEach begin="1" end="28">
              &nbsp
              </c:forEach>
              <small><small><a href="free_list.ok">더보기</a></small></small></h2>
			<table class="table table-bordered">
                <tr style="background-color: #FF4848;">
                  <th style="width: 10px">no</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">등록일</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
           
            <c:forEach items="${free }" var="f">
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${f.num }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><a href="crud.ok?action=view&num=${f.num }">${f.subject }</a></td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${f.nickname }</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${f.ndate }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;"><span class="badge bg-red">${f.hits}</span></td>
                </tr>
              </c:forEach>
         
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->


<div class="col-xs-5 col-lg-6">
              <h2><span class="glyphicon glyphicon-question-sign" style="color:black">1:1문의내역</span>
              <c:forEach begin="1" end="27">
              &nbsp
              </c:forEach>
              <small><small><a href="qna.ok?page=1" id="qna">더보기</a></small></small></h2>
			<table class="table table-bordered">
                <tr style="background-color: #4374D9;">
                  <th style="width: 10px">no</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">제목</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">작성자</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">진행현황</th>
                  <th style="border-collapse: collapse; border:1px #EAEAEA solid;">조회수</th>
                </tr>
             <c:if test="${currentNickName ==null }">
             	<c:forEach begin="1" end="5">
             	<tr>
             		<td colspan="4">로그인이 필요합니다.</td>
             	</tr>
             	</c:forEach>
             </c:if>
            <c:forEach items="${qna }" var="q" >
                <tr>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${q.num }</td>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${q.subject}
                  <c:if test="${q.reply_count!=0}">
                  <font color="red">[${q.reply_count}]</font>
                  </c:if>
                  </td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${q.nickname }</td>
               	 <td>
               	          <c:choose>
         <c:when test="${q.reply_count>0 }">
         <span class="label label-primary">답변완료</span>
         </c:when>
         <c:otherwise>
          <span class="label label-default">답변대기</span>
         </c:otherwise>
         </c:choose>
               	 </td>
                  <td><span class="badge bg-red">${q.hits }</span></td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->







            
<div class="col-xs-5 col-lg-6">
              <h2><span class="glyphicon glyphicon-user" style="color:black">랭킹</span>
              <c:forEach begin="1" end="35">
              &nbsp
              </c:forEach>
              <small><small><a href="rank.ok?page=1">더보기</a></small></small></h2>
			<table class="table table-bordered">
                <tr style="background-color: #FF00DD;">
                  <th width="20%" style="border-collapse: collapse; border:1px #EAEAEA solid;">계급</th>
                  <th width="30%" style="border-collapse: collapse; border:1px #EAEAEA solid;">닉네임</th>
                  <th width="20%" style="border-collapse: collapse; border:1px #EAEAEA solid;">점수</th>
                </tr>
            <c:forEach items="${rank }" var="r">
                <tr>
                
                  <c:choose>
            			<c:when test="${r.score>1000 }">
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/c.JPG" width="180"> </td>
            			</c:when>
            			<c:when test="${r.score>800 }">
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/d.JPG" width="180"> </td>
            			</c:when>
            			<c:when test="${r.score>600 }">
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/p.JPG" width="180"> </td>
            			</c:when>
            			<c:when test="${r.score>400 }">
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/g.JPG" width="180"> </td>
            			</c:when>
            			<c:when test="${r.score>200 }">
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/s.JPG" width="180"> </td>
            			</c:when>
            			<c:otherwise>
            			<td align="left" style="border-collapse: collapse; border:1px #EAEAEA solid;"> <img src="./img/b.JPG" width="180"> </td>
            			</c:otherwise>
            			</c:choose>
                  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${r.nickname}</td>
               	  <td style="border-collapse: collapse; border:1px #EAEAEA solid;">${r.score }</td>
                </tr>
              </c:forEach>
              </table>	
            </div><!--/.col-xs-6.col-lg-4-->
            
            <div class="col-xs-5 col-lg-6">
           <h2>
           <div style="background-color: #CB6CFF"><span class="glyphicon glyphicon-question-sign" style="color:black">자주묻는질문</span></div>
              <c:forEach begin="1" end="50">
              &nbsp
              </c:forEach>
              <small><small><a href="faq_list.ok?page=1">더보기</a></small></small></h2>
<ul id="faq_list" >
<c:forEach items="${faq}" var="f" >
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
              
              <h2><div style="background-color: #00C6ED"><span class="glyphicon glyphicon-exclamation-sign" style="color:black" >이벤트</span></h2></div>     
             <hr>
<c:forEach items="${listIng }" var="ing" >
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
            
            
            <div class="col-xs-20 col-lg-12">
              
              <h2><div style="background-color: #FFE400;"><span class="glyphicon glyphicon-exclamation-sign" style="color:black">스크린샷</span></h2></div>     
             <hr>
			<c:forEach items="${screen }" var="s">
				<div class="container">
					<div class="row" style="outline-color: blue;">
								
						<div i class="col-lg-7 col-md-7">
						<a href="screen.ok?action=view&num=${s.num }">
							 <img width="600" height="250" src="./img_soyoung/${s.fileName}" alt="">
						</a>
						</div>
						
						<div class="col-lg-5 col-md-4" align="left">
							
							<h4>
								<span class="label label-danger">No.${s.num }</span>
										 <c:forEach begin="1" end="50">
              									&nbsp
              							 </c:forEach>
              							 <small><a href="screen_list.ok">더보기</a></small>
								
							</h4>
							<h1>${s.subject }</h1> <hr>
							<h5>작성자: ${s.nickname }</h5><hr>
							<h5>날짜: ${s.ndate }</h5><hr> 
							<h5>조회수: ${s.seek }</h5s>
							
						</div>
						
					</div>

					<hr>
				</div>
			</c:forEach>
            </div><!--/.col-xs-6.col-lg-4-->






          </div><!--/row-->
		</div>
	</div>
	

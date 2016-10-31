<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





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
 
 function search(){
	var keyword=$('input[name=keyword]').val();
	if(keyword==''){
		alert('검색할 단어를 입력해주세요.');
		return false;
	}
	location.href="./faq_list.ok?keyword="+keyword;
 }
 
 function previous(){
	 location.href="./faq_list.ok?page=1";
 }
 
 
 
 
 </script>

 





<!-- Custom Tabs -->
<div class="nav-tabs-custom">
<h1><span class="glyphicon glyphicon-question-sign" style="color: blue"></span>  자주묻는 질문</h1><hr>
<div align="center" >
         <div class="box box-solid" style="width: 500px;">
         
            <div class="box-header with-border" >
              <h3 class="box-title">FAQ검색<small>캐치마인드</small></h3>
            </div>
            
            <div class="box-body" >
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
          
	<ul class="nav nav-tabs" >
		<li class="active"><a href="#tab_1" data-toggle="tab">전체</a></li>
		<li><a href="#tab_2" data-toggle="tab">게임관련</a></li>
		<li><a href="#tab_3" data-toggle="tab">설치실행</a></li>
		<li><a href="#tab_4" data-toggle="tab">그래픽카드</a></li>
		<li><a href="#tab_5" data-toggle="tab">서버,패치,렉</a></li>

		<li class="pull-right"><h4><font color="blue">${page}페이지/${pageCount}페이지</font></h4></li>
	</ul>
	<br>
	<div class="tab-content">
		<div class="tab-pane active" id="tab_1">
			<!-------- tab1 자리 --------->
			
<ul id="faq_list" >
<c:forEach items="${list}" var="v">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         ${v.contents }</p>
     </li>
   </c:forEach>
 </ul>
 <div align="center">
<!--  <nav>
  <ul class="pagination pagination-lg">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav> -->
</div>
			
			<!-- /.container -->
		</div>


			<!-------- tab2 자리 --------->
		<div class="tab-pane" id="tab_2">

<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='game' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         ${v.contents }</p>
     </li>
     </c:if>
   </c:forEach>
 </ul>
		</div>

			<!-------- tab3 자리 --------->
		<div class="tab-pane" id="tab_3">
	
	<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='excute' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         ${v.contents }</p>
     </li>
     </c:if>
 </c:forEach>
 </ul>
	
	
	
	
		</div>

			<!-------- tab4 자리 --------->
		<div class="tab-pane" id="tab_4">

<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='graphic' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         ${v.contents }</p>
     </li>
     </c:if>
   </c:forEach>
 </ul>










		</div>
			<!-------- tab5 자리 --------->
		<div class="tab-pane" id="tab_5">
			<ul id="faq_list" >
<c:forEach items="${list }" var="v">
	<c:if test="${v.options=='server' }">
  <li>
      <h4><a href="#a1">${v.subject }</a></h4>
         <p>
         <c:if test="${v.fileName!=null }">
  		<img  src="./img/${v.fileName }"><br>
  		</c:if>
         ${v.contents }</p>
     </li>
     </c:if>
   </c:forEach>
 </ul>
		</div>
	</div>
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
    	<a href="faq_list.ok?page=${i}">${i }</a>
    	</c:forEach>
    </li>
    

    
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
<form action="./faq_create.ok"  >
	<div align="right">
	<input class="btn btn-info" type="button" value="처음으로" onclick="previous()">
	<input class="btn btn-warning" type="submit" value="글등록">
	</div>
</form>

               <ul class="todo-list">
                <li>
                  <span class="text">찾으시는 답변이 없을 경우에는 1:1문의를 이용해 주세요.</span>
               		<button class="btn btn-danger">1:1문의하기</button>
                </li>
              </ul>













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
 </script>

 





<!-- Custom Tabs -->
<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab_1" data-toggle="tab">전체</a></li>
		<li><a href="#tab_2" data-toggle="tab">게임관련</a></li>
		<li><a href="#tab_3" data-toggle="tab">게임관련</a></li>
		<li><a href="#tab_4" data-toggle="tab">그래픽카드</a></li>
		<li><a href="#tab_5" data-toggle="tab">서버,패치,렉</a></li>

		<li class="pull-right"><a href="#" class="text-muted"><i
				class="fa fa-gear"></i></a></li>
	</ul>
	<br>
	<div class="tab-content">
		<div class="tab-pane active" id="tab_1">
			<!-------- tab1 자리 --------->
			
<ul id="faq_list" >
  <li>
      <h4><a href="#a1">faq 제목1 영역입니다.</a></h4>
         <p>faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. </p>
     </li>
  <li>
      <h4><a href="#a2">faq 제목2 영역입니다.</a></h4>
         <p>faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. </p>
     </li>
  <li>
      <h4><a href="#a3">faq 제목3 영역입니다.</a></h4>
         <p>faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. </p>
     </li>
  <li>
      <h4><a href="#a4">faq 제목4 영역입니다.</a></h4>
         <p>faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. </p>
     </li>
  <li>
      <h4><a href="#a5">faq 제목5 영역입니다.</a></h4>
         <p>faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. faq 내용 영역입니다. </p>
     </li>
 </ul>
			
			<!-- /.container -->
		</div>

		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_2">
			<!-------- tab2 자리 --------->
tab2
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_3">
			<!-------- tab3 자리 --------->
			tab3
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_4">
			<!-------- tab4 자리 --------->
			tab4
		</div>
				<!-- /.tab-pane -->ㄴ
		<div class="tab-pane" id="tab_5">
			<!-------- tab5 자리 --------->
			tab5
		</div>
	</div>
</div>
<form action="./faq_create.ok">
	<h3 align="center"><input class="btn btn-warning" type="submit" value="글등록"></h3>
</form>













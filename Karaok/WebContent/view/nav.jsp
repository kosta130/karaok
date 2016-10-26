<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="signUp.jsp" flush="true"/>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script type="text/javascript">
	var link = document.location.href;
	$(document).ready(function(){
		$('#login').click(function(){
			var action = $('#loginForm').attr("action");
			var form_data={
				login_id : $('#login_id').val(),
				login_pwd : $('#login_pwd').val()
			};
			$.ajax({
				type:"POST",
				url:action,
				data:form_data,
				success:function(response){
					if(response.trim()=="success"){
						session
					}
				}
			});
		});
	});
</script>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="main.ok">Keyboard Warrior</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <!-- 게임소식 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게임소식 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="notice.ok?action=list">공지사항</a></li>
            <li class="divider"></li>
            <li><a href="#">개임소개</a></li>
            <li class="divider"></li>
            <li><a href="">개발자노트</a></li>
          </ul>
        </li>
      <!-- 이벤트 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">이 벤 트<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="event_list.ok">이벤트</a></li>
          </ul>
        </li>
      <!-- 커뮤니티 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="free_list.ok">자유게시판</a></li>
            <li class="divider"></li>
            <li><a href="#">랭킹게시판</a></li>
            <li class="divider"></li>
            <li><a href="screen_list.ok">스 크 린 샷</a></li>
          </ul>
        </li>
      <!-- 고객센터 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">QnA</a></li>
            <li class="divider"></li>
            <li><a href="faq_list.ok">FAQ</a></li>
          </ul>
        </li>
        <li></li>
      </ul>
      <form class="navbar-form navbar-left" id="loginForm" action="loginSucceed.ok" method="post">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="아이디" id="login_id" name="login_id" size="15">
          <input type="password" class="form-control" placeholder="비밀번호" id="login_pwd" name="login_pwd" size="15">
        </div>
        <div class="form-group" align="right">
        	<button type="button" class="btn btn-default" id="login">로그인</button>
        	<button type="button" class="btn btn-default" id="logout">로그아웃</button>
        	<button type="button" class="btn btn-default" id="signup" data-target="#layerpop" data-toggle="modal">회원가입</button>
        	<button type="button" class="btn btn-default" id="gamestart">GAME START</button>
        </div>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
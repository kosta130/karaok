<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="signUp.jsp" flush="true"/>
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
      <a class="navbar-brand" href="#">Keyboard Warrior</a>
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
            <li><a href="#">FAQ</a></li>
          </ul>
        </li>
        <li></li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="아이디" id="id" size="15">
          <input type="password" class="form-control" placeholder="비밀번호" id="pwd" size="15">
        </div>
        <div class="form-group" align="right">
        	<button type="button" class="btn btn-default" id="login">로그인</button>
        	<button type="button" class="btn btn-default" id="signup" data-target="#layerpop" data-toggle="modal">회원가입</button>
        	<button type="button" class="btn btn-default" id="gamestart">GAME START</button>
        </div>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
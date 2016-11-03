<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="signUp.jsp" flush="true"/>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script type="text/javascript">
	var link = document.location.href;
	$(document).ready(function(){
		
		$(document).on("keyup","#login_pwd",function(e){
			if(e.keyCode == 13){//엔터입력
				login();
			}
		});
		
		//$('#login').click(function(){
		$(document).on("click","#login",login=function(){
			var action = $('#loginForm').attr("action");
			if($.trim($('#login_id').val()) == ''){
				alert("아이디(email)을 입력해주세요.");
				$("#login_id").focus();
				return;
			}
			
			if($.trim($('#login_pwd').val()) == ''){
				alert("비밀번호를 입력해주세요.");
				$("#login_pwd").focus();
				return;
			}
			
			var form_data = /* $("#loginForm").serialize(); */
			{
				login_id : $('#login_id').val(),
				login_pwd : $('#login_pwd').val()
			};
			
			//로그인 프로세스 호출
			$.ajax({
				type:"POST",
				url:action,
				data:form_data,
				success:function(response){
					currentId = response.currentId;
					currentNickName = response.currentNickName;
					currentInfo = response.currentInfo;
					if(currentId=='null' || currentId == null ||currentId=='' || currentId=='undefined' || currentId ==undefined){//로그인 실패
						alert(response.msg);
						$('#login_id').val('');
						$('#login_pwd').val('');
						
						$('#login').show();
						$('#logout').hide();
						$('#signup').show();
						$('#usernickname').hide();
						$('#login_id').show();
						$('#login_pwd').show();
					}else{//로그인 성공
						alert(response.msg);
					
						$('#loginFormDiv').prepend("<button type='button' class='btn btn-default' id='logout'>로그아웃</button>");
						$('#loginFormDiv').prepend("<span id='usernickname'></span>");
						$('#usernickname').text(currentNickName+'님이 로그인하셨습니다.');
						$('#login').hide();
						$('#logout').show();
						$('#signup').hide();
						$('#usernickname').show();
						$('#login_id').hide();
						$('#login_pwd').hide();
					}
				},
				dataType : "json",
	            error: function(error,status,xhr) {
	               alert('error : '+error
	                     +'\nstatus : '+status
	                     +'\nxhr : '+xhr.statusText);
	            }
			});
		});
		
		$(document).on("click","#signup",function(){
			$('#signupForm').each(function(){
				this.reset();
			});
		});
		
		//$('#logout').click(function(){
		$(document).on("click","#logout",function(){
			//로그인 프로세스 호출
			$.ajax({
				type:"POST",
				url:"logoutSucceed.ok",
				success:function(response){
					alert(response.msg);
					$('#loginFormDiv').prepend("<button type='button' class='btn btn-default' id='signup' data-target='#layerpop' data-toggle='modal'>회원가입</button>");	
					$('#loginFormDiv').prepend("<button type='button' class='btn btn-default' id='login'>로그인</button>");
					$('#loginFormDiv').prepend("<input type='password' class='form-control' placeholder='비밀번호' id='login_pwd' name='login_pwd' size='15'>");
					$('#loginFormDiv').prepend("<input type='text' class='form-control' placeholder='아이디' id='login_id' name='login_id' size='15'>");
						
					$('#logout').hide();
					$('#usernickname').hide();
				},
				dataType : "json",
	            error: function(error,status,xhr) {
	               alert('error : '+error
	                     +'\nstatus : '+status
	                     +'\nxhr : '+xhr.statusText);
	            }
			});
		});
		
		$(document).on("click","#gamestart",function(){
			//현재 로그인 상태 프로세스 호출
			$.ajax({
				type:"POST",
				url:"loginState.ok",
				success:function(response){
					alert(response.msg);
					if(response.state==0){
						return;
					}else if(response.state==2){
						//jQuery 새창 열기
						window.open("mainChat.ok?action=joinGame");
					}
				},
				dataType:"json",
				error: function(error,status,xhr) {
		               alert('error : '+error
		                     +'\nstatus : '+status
		                     +'\nxhr : '+xhr.statusText);
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
      <a class="navbar-brand" href="main.ok" style="vertical-align:middle"><img src="/Karaok/img/logo.png" width="120px" height="30px"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <!-- 게임소식 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: #000000"><font face="한컴 소망 B">게임소식</font> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="notice.ok?action=list">공지사항</a></li>
            <li class="divider"></li>
            <li><a href="introduce.ok">개임소개</a></li>
            <li class="divider"></li>
            <li><a href="note.ok?action=list">개발자노트</a></li>
          </ul>
        </li>
      <!-- 이벤트 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: #000000"><font face="한컴 소망 B">이 벤 트</font><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="event_list.ok">이벤트</a></li>
          </ul>
        </li>
      <!-- 커뮤니티 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: #000000"><font face="한컴 소망 B">커뮤니티</font></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="free_list.ok">자유게시판</a></li>
            <li class="divider"></li>
            <li><a href="rank.ok?page=1">랭킹게시판</a></li>
            <li class="divider"></li>
            <li><a href="screen_list.ok">스 크 린 샷</a></li>
          </ul>
        </li>
      <!-- 고객센터 -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: #000000"><font face="한컴 소망 B">고객센터</font><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="qna.ok?action=qlist">1:1문의</a></li>
            <li class="divider"></li>
            <li><a href="faq_list.ok?page=1">FAQ</a></li>
          </ul>
        </li>
        <li></li>
      </ul>
      <form class="navbar-form navbar-left" id="loginForm" action="loginSucceed.ok" method="post">
        <div class="form-group" align="right" id=loginFormDiv>
         <%if(request.getSession().getAttribute("currentId")==null) {%>
          <input type="text" class="form-control" placeholder="아이디" id="login_id" name="login_id" size="15">
          <input type="password" class="form-control" placeholder="비밀번호" id="login_pwd" name="login_pwd" size="15">
          <button type="button" class="btn btn-default" id="login">로그인</button>
          <button type="button" class="btn btn-default" id="signup" data-target="#layerpop" data-toggle="modal">회원가입</button>	
         <%}else{ %>
        	<span id=usernickname><font color="blue"><b><%=request.getSession().getAttribute("currentNickName") %></b></font><small>님이 로그인하셨습니다</small></span>
        	<button type="button" class="btn btn-default" id="logout">로그아웃</button>
         <%} %>
        	<button type="button" class="btn btn-default" id="gamestart" style="background-color: #FF3636; color: white">GAME START</button>
        </div>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
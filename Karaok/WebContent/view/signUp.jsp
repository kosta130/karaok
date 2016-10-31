<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/Karaok/js/ajax.js"></script>
<script type="text/javascript" src="/Karaok/js/idCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/passCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/passConfirmCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/nameCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/nickNameCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/birthCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/telCheck.js"></script>
<script type="text/javascript">
	function show(elementId){
		var frm = document.getElementById(elementId);
		frm.style.display='';
	}
	function hide(elementId){
		var frm = document.getElementById(elementId);
		frm.style.display='none';
	}
	
</script>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#submit').click(function(){
		if(!idCheck || !passCheck || !passConfirmCheck || !nameCheck || !nickNameCheck || !birthCheck || !telCheck){
			alert("내용을 정확하게 입력해주세요.");
			return;
		}else{
			
			var form_data =
			{
				signup_id : $('#signup_id').val(),
				signup_pass : $('#signup_pass').val(),
				signup_name : $('#signup_name').val(),
				signup_nickname : $('#signup_nickname').val(),
				signup_birth : $('#signup_birth').val(),
				signup_tel : $('#signup_tel').val()
			}
			
			$.ajax({
				type:"POST",
				url:"signUpSucceed.ok",
				data:form_data,
				success:function(response){
					alert(response.msg);
					if(response.state==0){//회원가입실패
					
						return;
					}else if(response.state==1){//회원가입성공
						$('#layerpop').modal("hide");
						return;
					}
				},
				dataType:"json"
			});
		}
	});
	
});
	
</script>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal" id="signupExit2">×</button>
        <!-- header title -->
        <h4 class="modal-title">회원 가입</h4>
      </div>
      <!-- body -->
      <form name="signup" id="signupForm" action="signUpSucceed">
      <div class="modal-body">
이메일(ID)<font color="red">*</font>
<input type="email" class="form-control" placeholder="e-mail" id="signup_id" onkeydown="startSuggestId()">
<div id="suggestId"></div><br>
비밀번호<font color="red">*</font>
<input type="password" class="form-control" placeholder="password" id="signup_pass" onkeydown="startSuggestPass()">
<div id="suggestPass"></div><br>
비밀번호 확인<font color="red">*</font>
<input type="password" class="form-control" placeholder="password-confirm" id="signup_pass_confirm" onkeydown="startSuggestPassConfirm()">
<div id="suggestPassConfirm"></div><br>
이름<font color="red">*</font>
<input type="text" class="form-control" placeholder="name" id="signup_name" onkeydown="startSuggestName()">
<div id="suggestName"></div><br>
별명<font color="red">*</font>
<input type="text" class="form-control" placeholder="nickname" id="signup_nickname" onkeydown="startSuggestNickName()">
<div id="suggestNickName"></div><br>
생년월일<font color="red">*</font>
<input type="text" class="form-control" placeholder="19920308" id="signup_birth" onkeydown="startSuggestBirth()">
<div id="suggestBirth"></div><br>
휴대폰번호<font color="red">*</font>
<input type="text" class="form-control" placeholder="01XOOOOOOOO" id="signup_tel" onkeydown="startSuggestTel()">
<div id="suggestTel"></div><br>
</div>
      <!-- Footer -->
      <div class="modal-footer">
        <input type="button" class="btn btn-default" value="가입" id="submit">
        <input type="reset" class="btn btn-default" value="취소">
        <button type="button" class="btn btn-default" data-dismiss="modal" id=signupExit>닫기</button>
      </div>
      </form> 
    </div>
  </div>
</div>
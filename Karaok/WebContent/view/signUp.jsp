<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/Karaok/js/ajax.js"></script>
<script type="text/javascript" src="/Karaok/js/idCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/passCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/passConfirmCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/nameCheck.js"></script>
<script type="text/javascript" src="/Karaok/js/nickNameCheck.js"></script>
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
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">회원 가입</h4>
      </div>
      <!-- body -->
      <form name="signup">
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
<input type="text" class="form-control" placeholder="YYYY-MM-DD" id="signup_birth" onkeydown="">
<div id="suggestBirth"></div><br>
휴대폰번호<font color="red">*</font>
<input type="text" class="form-control" placeholder="'-'없이 입력하세요." id="signup_tel" onkeydown="">
<div id="suggestTel"></div><br>
</div>
      <!-- Footer -->
      <div class="modal-footer">
        <input type="button" class="btn btn-default" value="가입" id="submit">
        <input type="reset" class="btn btn-default" value="취소">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>
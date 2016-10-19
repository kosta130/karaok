<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/Karaok/js/ajax.js"></script>
<script type="text/javascript" src="/Karaok/js/idCheck.js"></script>
<script type="text/javascript">

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
이메일(ID) 
<input type="email" class="form-control" placeholder="e-mail" id="signup_id" onkeydown="startSuggestId()">
<div id="suggestId"></div><br>
비밀번호
<input type="password" class="form-control" placeholder="password" id="signup_pass" onkeydown=""><br>
비밀번호 확인
<input type="password" class="form-control" placeholder="password-confirm" id="signup_pass_confirm" onkeydown=""><br>
이름
<input type="text" class="form-control" placeholder="name" id="signup_name" onkeydown=""><br>
별명
<input type="text" class="form-control" placeholder="nickname" id="signup_nickname" onkeydown=""><br>
생년월일
<input type="text" class="form-control" placeholder="birthday" id="signup_birth" onkeydown=""><br>
휴대폰번호
<input type="text" class="form-control" placeholder="phone number" id="signup_phone" onkeydown=""><br>
</div>
      <!-- Footer -->
      <div class="modal-footer">
        <input type="button" class="btn btn-default" value="가입" disabled="true" id="submit">
        <input type="reset" class="btn btn-default" value="취소">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div>
</div>
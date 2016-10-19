<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/Karaok/js/ajax.js"></script>
<script type="text/javascript">
	//상태체크
	var checkFirstId=false;//아이디 검색 시작
	var loopSendId=false;//아이디 존재여부 반복 호출
	var idCheck=false;
	
	var lastId='';
	
	function startSuggest(){
		if(!checkFirst){
			setTimeout("sendId()",50);
			loopSendId=true;
		}
		checkFirst=true;
	}//startSuggest
	
	function sendId(){//서버 페이지 요청!!
		if(!loopSendId) return;
		var id = document.signup.signup_id.value;
		if(id==''){
			hide('suggest');
			document.signup.submit.disabled='true';
			lastId='';
			loopSendId=false;
			checkFirst=false;
			idCheck=false;
		}else if(id != lastId){
			lastId = id;
			var params="signup_id="+id;//signup_id=아이디
			sendRequest("idConfirm.ok",params,displayResult,'POST');
		}
		setTimeout("sendId()",50);
	}//sendId
	
	function displayResult(){//콜백함수 : 서버 요청 후 실행할 함수
		if(xhr.readyState==4){//응답데이터 전부 전송 완료
			if(xhr.status == 200){
				var resultText = xhr.responseText;//"0|사용 가능한 이메일입니다."
				var result = resultText.split("|");//result[]={"0","사용가능한 이메일입니다"}
				var state = parseInt(result[0]);
				if(state==0){//msg가 있을때
					var suggest = document.getElementById("suggestId");
					suggest.innerHTML="<font color=green>"+result[1]+"</font>";
					show('suggest');
					idCheck=false;                       
				}else if(state==1){
					var suggest = document.getElementById("suggestId");
					suggest.innerHTML="<font color=red>"+result[1]+"</font>";
					show('suggest');
					idCheck=false;
				}else if(state==2){
					var suggest = document.getElementById("suggestId");
					suggest.innerHTML="<font color=red>"+result[1]+"</font>";
					show('suggest');
					idCheck=true;
				}else{
					hide('suggest');
					idCheck=false;
				}
			}else{
				alert('서버에러: '+xhr.status);
			}
		}
	}
	
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
이메일(ID) 
<input type="email" class="form-control" placeholder="e-mail" id="signup_id" onkeydown="startSuggest()">
<div id="suggest"><div id="suggestId"></div></div><br>
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
//상태체크
var checkFirstPass = false;//비밀번호 검색 시작
var loopSendPass = false;//비밀번호 유효성 반복 호출
var passCheck = false;

var lastPass = '';

function startSuggestPass(){
	if(!checkFirstPass){
		loopSendPass = true;
		setTimeout("sendPass()",50);
	}
	checkFirstPass = true;
}//startSuggest

function sendPass(){//서버 페이지 요청!!
	if(!loopSendPass)
		return;
	var pass = document.signup.signup_pass.value;
	if (pass == ''){
		hide('suggestPass');
		//document.signup.submit.disabled = 'true';
		lastPass = '';
		loopSendPass = false;
		checkFirstPass = false;
		passCheck = false;
	} else if (pass != lastPass){
		lastPass = pass;
		var params = "signup_pass="+pass;//signup_pass=비밀번호
		sendRequest("signUpConfirm.ok",params, displayPassResult);
	}
	setTimeout("sendPass()",50);
}//sendPass

function displayPassResult() {// 콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4) {// 응답데이터 전부 전송 완료
		if (xhr.status == 200) {
			var resultText = xhr.responseText;// "0|사용 가능한 이메일입니다."
			var result = resultText.split("|");// result[]={"0","사용가능한 이메일입니다"}
			var state = parseInt(result[0]);
			if (state >= 3 && state <8) {// msg가 있을때
				var suggest = document.getElementById("suggestPass");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestPass');
				passCheck = false;
			} else if (state == 8) {
				var suggest = document.getElementById("suggestPass");
				suggest.innerHTML = "<font color=green>" + result[1] +"</font>";
				show('suggestPass');
				passCheck = true;
			} else {
				hide('suggestPass');
				passCheck = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
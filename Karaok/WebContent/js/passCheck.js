//상태체크
var checkFirstPass = false;//비밀번호 검색 시작
var loopSendPass = false;//비밀번호 유효성 반복 호출
var passCheck = false;

var lastPass = '';

function startSuggestPass(){
	if(!checkFirstPass){
		setTimeout("sendPass()",50);
		loopSendPass = true;
	}
	checkFirstPass = true;
}//startSuggest

function sendPass(){//서버 페이지 요청!!
	if(!loopSendPass)
		return;
	var pass = document.signup.signup_pass.value;
	if (pass == ''){
		hide('suggest');
		document.signup.submit.disabled = 'true';
		lastPass = '';
		loopSendPass = false;
		checkFirst = false;
		passCheck = false;
	} else if (pass != lastPass){
		lastPass = pass;
		var params = "signup_pass="+pass;//signup_pass=비밀번호
		sendRequest("signUpConfirm.ok",params,)
	}
}
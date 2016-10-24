//상태체크
var checkFirstPassConfirm = false;//비밀번호 확인 체크 시작
var loopSendPassConfirm = false; //비밀번호 확인 일치 반복 호출
var passConfirmCheck = false;

var lastPassConfirm = '';

function startSuggestPassConfirm(){
	if(!checkFirstPassConfirm){
		loopSendPassConfirm = true;
		setTimeout("sendPassConfirm()",50);
	}
	checkFirstPassConfirm = true;
}//startSuggestPassConfirm

function sendPassConfirm(){//서버 페이지 요청!!
	if(!loopSendPass)
		return;
	var pass = document.signup.signup_pass.value;
	var passConfirm = document.signup.signup_pass_confirm.value;
	if(passConfirm == ''){
		hide('suggestPassConfirm');
		lastPassConfirm='';
		loopSendPassConfirm = false;
		checkFirstPassConfirm = false;
		passCheckConfirm = false;
	} else if (passConfirm != lastPassConfirm){
		lastPassConfirm = passConfirm;
		var params = "signup_pass_2="+pass+"&signup_pass_confirm="+passConfirm;
		sendRequest("signUpConfirm.ok",params,displayPassConfirmResult);
	}
	setTimeout("sendPassConfirm()",50);
}//sendPassConfirm

function displayPassConfirmResult(){//콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4){//응답데이터 전부 전송 완료
		if(xhr.status == 200){
			var resultText = xhr.responseText;
			var result = resultText.split("|");
			var state = parseInt(result[0]);
			if (state == 9){
				var suggest = document.getElementById("suggestPassConfirm");
				suggest.innerHTML = "<font color=red>"+result[1]+"</font>";
				show('suggestPassConfirm');
				passConfirmCheck = false;
			}else if (state == 10){
				var suggest = document.getElementById("suggestPassConfirm");
				suggest.innerHTML = "<font color=green>"+result[1]+"</font>";
				show('suggestPassConfirm');
				passConfirmCheck = true;
			}else {
				hide('suggestPassConfirm');
				passCheckConfirm = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
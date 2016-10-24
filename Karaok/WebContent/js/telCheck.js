var checkFirstTel = false;
var loopSendTel = false;
var telCheck = false;

function startSuggestTel(){
	if(!checkFirstTel){
		loopSendTel = true;
		setTimeout("sendTel()",50);
		startSuggestTelConfirm();
	}
	checkFirstTel = true;
}//startSuggest

function sendTel(){//서버 페이지 요청!!
	if(!loopSendTel)
		return;
	var tel = document.signup.signup_tel.value;
	if(tel == ''){
		hide('suggestTel');
		lastTel = '';
		loopSendTel = false;
		checkFirstTel = false;
		telCheck = false;
	}else if (tel != lastTel){
		lastTel = tel;
		var params = "signup_tel="+tel;
		sendRequest("signUpConfirm.ok",params,displayTelResult);
	}
	setTimeout("sendTel()",50);
}//sendTel();

function displayTelResult() {// 콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4) {// 응답데이터 전부 전송 완료
		if (xhr.status == 200) {
			var resultText = xhr.responseText;// "0|사용 가능한 이메일입니다."
			var result = resultText.split("|");// result[]={"0","사용가능한 이메일입니다"}
			var state = parseInt(result[0]);
			if (state == 14) {// msg가 있을때
				var suggest = document.getElementById("suggestPass");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestPass');
				passCheck = false;
			} else if (state == 8) {
				var suggest = document.getElementById("suggestPass");
				suggest.innerHTML = "<font color=green>" + result[1] + "</font>";
				show('suggestPass');
				passCheck = false;
			} else {
				hide('suggestPass');
				passCheck = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
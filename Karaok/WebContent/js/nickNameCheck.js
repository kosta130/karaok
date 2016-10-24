//상태체크
var checkFirstNickName = false;// 닉네임 검색 시작
var loopSendNickName = false;// 닉네임 존재여부/유효성 반복 호출
var nickNameCheck = false;

var lastNickName = '';

function startSuggestNickName(){
	if(!checkFirstNickName){
		loopSendNickName = true;
		setTimeout("sendNickName()",50);
	}
	checkFirstNickName = true;
}// startSuggestNickName

function sendNickName(){
	if(!loopSendNickName)
		return;
	var nickName = document.signup.signup_nickname.value;
	if(nickName == ''){
		hide('suggestNickName');
		lastNickName = '';
		loopSendNickName = false;
		checkFirstNickName = false;
		nickNameCheck = false;
	} else if (nickName != lastNickName){
		lastNickName = nickName;
		var params = "signup_nickname="+nickName;//signup_nickname=닉네임
		sendRequest("signUpConfirm.ok", params, displayNickNameResult);
	}
	setTimeout("sendNickName()",50);
}//sendNickName

function displayNickNameResult() {// 콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4) {// 응답데이터 전부 전송 완료
		if (xhr.status == 200) {
			var resultText = xhr.responseText;// "0|사용 가능한 이메일입니다."
			var result = resultText.split("|");// result[]={"0","사용가능한 이메일입니다"}
			var state = parseInt(result[0]);
			if (state == 11) {// msg가 있을때
				var suggest = document.getElementById("suggestNickName");
				suggest.innerHTML = "<font color=green>" + result[1] + "</font>";
				show('suggestNickName');
				nickNameCheck = true;
			} else if (state == 12) {
				var suggest = document.getElementById("suggestNickName");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestNickName');
				nickNameCheck = false;
			} else if (state == 13) {
				var suggest = document.getElementById("suggestNickName");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestNickName');
				nickNameCheck = false;
			} else {
				hide('suggestNickName');
				nickNameCheck = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
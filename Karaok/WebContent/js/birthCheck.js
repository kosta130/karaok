//상태체크
var checkFirstBirth = false;//생일 확인 체크 시작
var loopSendBirth = false;//생일 확인 반복 호출
var birthCheck = false;

var lastBirth = '';

function startSuggestBirth(){
	if(!checkFirstBirth){
		loopSendBirth = true;
		setTimeout("sendBirth()",50);
	}
	checkFirstBirth = true;
}//startSuggestBirth

function sendBirth(){//서버 페이지 요청!!
	if(!loopSendBirth)
		return;
	var birth = document.signup.signup_birth.value;
	if(birth == ''){
		hide('suggestBirth');
		lastBirth='';
		loopSendBirth = false;
		checkFirstBirth = false;
		birthCheck = false;
	} else if (birth != lastBirth){
		lastBirth = birth;
		var params = "signup_birth="+birth;
		sendRequest("signUpConfirm.ok",params,displayBirthResult);
	}
	setTimeout("sendBirth()",50);
}//sendBirth

function displayBirthResult(){//콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4){//응답데이터 전부 전송 완료
		if(xhr.status == 200){
			var resultText = xhr.responseText;
			var result = resultText.split("|");
			var state = parseInt(result[0]);
			if (state == 14){
				var suggest = document.getElementById("suggestBirth");
				suggest.innerHTML = "<font color=red>"+result[1]+"</font>";
				show('suggestBirth');
				birthCheck = false;
			}else if (state == 15){
				var suggest = document.getElementById("suggestBirth");
				suggest.innerHTML = "<font color=green>"+result[1]+"</font>";
				show('suggestBirth');
				birthCheck = true;
			}else {
				hide('suggestBirth');
				birthCheck = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
//상태체크
var checkFirstId = false;// 아이디 검색 시작
var loopSendId = false;// 아이디 존재여부/유효성 반복 호출
var idCheck = false;

var lastId = '';

function startSuggestId() {
	if (!checkFirstId) {
		loopSendId = true;
		setTimeout("sendId()", 50);
	}
	checkFirstId = true;
}// startSuggest

function sendId() {// 서버 페이지 요청!!
	if (!loopSendId)
		return;
	var id = document.signup.signup_id.value;
	if (id == '') {
		hide('suggestId');
		lastId = '';
		loopSendId = false;
		checkFirstId = false;
		idCheck = false;
	} else if (id != lastId) {
		lastId = id;
		var params = "signup_id=" + id;// signup_id=아이디
		sendRequest("signUpConfirm.ok", params, displayIdResult, 'POST');
	}
	setTimeout("sendId()", 50);
}// sendId

function displayIdResult() {// 콜백함수 : 서버 요청 후 실행할 함수
	if (xhr.readyState == 4) {// 응답데이터 전부 전송 완료
		if (xhr.status == 200) {
			var resultText = xhr.responseText;// "0|사용 가능한 이메일입니다."
			var result = resultText.split("|");// result[]={"0","사용가능한 이메일입니다"}
			var state = parseInt(result[0]);
			if (state == 0) {// msg가 있을때
				var suggest = document.getElementById("suggestId");
				suggest.innerHTML = "<font color=green>" + result[1] + "</font>";
				show('suggestId');
				idCheck = true;
			} else if (state == 1) {
				var suggest = document.getElementById("suggestId");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestId');
				idCheck = false;
			} else if (state == 2) {
				var suggest = document.getElementById("suggestId");
				suggest.innerHTML = "<font color=red>" + result[1] + "</font>";
				show('suggestId');
				idCheck = false;
			} else {
				hide('suggestId');
				idCheck = false;
			}
		} else {
			alert('서버에러: ' + xhr.status);
		}
	}
}
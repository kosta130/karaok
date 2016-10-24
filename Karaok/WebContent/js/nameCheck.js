var nameCheck = false;

function startSuggestName(){
	var name = document.signup.signup_name.value;
	if(name.length>0)
		nameCheck = true;
	else
		nameCheck = false;
}
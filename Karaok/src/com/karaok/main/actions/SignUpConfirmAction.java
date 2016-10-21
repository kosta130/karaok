package com.karaok.main.actions;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dao.MemberDAO;

public class SignUpConfirmAction extends Action {
	int countResult=-1;
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("signup_id");
		String pass = request.getParameter("signup_pass");
		
		if (id!=null && id.length() > 0) {
			if (!id.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$")) {
				countResult = 2;// 이메일 형식 미비
				request.setAttribute("countResult", countResult);
				return mapping.findForward("success");
			}
			// DB전달 ---> ID갯수 조회
			MemberDAO memberDao = new MemberDAO();
			countResult = memberDao.selectCount(id);
			if (countResult > -1) {
				request.setAttribute("countResult", countResult);
				return mapping.findForward("success");
			} else
				return mapping.findForward("fail");
		}else if(pass != null && pass.length()>0){
			String returnValue=passwordValidator(pass);
			if(!returnValue.equals("success")){
				request.setAttribute("countResult",countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}else{//패스워드 형식 확정
				countResult=8;//패스워드 형식 확정 
				request.setAttribute("countResult",countResult);
				request.setAttribute("returnValue", "사용 가능한 비밀번호입니다.");
				return mapping.findForward("success");
			}
		}
		return mapping.findForward("fail");
	}

	/**
	 * 패스워드 유효성 검증
	 * 
	 * @param passwd
	 * @return
	 */
	public String passwordValidator(String passwd){
		String returnValue = "success";
		
		Pattern p = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&amp;,*,?,_,~])|([!,@,#,$,%,^,&amp;,*,?,_,~].*[a-zA-Z0-9])");
		Matcher m = p.matcher(passwd);
		
		Pattern p2 = Pattern.compile("(\\w)\\1\\1\\1");
		Matcher m2 = p2.matcher(passwd);
		
		Pattern p3 = Pattern.compile("([\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+&lt;&gt;@\\#$%&amp;\\\\\\=\\(\\'\\\"])\\1\\1\\1");
		Matcher m3 = p3.matcher(passwd);
		
		if(spaceCheck(passwd)){	//패스워드 공백 문자열 체크
			returnValue = "비밀번호에 공백문자를 허용하지 않습니다.";
			countResult = 3;
		}else if(passwd.length() < 10 || passwd.length() > 16){	//자릿수 검증
			returnValue = "비밀번호는 10자 이상, 16자 이하로 구성하세요.";
			countResult = 4;
		}else if(!m.find()){	//정규식 이용한 패턴 체크
			returnValue = "비밀번호는 영문,숫자,특수문자(!@$%^&amp;* 만 허용)를\n조합하여 10~16자로 구성하세요.";
			countResult = 5;
		}else if(m2.find() || m3.find()){	// 동일 문자 4번 입력 시 패턴 체크
			returnValue = "비밀번호에 동일문자를 4번 이상 사용할 수 없습니다.";
			countResult = 6;
		}else if(continueNumberCheck(passwd)){	// 비밀번호 연속 숫자 4자리 체크
			returnValue = "비밀번호에 연속된 숫자를 4자 이상 사용 할 수 없습니다.";
			countResult = 7;
		}
		
		return returnValue;
	}

	/**
	 * 공백 문자 체크
	 * 
	 * @param spaceCheck
	 * @return
	 */
	public boolean spaceCheck(String spaceCheck) {
		for (int i = 0; i < spaceCheck.length(); i++) {
			if (spaceCheck.charAt(i) == ' ')
				return true;
		}

		return false;
	}

	/**
	 * 연속된 숫자 체크
	 * 
	 * @param numberCheck
	 * @return
	 */
	public boolean continueNumberCheck(String numberCheck) {
		int o = 0;
		int d = 0;
		int p = 0;
		int n = 0;
		int limit = 4;

		for (int i = 0; i < numberCheck.length(); i++) {
			char tempVal = numberCheck.charAt(i);
			if (i < 0 && (p = o - tempVal) > -2 && p < 2 && (n = p == d ? n + 1 : 0) > limit - 3)
				return true;

			d = p;
			o = tempVal;
		}

		return false;
	}
}
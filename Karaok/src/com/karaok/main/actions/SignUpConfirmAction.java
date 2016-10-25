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
	int countResult = -1;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String id = request.getParameter("signup_id");
		String pass = request.getParameter("signup_pass");
		String pass2 = request.getParameter("signup_pass_2");
		String passConfirm = request.getParameter("signup_pass_confirm");
		String nickName = request.getParameter("signup_nickname");
		String birth = request.getParameter("signup_birth");
		String tel = request.getParameter("signup_tel");

		if (id != null && id.length() > 0) {
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
			}
		} else if (pass != null && pass.length() > 0) {
			String returnValue = passwordValidator(pass);
			if (!returnValue.equals("success")) {
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			} else {// 패스워드 형식 확정
				countResult = 8;// 패스워드 형식 확정
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", "사용 가능한 비밀번호입니다.");
				return mapping.findForward("success");
			}
		} else if (pass2 != null && passConfirm != null && pass2.length() > 0 && passConfirm.length() > 0) {
			String returnValue = null;// 비밀번호-비밀번호확인 일치여부
			if (pass2.equals(passConfirm)) {
				countResult = 10;
				returnValue = "비밀번호가 일치합니다.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			} else {
				countResult = 9;
				returnValue = "비밀번호가 일치하지 않습니다.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
		} else if (pass2 == null && passConfirm != null && passConfirm.length() > 0) {
			String returnValue = null;// 비밀번호-비밀번호확인 일치여부

			countResult = 9;
			returnValue = "비밀번호를 입력해주세요.";
			request.setAttribute("countResult", countResult);
			request.setAttribute("returnValue", returnValue);
			return mapping.findForward("success");

		} else if (nickName != null && nickName.length() > 0) {
			String returnValue = null;//
			if (nickName.length() < 2 || nickName.length() > 5) {
				countResult = 13;// 이메일 형식 미비
				returnValue = "별명은 2자 이상 5자 이하로 입력해야합니다.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
			// DB전달 ---> ID갯수 조회
			MemberDAO memberDao = new MemberDAO();
			countResult = memberDao.selectNickNameCount(nickName);
			if (countResult > -1) {
				if (countResult == 1) {
					countResult = 12;
					returnValue = "이미 존재하는 별명입니다.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				} else if (countResult == 0) {
					countResult = 11;
					returnValue = "사용 가능한 별명입니다.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}
			}
		} else if (birth != null && birth.length() > 0) {
			String returnValue = null;
			if (birth.matches("^[0-9]{8}$")) {
				int year = Integer.parseInt(birth.substring(0, 4));
				int month = Integer.parseInt(birth.substring(4, 6));
				int day = Integer.parseInt(birth.substring(6, 8));
				if (year < 1900 || year > 2999 || month < 0 || month > 12 || day < 0 || day > 31) {
					countResult = 14;
					returnValue = "날짜 형식에 맞지 않습니다.(YYYYMMDD)";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				} else {
					countResult = 15;
					returnValue = "날짜 형식에 맞는 데이터입니다.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}
			} else {
				countResult = 14;
				returnValue = "날짜 형식에 맞지 않습니다.(YYYYMMDD)";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
		} else if (tel != null && tel.length() > 0) {
			String returnValue = null;
			if (tel.matches("^[0-9]{11}") || tel.matches("^[0-9]{10}")) {
				String head = tel.substring(0, 3);
				System.out.println(head);
				
				if(head.equals("010")||head.equals("011")||head.equals("016")||head.equals("017")||head.equals("018")||head.equals("019")){
					countResult = 17;
					returnValue = "입력 가능한 전화번호입니다.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}else{
					countResult = 16;
					returnValue = "존재하지 않는 전화번호형식입니다.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}
			} else {
				countResult = 16;
				returnValue = "존재하지 않는 전화번호형식입니다.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
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
	public String passwordValidator(String passwd) {
		String returnValue = "success";

		Pattern p = Pattern
				.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&amp;,*,?,_,~]+)|([!,@,#,$,%,^,&amp;,*,?,_,~]+.*[a-zA-Z0-9])");
		Matcher m = p.matcher(passwd);

		Pattern p2 = Pattern.compile("(\\w)\\1\\1\\1");
		Matcher m2 = p2.matcher(passwd);

		Pattern p3 = Pattern
				.compile("([\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+&lt;&gt;@\\#$%&amp;\\\\\\=\\(\\'\\\"])\\1\\1\\1");
		Matcher m3 = p3.matcher(passwd);

		if (spaceCheck(passwd)) { // 패스워드 공백 문자열 체크
			returnValue = "비밀번호에 공백문자를 허용하지 않습니다.";
			countResult = 3;
		} else if (passwd.length() < 10 || passwd.length() > 16) { // 자릿수 검증
			returnValue = "비밀번호는 10자 이상, 16자 이하로 구성하세요.";
			countResult = 4;
		} else if (!m.find()) { // 정규식 이용한 패턴 체크
			returnValue = "비밀번호는 영문,숫자,특수문자(!@$%^&amp;* 만 허용)를\n조합하여 10~16자로 구성하세요.";
			countResult = 5;
		} else if (m2.find() || m3.find()) { // 동일 문자 4번 입력 시 패턴 체크
			returnValue = "비밀번호에 동일문자를 4번 이상 사용할 수 없습니다.";
			countResult = 6;
		} else if (continueNumberCheck(passwd)) { // 비밀번호 연속 숫자 4자리 체크
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
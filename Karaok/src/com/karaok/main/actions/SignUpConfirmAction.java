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
				countResult = 2;// �̸��� ���� �̺�
				request.setAttribute("countResult", countResult);
				return mapping.findForward("success");
			}
			// DB���� ---> ID���� ��ȸ
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
			} else {// �н����� ���� Ȯ��
				countResult = 8;// �н����� ���� Ȯ��
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", "��� ������ ��й�ȣ�Դϴ�.");
				return mapping.findForward("success");
			}
		} else if (pass2 != null && passConfirm != null && pass2.length() > 0 && passConfirm.length() > 0) {
			String returnValue = null;// ��й�ȣ-��й�ȣȮ�� ��ġ����
			if (pass2.equals(passConfirm)) {
				countResult = 10;
				returnValue = "��й�ȣ�� ��ġ�մϴ�.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			} else {
				countResult = 9;
				returnValue = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
		} else if (pass2 == null && passConfirm != null && passConfirm.length() > 0) {
			String returnValue = null;// ��й�ȣ-��й�ȣȮ�� ��ġ����

			countResult = 9;
			returnValue = "��й�ȣ�� �Է����ּ���.";
			request.setAttribute("countResult", countResult);
			request.setAttribute("returnValue", returnValue);
			return mapping.findForward("success");

		} else if (nickName != null && nickName.length() > 0) {
			String returnValue = null;//
			if (nickName.length() < 2 || nickName.length() > 5) {
				countResult = 13;// �̸��� ���� �̺�
				returnValue = "������ 2�� �̻� 5�� ���Ϸ� �Է��ؾ��մϴ�.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
			// DB���� ---> ID���� ��ȸ
			MemberDAO memberDao = new MemberDAO();
			countResult = memberDao.selectNickNameCount(nickName);
			if (countResult > -1) {
				if (countResult == 1) {
					countResult = 12;
					returnValue = "�̹� �����ϴ� �����Դϴ�.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				} else if (countResult == 0) {
					countResult = 11;
					returnValue = "��� ������ �����Դϴ�.";
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
					returnValue = "��¥ ���Ŀ� ���� �ʽ��ϴ�.(YYYYMMDD)";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				} else {
					countResult = 15;
					returnValue = "��¥ ���Ŀ� �´� �������Դϴ�.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}
			} else {
				countResult = 14;
				returnValue = "��¥ ���Ŀ� ���� �ʽ��ϴ�.(YYYYMMDD)";
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
					returnValue = "�Է� ������ ��ȭ��ȣ�Դϴ�.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}else{
					countResult = 16;
					returnValue = "�������� �ʴ� ��ȭ��ȣ�����Դϴ�.";
					request.setAttribute("countResult", countResult);
					request.setAttribute("returnValue", returnValue);
					return mapping.findForward("success");
				}
			} else {
				countResult = 16;
				returnValue = "�������� �ʴ� ��ȭ��ȣ�����Դϴ�.";
				request.setAttribute("countResult", countResult);
				request.setAttribute("returnValue", returnValue);
				return mapping.findForward("success");
			}
		}
		return mapping.findForward("fail");
	}

	/**
	 * �н����� ��ȿ�� ����
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

		if (spaceCheck(passwd)) { // �н����� ���� ���ڿ� üũ
			returnValue = "��й�ȣ�� ���鹮�ڸ� ������� �ʽ��ϴ�.";
			countResult = 3;
		} else if (passwd.length() < 10 || passwd.length() > 16) { // �ڸ��� ����
			returnValue = "��й�ȣ�� 10�� �̻�, 16�� ���Ϸ� �����ϼ���.";
			countResult = 4;
		} else if (!m.find()) { // ���Խ� �̿��� ���� üũ
			returnValue = "��й�ȣ�� ����,����,Ư������(!@$%^&amp;* �� ���)��\n�����Ͽ� 10~16�ڷ� �����ϼ���.";
			countResult = 5;
		} else if (m2.find() || m3.find()) { // ���� ���� 4�� �Է� �� ���� üũ
			returnValue = "��й�ȣ�� ���Ϲ��ڸ� 4�� �̻� ����� �� �����ϴ�.";
			countResult = 6;
		} else if (continueNumberCheck(passwd)) { // ��й�ȣ ���� ���� 4�ڸ� üũ
			returnValue = "��й�ȣ�� ���ӵ� ���ڸ� 4�� �̻� ��� �� �� �����ϴ�.";
			countResult = 7;
		}

		return returnValue;
	}

	/**
	 * ���� ���� üũ
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
	 * ���ӵ� ���� üũ
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
package com.teamsalad.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.persistence.M_LoginDAO;

@Service
public class M_LoginServiceImpl implements M_LoginService {
	
	@Inject
	private M_LoginDAO mLdao;
	
	// 로그인
	@Override
	public memberVO memberLogin(memberVO mvo) throws Exception {
		
		System.out.println(" S: memberLogin(memberVO mvo)");
		
		memberVO loginResultMVO = mLdao.memberLogin(mvo);
		
		return loginResultMVO;
		
	}
	
	// 구글 로그인
	@Override
	public memberVO googleLogin(memberVO mvo) throws Exception {
		
		System.out.println(" S: googleLogin(memberVO mvo)");
		
		memberVO googleLoginResultMVO = mLdao.googleLogin(mvo);
		
		return googleLoginResultMVO;
	}

	@Override
	public void googleJoin(memberVO mvo) throws Exception {
		
		System.out.println(" S: googleJoin(memberVO mvo)");
		
		mLdao.googleJoin(mvo);

		
	}
	
	// 비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(memberVO vo, String div) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "teamsalad2021@gmail.com";
		String hostSMTPpwd = "czdntotuphrplnyo";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "teamsalad2021@gmail.com";
		String fromName = "teamsalad2021@gmail.com";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getM_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getM_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getM_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, memberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		memberVO ck = mLdao.readMember(vo.getM_id());
		System.out.println("vo"+vo);
		System.out.println("ck"+ck);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (mLdao.readMember(vo.getM_id()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getM_email().equals(ck.getM_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setM_pw(pw);
			// 비밀번호 변경
			mLdao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}

	}


}

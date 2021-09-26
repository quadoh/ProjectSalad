package com.teamsalad.service;

import com.teamsalad.domain.memberVO;

public interface M_LoginService {

	// 로그인
	public memberVO memberLogin(memberVO mvo) throws Exception;
	
	// 구글로그인
	public memberVO googleLogin(memberVO mvo) throws Exception;
	
	// 구글 회원가입
	public void googleJoin(memberVO mvo) throws Exception;

}

package com.teamsalad.service;

import javax.inject.Inject;

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






}

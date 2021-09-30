package com.teamsalad.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamsalad.domain.memberVO;
import com.teamsalad.persistence.M_JoinDAO;
import com.teamsalad.persistence.M_JoinDAOImpl;

@Service
public class M_JoinServiceImpl implements M_JoinService{
	
	@Inject
	private M_JoinDAO mdao;
	
	// 회원가입
	@Override
	public void memberJoin(memberVO vo) {

		System.out.println("S : DAO-insertMember(vo) 호출(연결)");
		
		mdao.insertMember(vo);
		
		System.out.println(" S : 회원가입 처리 완료! ");
	}

	
	// 아이디 중복 검사
	@Override
	public int idCheck(String m_id) throws Exception {
		
		return mdao.idCheck(m_id);
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

package com.teamsalad.persistence;

import com.teamsalad.domain.memberVO;

public interface M_JoinDAO {
	
	// 회원가입
	public void insertMember(memberVO vo);

	// 아이디 중복 검사
	public int idCheck(String m_id);

	
	
	
	
	
}
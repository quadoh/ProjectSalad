package com.teamsalad.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.memberVO;

//@Repository : DAO역할의 파일설정 ( 스프링에 해당 파일이 DAO라고 설정 )
//=> root-context.xml에서 bean으로 인식

@Repository
public class M_JoinDAOImpl implements M_JoinDAO {
	// DAO 객체 역할
	
	@Inject
	private SqlSession sqlSession;
	
	// M_JoinMapper.xml 파일에 접근가능한 이름(주소)
	private static final String namespace = "com.teamsalad.mapper.M_JoinMapper";

	
	@Override
	public void insertMember(memberVO vo) {
		
		
		System.out.println(" DAO : insertMember(vo) 메서드 호출 ");
		System.out.println(" DAO : M_JoinMapper.xml 이동 해당 구문 수행 ");
		
		sqlSession.insert(namespace+".insertMember", vo);
		
		System.out.println(" DAO : M_JoinMapper.xml-insertMember 구문 실행 완료 ");
		System.out.println(" DAO : 회원가입 완료 ");
	}


	@Override
	public int idCheck(String m_id) {
		
		return sqlSession.selectOne(namespace+".idCheck", m_id);
	}


	

	
	
	
	
	
	
	
	

}

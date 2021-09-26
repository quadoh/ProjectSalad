package com.teamsalad.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;

@Repository
public class M_LoginDAOImpl implements M_LoginDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(M_LoginDAOImpl.class);
	
	// AdminMapper.xml 파일에 접근가능한 이름(주소)
	private static final String namespace = "com.teamsalad.mapper.M_LoginMapper";

	@Override
	public memberVO memberLogin(memberVO mvo) throws Exception {
		
		logger.info(" DAO : memberLogin(memberVO mvo) 호출 " );
		
		memberVO loginResultMVO = sqlSession.selectOne(namespace+".memberLogin",mvo);
				
		return loginResultMVO;
	}
	
	// 구글 로그인
	@Override
	public memberVO googleLogin(memberVO mvo) throws Exception {
		
		logger.info(" DAO : googleLogin(memberVO mvo) 호출 " );
		
		memberVO googleLoginResultMVO = sqlSession.selectOne(namespace+".googleLogin",mvo);
				
		return googleLoginResultMVO;
	}

	// 구글 회원가입
	@Override
	public void googleJoin(memberVO mvo) throws Exception {

		logger.info(" DAO : googleJoin(memberVO mvo) 호출 ");

		sqlSession.insert(namespace + ".googleJoin", mvo);

		logger.info(" DAO : google 회원가입 완료 ");
	}
	





}

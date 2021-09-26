package com.teamsalad.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.customerBoardVO;

//@Repository : 해당 클래스가 DAO객체의 역활을 하도록 등록(root-context.xml)

@Repository
public class CSDAOImpl implements CSDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger
		= LoggerFactory.getLogger(CSDAOImpl.class);
	
	// Mapper 파일을 구분하기 위한 사용자 지정 고유값
	private static final String namespace = "com.teamsalad.mapper.CSMapper";
	
	// 게시판 전체 글 불러오기
	@Override
	public List<customerBoardVO> listALL() throws Exception {

		System.out.println(" DAO : listALL() -> mapper 호출");	
		
		return sqlSession.selectList(namespace+".listALL");
	}
		
	// 게시판 글쓰기
	@Override
	public void create(customerBoardVO CS_vo) throws Exception {

		logger.info(" DAO : create(customerBoardVO CS_vo) 호출 ");
		
		sqlSession.insert(namespace+".create", CS_vo);
		
	}
	
	// 게시판 특정 글 읽기
	@Override
	public customerBoardVO read(Integer customer_b_num) throws Exception {
		
		logger.info(" DAO : read(customer_b_num) 호출");
		
		customerBoardVO CS_vo = sqlSession.selectOne(namespace+".read", customer_b_num);
		
		return CS_vo;
	}
	
	// 게시판 특정 글 수정
	@Override
	public void modify(customerBoardVO CS_vo) throws Exception {
		
		logger.info(" DAO : modify(CS_vo) 호출 ");
		
	    sqlSession.update(namespace+".modify", CS_vo);
	    		
	}

	// 게시판 특정 글 삭제
	@Override
	public void delete(Integer customer_b_num) throws Exception {
		
		logger.info(" DAO : delete(customer_b_num) 호출");
		
		sqlSession.delete(namespace+".delete", customer_b_num);		
		
	}
	
}

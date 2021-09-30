package com.teamsalad.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.ingredientVO;

@Repository
public class R_CustomDAOImpl implements R_CustomDAO{

	// 디비연결처리
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(R_CustomDAOImpl.class);
	
	// Mapper 파일 구분값
	private static final String namespace = "com.teamsalad.mapper.R_CustomMapper";
	
	@Override
	public List<ingredientVO> listAll(int category) throws Exception {
		logger.info(" list(int category) 호출 ");
		
		// mapper에 동작호출
		
		return sqlSession.selectList(namespace+".list",category);
	}
	
	@Override
	public void newCustom(String id) throws Exception {
		// id에 해당하는 커스텀이 없을경우 자동 실행
		logger.info(" newCustom(String id) 호출 ");
		
		//mapper에 동작 호출
		sqlSession.insert(namespace+".newcustom",id);
		
	}
	
	@Override
	public void addCustom(int num) throws Exception {
		logger.info(" addCustom() 호출 ");
		
		//mapper에 동작 호출
	}
}

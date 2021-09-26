package com.teamsalad.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.customerBoardVO;
import com.teamsalad.persistence.CSDAO;

@Service
public class CSServiceImpl implements CSService {

	private static final Logger logger =
			LoggerFactory.getLogger(CSService.class);
	
	@Inject
	private CSDAO bdao;
	
	// 게시판 전체 글 불러오기
	@Override
	public List<customerBoardVO> listALL() throws Exception {
		logger.info(" S : listALL() 호출 -> DAO-");
		logger.info(" S : DAO 처리 완료! 정보 저장후 컨트롤러 이동");
		return bdao.listALL();
	}
	
	// 게시판 글쓰기
	@Override
	public void create(customerBoardVO CS_vo) throws Exception {
		
		logger.info(" S : regist(customerBoardVO CS_vo) 호출 ");
		
		bdao.create(CS_vo);
		
		logger.info(" 글쓰기 완료 -> 컨트롤러 페이지로 이동");
	}

	// 게시판 특정 글 읽기
	@Override
	public customerBoardVO read(Integer customer_b_num) throws Exception {
		
		logger.info( " S : read(Integer customer_b_num) 호출 " );
		
		customerBoardVO CS_vo = bdao.read(customer_b_num);
		
		return CS_vo;
	}
	
	// 게시판 특정 글 수정
	@Override
	public void modify(customerBoardVO CS_vo) throws Exception {
		
		logger.info(" S : modify(customerBoardVO CS_vo) 호출 ");
		
		bdao.modify(CS_vo);
		
	}

	@Override
	public void delete(Integer customer_b_num) throws Exception {
		
		logger.info("  S : delete (Integer customer_b_num) 호출 ");
		
		bdao.delete(customer_b_num);
		
	}
	
	
}

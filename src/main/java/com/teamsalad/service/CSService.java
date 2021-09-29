package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.customerBoardVO;

public interface CSService {
	
	// 게시판 전체 조회
	public List<customerBoardVO> listALL() throws Exception;
	
	// 게시판 페이징 처리 조회
	public List<customerBoardVO> listCri(Criteria cri) throws Exception;
	
	// 게시판 글 전체 목록 조회
	public int countCSBoard(Criteria cri) throws Exception;
	
	// 게시판 글 쓰기 (CRUD - C)
	public void create(customerBoardVO CS_vo) throws Exception;
	
	// 게시판 글 조회 (CRUD - R)
	public customerBoardVO read(Integer customer_b_num) throws Exception;
		
	// 글 정보 수정 (제목,이름,내용)
	public void modify(customerBoardVO CS_vo) throws Exception;
	
	// 게시판 글 삭제 (CRUD - D)
	public void delete(Integer customer_b_num) throws Exception;

}

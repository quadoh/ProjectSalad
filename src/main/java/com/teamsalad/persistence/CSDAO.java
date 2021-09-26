package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.customerBoardVO;

public interface CSDAO {
	
	// 게시판 글 전체 조회
	public List<customerBoardVO> listALL() throws Exception;
		
	// 게시판 글 쓰기 (CRUD - C)
	public void create(customerBoardVO CS_vo) throws Exception;
	
	// 게시판 글 조회 (CRUD - R)
	public customerBoardVO read(Integer customer_b_num) throws Exception;
	
	// 게시판 글 수정(CRUD - U / 제목,내용)
	public void modify(customerBoardVO CS_vo) throws Exception;
		
	// 게시판 글 삭제 (CRUD - D)
	public void delete(Integer customer_b_num) throws Exception;

	
	

}

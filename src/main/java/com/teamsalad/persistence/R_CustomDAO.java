package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.ingredientVO;

public interface R_CustomDAO {

	// 재료 목록 불러오기
	public List<ingredientVO> listAll(int category) throws Exception;
	
	// 레시피 게시판에 글쓰기
	
	// 장바구니에 넣기
	

	
}

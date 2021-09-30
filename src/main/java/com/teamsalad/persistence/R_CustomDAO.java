package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.ingredientVO;

public interface R_CustomDAO {

	// 재료 목록 불러오기
	public List<ingredientVO> listAll(int category) throws Exception;
	
	// 새로운 레시피 만들기
	public void newCustom(String id) throws Exception;
	
	// 레시피에 재료 추가
	public void addCustom(int num) throws Exception;
	
	// 커스텀한 샐러드 불러오기 
	
	// 레시피 게시판에 글쓰기
	
	// 장바구니에 넣기
	
	// 레시피 초기화
	
}

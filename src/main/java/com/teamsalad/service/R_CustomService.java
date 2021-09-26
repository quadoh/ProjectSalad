package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.ingredientVO;

public interface R_CustomService {
	// 재료 목록 불러오기
	public List<ingredientVO> igdtList(int category) throws Exception; 
}

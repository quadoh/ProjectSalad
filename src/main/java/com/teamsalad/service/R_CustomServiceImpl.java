package com.teamsalad.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.ingredientVO;
import com.teamsalad.persistence.R_CustomDAO;

@Service
public class R_CustomServiceImpl implements R_CustomService{
	
	private static final Logger logger = LoggerFactory.getLogger(R_CustomService.class);
	
	@Inject
	private R_CustomDAO rcdao;
	
	@Override
	public List<ingredientVO> igdtList(int category) throws Exception {
		System.out.println(" S : igdtList() 호출 -> DAO");
		
		System.out.println(" S : DAO 처리 완료");
		
		
		return rcdao.listAll(category);
	}
	
	@Override
	public void newCustom(String id) throws Exception {
		System.out.println(" S : newCustom() 호출 -> DAO");
		
		System.out.println(" S : DAO 처리 완료 ");
		
		// 값이 있으면 초기화
//		if() {
//			
//		}
		rcdao.newCustom(id);
		
	}
	
}

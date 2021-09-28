package com.teamsalad.service;

import java.util.List;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.couponVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.recipeVO;

public interface AdminService {
	

	///////////////////////////////////// 관리자 메인 화면 ///////////////////////////////////////////////////////////////
	
	// 최근 주문 목록 7개 조회
	public List<orderVO> getRecentOrder() throws Exception;
	
	// 레시피 게시판 인기 레시피 7개 조회
	public List<recipeBoardVO> getPopularRecipe() throws Exception;
	
	///////////////////////////////////// 회원 관리 ///////////////////////////////////////////////////////////////
	
	// 회원 전체 목록 출력
	public List<memberVO> getMListAll(String m_id) throws Exception;
	
	// 멤버 데이터 페이징 처리
	public List<memberVO> mListCri(Criteria cri) throws Exception;
	
	// 멤버 목록 전체 갯수 조회
	public int countMembers(Criteria cri) throws Exception;
	
	// 회원 개별 정보 조회
	public memberVO getMInfo(String m_id) throws Exception;
	
	// 회원 개별 정보 수정
	public void updateMember(memberVO uvo) throws Exception;
	
	// 회원 개별 정보 삭제
	public void deleteMember(String m_id) throws Exception;
	
	///////////////////////////////////// 주문 관리 ///////////////////////////////////////////////////////////////
	
	// 주문 전체 목록 출력
	public List<orderVO> getOListAll() throws Exception;
	
	// 주문 데이터 페이징 처리
	public List<orderVO> oListCri(Criteria cri) throws Exception;
		
	// 주문 목록 전체 갯수 조회
	public int countOrders(Criteria cri) throws Exception;
	
	// 주문 개별 정보 조회
	public orderVO getOInfo(Integer order_num) throws Exception;
	
	// 주문 개별 정보 수정
	public void updateOrder(orderVO ovo) throws Exception;
	
	// 주문 개별 정보 삭제
	public void deleteOrder(Integer order_num) throws Exception;
	
	///////////////////////////////////// 재료 관리 ///////////////////////////////////////////////////////////////

	// 레시피 재료 전체 정보 페이징 처리 조회
	public List<ingredientVO> igdtListCri(Criteria cri) throws Exception;
			
	// 레시피 재료 목록 전체 갯수 조회
	public int countIngredients(Criteria cri) throws Exception;
	
	// 레시피 재료 등록
	public void igdtRegister(ingredientVO ivo) throws Exception;
	
	// 재료 개별 정보 조회
	public ingredientVO getIgdtInfo(Integer igdt_num) throws Exception;
	
	// 재료 개별 정보 수정
	public void updateIngredient(ingredientVO ivo) throws Exception;
	
	// 개별 재료 정보 삭제
	public void deleteIngredient(Integer igdt_num) throws Exception;
	
	///////////////////////////////////// 쿠폰 관리 ///////////////////////////////////////////////////////////////
	
	// 쿠폰 전체 정보 페이징 처리 조회
	public List<couponVO> couponListCri(Criteria cri) throws Exception;
	
	// 쿠폰 목록 전체 갯수 조회
	public int countCoupons(Criteria cri) throws Exception;
	
	// 쿠폰 발급 회원 전체 목록 조회
	public List<memberVO> getCouponMList(Integer coupon_id) throws Exception;
	
	// 쿠폰 등록
	public void couponRegister(couponVO cvo) throws Exception;
	
	// 쿠폰 개별 정보 조회
	public couponVO getCouponInfo(Integer coupon_id) throws Exception;
	
	// 쿠폰 개별 정보 수정
	public void updateCoupon(couponVO cvo) throws Exception;
	
	// 쿠폰 재료 정보 삭제
	public void deleteCoupon(Integer coupon_id) throws Exception;
	
	// 회원 쿠폰 발급
	public void memberInsertCoupon(memberVO mvo) throws Exception;
	
	////////////////////////////////////////////////////////////판매 성향 정보 관련////////////////////////////////////////////////////////////////////

	// 인기 레시피 게시판 탑텐 조회
	public List<recipeBoardVO> getR_Board_TopList() throws Exception;
	
	// 샐러드 판매량 탑텐 조회
	public List<recipeVO> getSalad_TopList() throws Exception;
	
	

}

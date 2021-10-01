package com.teamsalad.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamsalad.domain.BoardMemberVO;
import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.replyVO;
import com.teamsalad.persistence.R_BoardDAO;

@Service
public class R_BoardServiceImpl implements R_BoardService {
	
	@Inject
	private R_BoardDAO dao;
	
	// 게시물 등록하기
	public void registBoard(recipeBoardVO vo) throws Exception{
		System.out.println("게시물 등록 !");
		
		dao.r_Board_regist(vo);
		
		System.out.println("게시물 등록 끝!");
	}
	
	// 게시물 삭제하기
	public void deleteBoard(int rcp_b_num) throws Exception{
		System.out.println("게시물 삭제 !");
		
		dao.r_Board_delete(rcp_b_num);
		
		System.out.println("게시물 삭제 끝!");
	}
	
	// 게시물 수정하기
	public void modifyBoard(recipeBoardVO vo) throws Exception{
		System.out.println("게시물 수정 !");
		
		dao.r_Board_modify(vo);
		
		System.out.println("게시물 수정 끝!");
	}
	
	// 게시물 리스트 페이지 불러오기
	@Override
	public List<BoardMemberVO> getListPage(int page, int total) throws Exception {
		
		List<BoardMemberVO> vo = dao.r_Board_listPage(page, total);
		
		System.out.println("service 결과확인 :" + vo);
		
		return vo;
	}
	
	// 게시물 자세히 불러오기
	@Override
	public BoardMemberVO getBoardDetail(int rcp_b_num) throws Exception{
		
		BoardMemberVO vo = dao.r_Board_detail(rcp_b_num);
		
		System.out.println(" service 결과확인 : " + vo);
		
		return vo;
		
	}
	
	// 좋아요 확인하기
	@Override
	public boolean checkBoardLike(int rcp_b_num, String m_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.r_Board_likeCheck(rcp_b_num, m_id);
	}
	
	// 좋아요 테이블 추가 게시판 업데이트
	@Override
	public void boardLikeAdd(int rcp_b_num, String m_id) throws Exception {
		// TODO Auto-generated method stub
		
		//
		dao.r_Board_likeInsert(rcp_b_num, m_id);
		dao.r_Board_likeUpdate(rcp_b_num);
		
	}
	
	// 좋아요 테이블 삭제 게시판 좋아요 업데이트
	@Override
	public void boadrLikeCancel(int rcp_b_num, String m_id) throws Exception {
		// TODO Auto-generated method stub
		
		dao.r_Board_likeDelete(rcp_b_num, m_id);
		dao.r_Board_likeDiscount(rcp_b_num);
		
	}
	
	// 주간 인기 품목 가져오기
	@Override
	public List<BoardMemberVO> getWeeklyPopular() throws Exception {
		// TODO Auto-generated method stub
		
		List<BoardMemberVO> vo = dao.r_Board_weeklyPopular();
		
		System.out.println("service 결과확인 :" + vo);
		
		return vo;
	}
	
	//검색한 데이터 불러오기
	@Override
	public List<recipeBoardVO> getSearchData(String column, String data) throws Exception{
		List<Integer> rcp_b_nums = dao.r_Board_searchData(column, ("%" + data + "%"));
		
		if(rcp_b_nums.size() != 0) {
			List<recipeBoardVO> searchTitle = dao.r_Board_searchNum(rcp_b_nums);
			
			System.out.print(" Service Search Data : " + searchTitle.size());
			
			return searchTitle;
		}
		
		return null;
	}
	
	@Override
	public List<replyVO> getBoardReply(int rcp_b_num) throws Exception {
		// TODO Auto-generated method stub
		
		List<replyVO> vo = dao.r_Board_listReply("board", rcp_b_num);
		
		return vo;
	}
	
	@Override
	public void addReply(replyVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		dao.r_Board_addReply(vo);
		
	}
	
	@Override
	public void deleteReply(int reply_b_num) throws Exception {
		// TODO Auto-generated method stub
		
		dao.r_Board_delete(reply_b_num);
		
	}
	
	@Override
	public void modifyReply(int reply_b_num, String reply_b_content) throws Exception {
		// TODO Auto-generated method stub
		
		dao.r_Board_modifyReply(reply_b_content, reply_b_num);
		
	}
	
	@Override
	public int countBoards(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoards(cri);
	}
	
	// 전체 회원 목록 페이징 조회
	@Override
	public List<BoardMemberVO> bListCri(Criteria cri) throws Exception {

		System.out.println("mListCri(Criteria cri) 호출! ");
			
		return dao.bListCri(cri);
		
	}
	
	@Override
	public Object getSearchTotal(String table_name, String data) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("getSearchTotal 시작");
		
		Object returnData = new ArrayList<Object>();
		
		String primary_key = dao.total_getPrimaryKeyName(table_name);
		
		System.out.println(" service : primaryKey name :" + primary_key);
		
		List<String> columns = dao.total_getDBColumn(table_name);
		
		System.out.println(" service : columns count : " + columns.size());
		
		List<Integer> search_num = new ArrayList<Integer>();
		
		for(String column: columns) {
			for(int i: dao.total_searchPrimaryKey(table_name, primary_key, column, data)) {
				search_num.add(i);
			}
		}
		
		System.out.println(" service : search_num count : " + search_num.size() );
		
		if(search_num.size() != 0)
			returnData = dao.total_searchTotal(table_name, primary_key, search_num);
		
		return returnData;
	}
}

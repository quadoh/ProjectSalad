package com.teamsalad.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.teamsalad.domain.BoardMemberVO;
import com.teamsalad.domain.replyVO;
import com.teamsalad.persistence.R_BoardDAO;
//import com.teamsalad.persistence.R_BoardDAOImpl;

@Service
public class R_BoardServiceImpl implements R_BoardService {
	
	@Inject
	private R_BoardDAO dao;
	
	// 게시물 리스트 페이지 불러오기
	@Override
	public List<BoardMemberVO> getListPage(int page, int total) throws Exception {
		
		List<BoardMemberVO> vo = dao.r_Board_listPage(page, total);
		
		System.out.println("service ��� Ȯ�� :" + vo);
		
		return vo;
	}
	
	// 게시물 자세히 불러오기
	@Override
	public BoardMemberVO getBoardDetail(int rcp_b_num) throws Exception{
		
		BoardMemberVO vo = dao.r_Board_detail(rcp_b_num);
		
		System.out.println(" service ��� Ȯ�� : " + vo);
		
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
		
		System.out.println("service ��� Ȯ�� :" + vo);
		
		return vo;
	}
	
	//검색한 데이터 불러오기
	@Override
	public List<String> getSearchData(String column, String data) throws Exception{
		List<String> datas = dao.r_Board_searchData(column, ("%" + data + "%"));
		
		System.out.print(" Service Search Data : ");
		for(String s : datas) {
			System.out.print(s + ",");
		}
		
		return datas;
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
}

package com.teamsalad.persistence;

import java.util.List;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.replyVO;

public interface ReplyDAO {
	
	// 댓글 리스트 보기
	public List<replyVO> replyList(Integer reply_b_main_num) throws Exception; 
	
	// 댓글 작성
	public void create(replyVO rvo) throws Exception; 
	
	// 댓글 수정
	public void update(replyVO rvo) throws Exception; 
	
	// 댓글 삭제
	public void delete(Integer reply_b_num) throws Exception;	
	
	// 댓글 페이징 처리
	public List<replyVO> replyListPaging(Integer reply_b_main_num, Criteria criteria) throws Exception; 
	
	// 댓글 총 갯수 계산
	public int countReplies(Integer reply_b_main_num) throws Exception;

	
	

}

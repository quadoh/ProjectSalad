package com.teamsalad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.replyVO;
import com.teamsalad.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO rdao;

	@Override
	public List<replyVO> replyList(Integer reply_b_main_num) throws Exception {
		
		System.out.println("S : replyList(Integer reply_b_main_num) 호출");
		
		return rdao.replyList(reply_b_main_num);
	}

	@Override
	public void create(replyVO rvo) throws Exception {
		
		System.out.println("S : create(replyVO rvo) 호출");
		
		rdao.create(rvo);
		
	}

	@Override
	public void update(replyVO rvo) throws Exception {
		
		System.out.println("S : update(replyVO rvo) 호출");
		
		rdao.update(rvo);
		
	}

	@Override
	public void delete(Integer reply_b_num) throws Exception {
		
		System.out.println("S : delete(reply_b_num) 호출");
		
		rdao.delete(reply_b_num);
		
	}
	
	// 댓글 페이징 처리
	@Override
	public List<replyVO> replyListPaging(Integer reply_b_main_num, Criteria criteria) throws Exception {
			
		System.out.println("S : replyListPaging(Integer reply_b_main_num, Criteria criteria) 호출");
		return rdao.replyListPaging(reply_b_main_num, criteria);
	}
	
	
	// 댓글 갯수
	@Override
	public int countReplies(Integer reply_b_main_num) throws Exception {
	
		System.out.println("S : countReplies(Integer reply_b_main_num) 호출");
		
		return rdao.countReplies(reply_b_main_num);
	}
	
	

}

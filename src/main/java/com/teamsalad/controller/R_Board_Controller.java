package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamsalad.domain.BoardMemberVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.replyVO;
import com.teamsalad.service.R_BoardService;

@Controller
@RequestMapping("/R_Board/*")
public class R_Board_Controller {
	
	@Inject
	R_BoardService service;
	
//	http://localhost:8090/controller/R_Board/boardList
	@RequestMapping("/boardList")
	public void main(Model model) throws Exception{
		
		List<BoardMemberVO> vo = service.getListPage(0, 5);
		
		System.out.println(" controll ��� Ȯ�� : " + vo);
		model.addAttribute("pages", vo);
	}
	
	@RequestMapping("/board_detail")
	public void boardPage(@RequestParam("rcp_b_num")int rcp_b_num, Model model) throws Exception{
		BoardMemberVO vo = service.getBoardDetail(rcp_b_num);
		List<BoardMemberVO> weeklyPopular = service.getWeeklyPopular();
		
		String m_id = vo.getBoard().getM_id();
		boolean likeCheck = false;

		List<replyVO> comments = service.getBoardReply(rcp_b_num);
		
		if(m_id != null)
			likeCheck = service.checkBoardLike(rcp_b_num, m_id);
		
		
		service.checkBoardLike(rcp_b_num, null);
		
		System.out.println("controll��� Ȯ�� : " + vo);
		System.out.println(" C : " + weeklyPopular.size());
		System.out.println(" C : like = " + likeCheck);
		
		model.addAttribute("board", vo);
		model.addAttribute("weeklyPopular", weeklyPopular);
		model.addAttribute("like", likeCheck);
		model.addAttribute("comments", comments);
	}
	
	@RequestMapping(value = "searchData")
	public @ResponseBody List<String> searchTitle(/*@PathVariable("searchData")*/ String searchData) throws Exception{
		
		System.out.println("검색 데이터!!!!!!!!!!!!!!!!! : " + searchData);
		
		List<String> searchTitle = service.getSearchData("rcp_b_title", searchData);
		
		return searchTitle;
	}
}

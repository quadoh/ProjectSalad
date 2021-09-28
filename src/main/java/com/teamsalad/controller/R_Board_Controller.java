package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
//	게시물 리스트 가져오기
//	http://localhost:8090/controller/R_Board/boardList
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void main(Model model) throws Exception{
		
		List<BoardMemberVO> vo = service.getListPage(0, 5);
		
		System.out.println(" controll ��� Ȯ�� : " + vo);
		model.addAttribute("pages", vo);
	}
	
//	게시물 자세히 보기
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public void boardPage(@RequestParam("rcp_b_num")int rcp_b_num, Model model,  HttpSession session) throws Exception{
		BoardMemberVO vo = service.getBoardDetail(rcp_b_num);
		List<BoardMemberVO> weeklyPopular = service.getWeeklyPopular();
		
		String m_id = (String)session.getAttribute("id");
		
		//로그인에서 scripts 경로 설정 안되서 임시 아이디 설정
		//테스트 아이디 삭제할것
        m_id = "ckck";
		//테스트 아이디 삭제할것
		
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
	
//	좋아요 체크 후 적용하기
	@RequestMapping(value = "/likeCheck", method = RequestMethod.GET)
	public String likeCheck(@RequestParam("rcp_b_num")int rcp_b_num, HttpSession session) throws Exception {
		String m_id = (String)session.getAttribute("id");
		
		System.out.println("likeCheck 시작");
		
		//로그인에서 scripts 경로 설정 안되서 임시 아이디 설정
		//테스트 아이디 삭제할것
        m_id = "ckck";
		//테스트 아이디 삭제할것
		
		if(m_id != null) {
			// 로그인했느냐 체크 후 좋아요 유무 체크하여 좋아요를 이미 했을 경우 삭제
			// 좋아요를 안했을 경우 추가
			if(service.checkBoardLike(rcp_b_num, m_id)) {
				service.boadrLikeCancel(rcp_b_num, m_id);
				System.out.println("좋아요 삭제");
			}
			else {
				service.boardLikeAdd(rcp_b_num, m_id);
				System.out.println("좋아요 추가");
			}
		}
		
		System.out.println("likeCheck 끝");
		
		return "redirect:/R_Board/board_detail?rcp_b_num="+rcp_b_num;
	}
	
	// Rest로 검색 결과 불러오기
	@RequestMapping(value = "searchData")
	public @ResponseBody List<recipeBoardVO> searchTitle(String searchData) throws Exception{
		
		System.out.println("검색 데이터!!!!!!!!!!!!!!!!! : " + searchData);
		
		List<recipeBoardVO> searchTitle = service.getSearchData("rcp_b_title", searchData);
		
		return searchTitle;
	}
	
	@RequestMapping(value = "/totalSearch")
	public void searchPage() {
		
	}
	
	@RequestMapping(value = "searchTotal/{table}")
	public @ResponseBody Object searchTotal(@PathVariable String table, String searchData) throws Exception{
		
		System.out.println("검색 데이터!!!!!!!!!!!!!!!!! : " + searchData);
		System.out.println("검색 테이블!!!!!!!!!!!!!!!!! : " + table);
		
		Object searchTitle = service.getSearchTotal(table, searchData);
		
		return searchTitle;
	}
}

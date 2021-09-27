package com.teamsalad.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamsalad.domain.BoardMemberVO;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.replyVO;

@Repository
public class R_BoardDAOImpl implements R_BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger
	= LoggerFactory.getLogger(R_BoardDAOImpl.class);
	
	private static final String namespace = "com.teamsalad.mapper.R_BoardMapper";
	
	
	// 게시물 등록하기
	public void r_Board_regist(recipeBoardVO vo) throws Exception {
		logger.info(" DAO : board regist 시작");
			
		sqlSession.insert(namespace + ".R_Board_regist", vo);
		
		logger.info(" DAO : board regist 끝");
	}
	
	// 게시물 수정하기
	public void r_Board_modify(recipeBoardVO vo) throws Exception {
		logger.info(" DAO : board modify 시작");
		
		sqlSession.update(namespace + ".R_Board_modify", vo);
		
		logger.info(" DAO : board modify 끝");
	}
	
	// 게시물 삭제
	public void r_Board_delete(int rcp_b_num) throws Exception {
		logger.info(" DAO : board delete 시작");
		
		sqlSession.insert(namespace + ".R_Board_delete", rcp_b_num);
		
		logger.info(" DAO : board delete 끝");
	}
	
	
	// 게시물 가져오기
	public BoardMemberVO r_Board_detail(int rcp_b_num) throws Exception {
			
		logger.info(" DAO : board detail 시작");
			
		BoardMemberVO vo = sqlSession.selectOne(namespace + ".R_Board_detail", rcp_b_num);
			
		logger.info(" DAO : 결과확인 = " + vo);
		
		logger.info(" DAO : board detail 끝");
		
		return vo;
	}
	
	// 게시물 리스트 일부 가져오기
	public List<BoardMemberVO> r_Board_listPage(int page, int total) throws Exception {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("total", total);
		
		logger.info(" DAO : board listPage 시작");
		
		List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_listPage", map);
		
		System.out.println("DAO 결과확인 : " + vo);
		
		logger.info(" DAO : 결과확인 = " + vo.size());
		
		logger.info(" DAO : board listPage 끝");
		
		return vo;
	}
	
	// 주간 인기 게시물 가져오기
	public List<BoardMemberVO> r_Board_weeklyPopular() throws Exception{
		logger.info(" DAO : board weeklyPopular 시작");
		
		List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_weeklyPopular");
		
		logger.info(" DAO : 결과확인 = " + vo.size());
		
		logger.info(" DAO : board weeklyPopular 끝");
		
		return vo;
	}
	
	// 모든 게시물 가져오기
	public List<BoardMemberVO> r_Board_listTotal() throws Exception {
		logger.info(" DAO : board listTotal 시작");
		
		logger.info(" DAO : 결과확인 = " + sqlSession.selectList(namespace + ".R_Board_listTotal"));
		
		logger.info(" DAO : board listTotal 끝");
		
		return sqlSession.selectList(namespace + ".R_Board_listTotal");
	}
	
	// 좋아요 누른지 확인하기
	public boolean r_Board_likeCheck(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeCheck 시작");
		
		int check = sqlSession.selectOne(namespace + ".R_Board_likeCheck", map);
		
		logger.info(" DAO : 결과확인 = " + check);
		
		logger.info(" DAO : board likeCheck 끝");
		
		if(check == 0) return false;
		else return true;
	}
	
	// 좋아요 누른 후 게시물 좋아요 개수 업데이트
	public void r_Board_likeUpdate(int rcp_b_num) throws Exception {
		logger.info(" DAO : board likeUpdate 시작");
		
		sqlSession.update(namespace + ".R_Board_likeUpdate", rcp_b_num);
		
		logger.info(" DAO : board likeUpdate 끝");
	}
	
	// 좋아요 테이블에 좋아요 삽입
	public void r_Board_likeInsert(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeInsert 시작");
		
		sqlSession.insert(namespace + ".R_Board_likeInsert", map);
		
		logger.info(" DAO : board likeInsert 끝");
	}
	
	// 좋아요 테이블에서 좋아요 삭제
	public void r_Board_likeDelete(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeDelete 시작");
		
		sqlSession.delete(namespace + ".R_Board_likeDelete", map);
		
		logger.info(" DAO : board likeDelete 끝");
	}
	
	// 게시물 좋아요 수치 감소
	public void r_Board_likeDiscount(int rcp_b_num) throws Exception {
		logger.info(" DAO : board likeDiscount 시작");
		
		sqlSession.update(namespace + ".R_Board_likeDiscount", rcp_b_num);
		
		logger.info(" DAO : board likeDiscount 끝");
	}
	
	// 게시물 댓글들 불러오기
	public List<replyVO> r_Board_listReply(String reply_b_type, int reply_b_main_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_b_type", reply_b_type);
		map.put("reply_b_main_num", reply_b_main_num);
		
		logger.info(" DAO : board listReply 시작");
		
		List<replyVO> vo = sqlSession.selectList(namespace + ".R_Board_listReply", map);
		
		logger.info(" DAO : 결과확인 = " + vo.size());
		
		logger.info(" DAO : board listReply 끝");
		
		return vo;
	}
	
	// 댓글 불러오기
	public replyVO r_Board_reply(int rcp_b_num) throws Exception {
		
		logger.info(" DAO : board Reply 시작");
		
		replyVO vo = sqlSession.selectOne(namespace + ".R_Board_reply", rcp_b_num);
		
		logger.info(" DAO : 결과확인 = " + vo);
		
		logger.info(" DAO : board Reply 끝");
		
		return vo;
	}
	
	// 댓글 등록하기
	public void r_Board_addReply(replyVO reply) throws Exception {
		logger.info(" DAO : board addReply 시작");
		
		sqlSession.insert(namespace + ".R_Board_addReply", reply);
		
		logger.info(" DAO : board addReply 끝");
	}
	
	// 댓글 삭제하기
	public void r_Board_deleteReply(int reply_b_num) throws Exception {
		logger.info(" DAO : board deleteReply 시작");
		
		sqlSession.delete(namespace + ".R_Board_deleteReply", reply_b_num);
		
		logger.info(" DAO : board deleteReply 끝");
	}
	
	// 댓글 수정하기
	public void r_Board_modifyReply(String reply_b_content, int reply_b_num) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_b_content", reply_b_content);
		map.put("reply_b_num", reply_b_num);
		
		logger.info(" DAO : board modifyReply 시작");
		
		sqlSession.delete(namespace + ".R_Board_modifyReply", reply_b_num);
		
		logger.info(" DAO : board modifyReply 끝");
	}
	
	// recipe_board 컬럼 이름 가져오기
	public List<String> r_Board_getColumn() throws Exception {
		
		List<String> vo = sqlSession.selectList(namespace + ".R_Board_getDBColumn");
		
		logger.info(" DAO : board columns " + vo);
		
		return vo;
	}
	
	// 가져온 컬럼 데이터로 데이터 검색하기
	@Override
	public List<Integer> r_Board_searchData(String column, String data) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("data", ("%"+data+"%"));
		
		List<Integer> vo = sqlSession.selectList(namespace + ".R_Board_searchData", map);
		
		logger.info(" DAO : board columns " + vo);
		
		return vo;
	}
	
	@Override
	public List<String> r_Board_searchNum(List<Integer> rcp_b_nums) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, List<Integer>> map = new HashMap<String, List<Integer>>();
		map.put("rcp_b_nums", rcp_b_nums);
		
		List<String> vo = sqlSession.selectList(namespace + ".R_Board_searchNum", map);
		
		logger.info(" DAO : 검색 결과 제목 -> " + vo.size());
		
		return vo;
	}
}

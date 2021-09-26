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
import com.teamsalad.domain.recipeBoardVO;
import com.teamsalad.domain.replyVO;

@Repository
public class R_BoardDAOImpl implements R_BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger
	= LoggerFactory.getLogger(R_BoardDAOImpl.class);
	
	private static final String namespace = "com.teamsalad.mapper.R_BoardMapper";
	
	
	// �Խù� ����ϱ�(������ �Խ��� VO)
	public void r_Board_regist(recipeBoardVO vo) throws Exception {
		logger.info(" DAO : board regist ȣ��");
			
		sqlSession.insert(namespace + ".R_Board_regist", vo);
		
		logger.info(" DAO : board regist ��");
	}
	
	// �Խù� �����ϱ�(������ �Խ��� vo)
	public void r_Board_modify(recipeBoardVO vo) throws Exception {
		logger.info(" DAO : board modify ȣ��");
		
		sqlSession.update(namespace + ".R_Board_modify", vo);
		
		logger.info(" DAO : board modify ��");
	}
	
	//�Խù� �����ϱ�(�Խ��� ��ȣ)
	public void r_Board_delete(int rcp_b_num) throws Exception {
		logger.info(" DAO : board delete ȣ��");
		
		sqlSession.insert(namespace + ".R_Board_delete", rcp_b_num);
		
		logger.info(" DAO : board delete ��");
	}
	
	
	//�Խù� �ҷ�����(�Խ��� ��ȣ)
	public BoardMemberVO r_Board_detail(int rcp_b_num) throws Exception {
			
		logger.info(" DAO : board detail ȣ��");
			
		BoardMemberVO vo = sqlSession.selectOne(namespace + ".R_Board_detail", rcp_b_num);
			
		logger.info(" DAO : ��� Ȯ�� = " + vo);
		
		logger.info(" DAO : board detail ��");
		
		return vo;
	}
	
	// �Խ��� �� ������ �ҷ�����(����������, ����)
	public List<BoardMemberVO> r_Board_listPage(int page, int total) throws Exception {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("total", total);
		
		logger.info(" DAO : board listPage ȣ��");
		
		List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_listPage", map);
		
		System.out.println("DAO ��� Ȯ�� : " + vo);
		
		logger.info(" DAO : ��� Ȯ�� = " + vo.size());
		
		logger.info(" DAO : board listPage ��");
		
		return vo;
	}
	
	// �Խ��� �� ������ �ҷ�����(����������, ����)
		public List<BoardMemberVO> r_Board_weeklyPopular() throws Exception{
			logger.info(" DAO : board weeklyPopular ȣ��");
			
			List<BoardMemberVO> vo = sqlSession.selectList(namespace + ".R_Board_weeklyPopular");
			
			logger.info(" DAO : ��� Ȯ�� = " + vo.size());
			
			logger.info(" DAO : board weeklyPopular ��");
			
			return vo;
		}
	
	// �Խ��� �� �ҷ�����
	public List<BoardMemberVO> r_Board_listTotal() throws Exception {
		logger.info(" DAO : board listTotal ȣ��");
		
		logger.info(" DAO : ��� Ȯ�� = " + sqlSession.selectList(namespace + ".R_Board_listTotal"));
		
		logger.info(" DAO : board listTotal ��");
		
		return sqlSession.selectList(namespace + ".R_Board_listTotal");
	}
	
	// ����ڰ� �Խù��� ���ƿ並 üũ �ߴ��� Ȯ��(�Խ��� ��ȣ, ����� ���̵�)
	public boolean r_Board_likeCheck(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeCheck ȣ��");
		
		int check = sqlSession.selectOne(namespace + ".R_Board_likeCheck", map);
		
		logger.info(" DAO : ��� Ȯ�� = " + check);
		
		logger.info(" DAO : board likeCheck ��");
		
		if(check == 0) return false;
		else return true;
	}
	
	// ����ڰ� ���ƿ並 �������� ������Ʈ(�Խ��� ��ȣ)
	public void r_Board_likeUpdate(int rcp_b_num) throws Exception {
		logger.info(" DAO : board likeUpdate ȣ��");
		
		sqlSession.update(namespace + ".R_Board_likeUpdate", rcp_b_num);
		
		logger.info(" DAO : board likeUpdate ��");
	}
	
	// ����ڰ� ���ƿ並 �������� ���ƿ����̺� ����(�Խ��� ��ȣ, ����� ���̵�)
	public void r_Board_likeInsert(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeInsert ȣ��");
		
		sqlSession.insert(namespace + ".R_Board_likeInsert", map);
		
		logger.info(" DAO : board likeInsert ��");
	}
	
	// ����ڰ� ���ƿ並 ������� �� ���ƿ����̺��� ����(�Խ��� ��ȣ, ����� ���̵�)
	public void r_Board_likeDelete(int rcp_b_num, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcp_b_num", rcp_b_num);
		map.put("m_id", m_id);
		
		logger.info(" DAO : board likeDelete ȣ��");
		
		sqlSession.delete(namespace + ".R_Board_likeDelete", map);
		
		logger.info(" DAO : board likeDelete ��");
	}
	
	// ����ڰ� ���ƿ並 ��������� �Խù� ���ƿ� ���� ����(�Խ��� ��ȣ)
	public void r_Board_likeDiscount(int rcp_b_num) throws Exception {
		logger.info(" DAO : board likeDiscount ȣ��");
		
		sqlSession.update(namespace + ".R_Board_likeDiscount", rcp_b_num);
		
		logger.info(" DAO : board likeDiscount ��");
	}
	
	// �Խù� ��۵� �ҷ�����(�Խ��� Ÿ��, �Խ��� ��ȣ)
	public List<replyVO> r_Board_listReply(String reply_b_type, int reply_b_main_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_b_type", reply_b_type);
		map.put("reply_b_main_num", reply_b_main_num);
		
		logger.info(" DAO : board listReply ȣ��");
		
		List<replyVO> vo = sqlSession.selectList(namespace + ".R_Board_listReply", map);
		
		logger.info(" DAO : ��� Ȯ�� = " + vo.size());
		
		logger.info(" DAO : board listReply ��");
		
		return vo;
	}
	
	// ��� �ҷ�����(��� ��ȣ)
	public replyVO r_Board_reply(int rcp_b_num) throws Exception {
		
		logger.info(" DAO : board Reply ȣ��");
		
		replyVO vo = sqlSession.selectOne(namespace + ".R_Board_reply", rcp_b_num);
		
		logger.info(" DAO : ��� Ȯ�� = " + vo);
		
		logger.info(" DAO : board Reply ��");
		
		return vo;
	}
	
	// �Խ��� ��� �ۼ��ϱ�(���vo)
	public void r_Board_addReply(replyVO reply) throws Exception {
		logger.info(" DAO : board addReply ȣ��");
		
		sqlSession.insert(namespace + ".R_Board_addReply", reply);
		
		logger.info(" DAO : board addReply ��");
	}
	
	// ��� �����ϱ�(��� ��ȣ)
	public void r_Board_deleteReply(int reply_b_num) throws Exception {
		logger.info(" DAO : board deleteReply ȣ��");
		
		sqlSession.delete(namespace + ".R_Board_deleteReply", reply_b_num);
		
		logger.info(" DAO : board deleteReply ��");
	}
	
	// ��� ����(��� ����, ��� ��ȣ)
	public void r_Board_modifyReply(String reply_b_content, int reply_b_num) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_b_content", reply_b_content);
		map.put("reply_b_num", reply_b_num);
		
		logger.info(" DAO : board modifyReply ȣ��");
		
		sqlSession.delete(namespace + ".R_Board_modifyReply", reply_b_num);
		
		logger.info(" DAO : board modifyReply ��");
	}
	
	public List<String> r_Board_getColumn() throws Exception {
		
		List<String> vo = sqlSession.selectList(namespace + ".R_Board_getDBColumn");
		
		logger.info(" DAO : board columns " + vo);
		
		return vo;
	}
	
	@Override
	public List<String> r_Board_searchData(String column, String data) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("data", ("%"+data+"%"));
		
		List<String> vo = sqlSession.selectList(namespace + ".R_Board_searchData", map);
		
		logger.info(" DAO : board columns " + vo);
		
		return vo;
	}
}

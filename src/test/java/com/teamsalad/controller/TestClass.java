package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.ingredientVO;
import com.teamsalad.domain.memberVO;
import com.teamsalad.domain.orderVO;
import com.teamsalad.persistence.AdminDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class TestClass {
	
	    // 로그
		private static final Logger logger = LoggerFactory.getLogger(TestClass.class);
		
		@Inject
		AdminDAO adao;
		
		// 멤버 데이터 삽입
		//@Test
		public void MembertestCreate() throws Exception{
			
			for (int i=100 ; i<= 999 ; i++) {
				
				memberVO mvo = new memberVO();
				mvo.setM_id("tester"+i);
				mvo.setM_pw("1234");
				mvo.setM_name("테스터"+i);
				mvo.setM_email("tester"+i+"@naver.com");
				mvo.setM_zip("12345");
				mvo.setM_addr1("기본주소");
				mvo.setM_addr2("상세주소");
				mvo.setM_phone("010-1223-5678");
				mvo.setM_grade(((int)(Math.random()*4)+1));
				mvo.setM_totalAmount("100000");
				mvo.setM_attendance(1);
				mvo.setM_warning(1);
				mvo.setM_coupon("1");
				
				adao.insertMember(mvo);
			}
			
		}
		
	// 페이징 테스트	
	//@Test
	public void testCriteria() throws Exception{
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(2);
		
		List<memberVO> mvo = adao.mListCri(cri);
		
		
		for(memberVO vo : mvo) {
			logger.info(vo.getM_id()+":"+vo.getM_name());
		}
	}
	
	// 주문 데이터 삽입
	//@Test
	public void OrdertestCreate() throws Exception{
		
		for (int i=100 ; i<= 999 ; i++) {
			
			orderVO ovo = new orderVO();
			
			ovo.setOrder_num(i);
			ovo.setM_id("test"+i);
			ovo.setRcp_num(i);
			ovo.setCoupon_id(i);
			ovo.setOrder_pay_num("i");
			ovo.setRcp_name("레시피명");
			ovo.setOrder_name("주문자"+i);
			ovo.setOrder_receive_name("수취자"+i);
			ovo.setOrder_receive_phone("010-0000-0000");
			ovo.setOrder_receive_zip("01010");
			ovo.setOrder_receive_addr1("주소");
			ovo.setOrder_receive_addr2("상세주소");
			ovo.setOrder_type("1");
			ovo.setOrder_amount(i);
			ovo.setOrder_ship_price("2000");
			ovo.setOrder_total_price("100000");
			ovo.setOrder_status(((int)(Math.random()*6)));
			
			adao.insertOrder(ovo);
		}
		
	}
	
	// 재료 데이터 삽입
	//@Test
	public void IngredienttestCreate() throws Exception{
		
		for (int i=100 ; i<= 999 ; i++) {
			
			ingredientVO ivo = new ingredientVO();
			
			ivo.setIgdt_num(i);
			ivo.setIgdt_category(""+i);
			ivo.setIgdt_name("재료"+i);
			ivo.setIgdt_price("20000");
			ivo.setIgdt_main_img("defaultimg.jpg");
			ivo.setIgdt_country("국산");
			ivo.setIgdt_info("좋음");
			ivo.setIgdt_count(i);
			ivo.setIgdt_tag("재료");
			ivo.setIgdt_size("20g");
						
			adao.insertIngredient(ivo);
		}
		
	}

		
	

}

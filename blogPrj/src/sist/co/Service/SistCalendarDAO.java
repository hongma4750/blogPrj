package sist.co.Service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.Model.SistCalendarDTO;

@Repository
public class SistCalendarDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String ns = "SistCalendar.";
	
	/* 캘린더 리스트 */
	public List<SistCalendarDTO> getCalendarList(SistCalendarDTO fcal)throws Exception{
		List<SistCalendarDTO> callist = new ArrayList<SistCalendarDTO>();
		return callist = sqlSession.selectList(ns + "getCalendarList", fcal);
	}
	
	
	/* 퀵 뷰 상세보기 */
	public SistCalendarDTO getSchQuickView(SistCalendarDTO scal)throws Exception{
		scal = sqlSession.selectOne(ns + "getSchQuickView", scal);
		return scal;
	}

	/* 일정 상세보기 */
	public SistCalendarDTO getSch(SistCalendarDTO scal)throws Exception{
		scal = sqlSession.selectOne(ns + "getSch", scal);
		return scal;
	}
	
	/* 일정 쓰기 */
	public boolean writeSchedule(SistCalendarDTO sdto) throws Exception{
		sqlSession.insert(ns+"writeSchedule", sdto);
		return true;
	}
	
	/* 일정 상세보기 */
	
	
}

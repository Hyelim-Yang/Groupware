package kh.gw.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.ScheduleDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class ScheduleDAO {
	@Autowired
	private SqlSession db;

	public int insertSchedule(ScheduleDTO dto) {
		return db.insert("Schedule.insertSchedule",dto);
	}

	public List<ScheduleDTO> listByCpage(int cpage) throws Exception{
		int startRowNum = (cpage - 1) * BoardConfigurator.RECORD_COUNT_PER_PAGE + 1;
		int endRowNum = startRowNum + BoardConfigurator.RECORD_COUNT_PER_PAGE - 1;
		
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		
		return db.selectList("Schedule.listByCpage",map);
	}

	public List<ScheduleDTO> getList() throws Exception{
		return db.selectList("Schedule.getList");
	}

	public List<ScheduleDTO> listAllSchedule() {
		return db.selectList("Schedule.listAllSchedule");
	}
}

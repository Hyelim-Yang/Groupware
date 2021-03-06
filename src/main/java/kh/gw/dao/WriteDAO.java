package kh.gw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.gw.dto.WriteDTO;
import kh.gw.dto.Write_commentsDTO;
import kh.gw.statics.BoardConfigurator;

@Repository
public class WriteDAO {
	@Autowired
	private SqlSession db;

	//------------------- 공지사항 cpage
	public List<WriteDTO> noticeByCpage(int cpage,String write_code) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("writeCode", write_code);
		return db.selectList("Write.noticeByCpage",param);
	}

	//------------------- 공지사항 list
	public List<WriteDTO> noticeList(String writeCode) throws Exception{
		return db.selectList("Write.noticeList", writeCode);
	}

	//------------------ 제목 눌렀을 때 공지사항 상세
	public WriteDTO noticeView(int write_seq) throws Exception{
		return db.selectOne("Write.noticeView", write_seq);
	}

	//------------------ 조회수
	public int addViewCount(int write_seq) throws Exception{
		return db.update("Write.updateViewCount", write_seq);
	}

	//------------------ 공지사항 검색 cpage
	public List<WriteDTO> noticeSearch(int cpage, String condition, String writeCode, String keyword) throws Exception{
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_PER_PAGE+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_PER_PAGE -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("condition",condition);
		param.put("writeCode",writeCode);
		param.put("keyword",keyword);
		return db.selectList("Write.noticeSearch",param);
	}

	//------------------ 공지사항 검색 navi
	public List<WriteDTO> noticeSearchList (String writeCode, String condition, String keyword) throws Exception{
		Map<String,String> param = new HashMap<String, String>();
		param.put("writeCode", writeCode);
		param.put("condition", condition);
		param.put("keyword", keyword);
		return db.selectList("Write.noticeSearchList",param);
	}

	//------------------- 시스템 공지사항 list
	public List<WriteDTO> systemNoticeList(String writeCode) throws Exception{
		return db.selectList("Write.systemNoticeList", writeCode);
	}

	//------------------ 시스템 공지사항 검색 navi
	public List<WriteDTO> systemNoticeSearchList (String writeCode, String condition, String keyword) throws Exception{
		Map<String,String> param = new HashMap<String, String>();
		param.put("writeCode", writeCode);
		param.put("condition", condition);
		param.put("keyword", keyword);
		return db.selectList("Write.noticeSearchList",param);
	}

	//----------------- 회사 게시판 글 작성
	public int insertBoardWrite(WriteDTO dto) throws Exception{
		return db.insert("Write.insertBoardWrite",dto);
	}

	//----------------- 회사 게시판 글 삭제
	public int deleteBoardWrite(int write_seq) {
		return db.delete("Write.deleteBoardWrite", write_seq);
	}
	//---------------- 회사 게시글 수정 전
	public WriteDTO modifyBeforeBoard(int write_seq) throws Exception{
		return db.selectOne("Write.modifyBeforeBoard", write_seq);
	}
	//---------------- 회사 게시글 수정 후
	public int modifyAfterBoard(WriteDTO dto) throws Exception{
		return db.update("Write.modifyAfterBoard", dto);
	}

	//----------------- 갤러리 게시판 글 작성
	public int insertGalleryWrite(WriteDTO dto) throws Exception{
		return db.insert("Write.insertGalleryWrite",dto);
	}

	//----------------- 갤러리 게시판 글 삭제
	public int deleteGalleryWrite(int write_seq) {
		return db.delete("Write.deleteGalleryWrite", write_seq);
	}
	//---------------- 갤러리 게시글 수정 전
	public WriteDTO modifyBeforeGallery(int write_seq) throws Exception{
		return db.selectOne("Write.modifyBeforeGallery", write_seq);
	}
	//---------------- 갤러리 게시글 수정 후
	public int modifyAfterGallery(WriteDTO dto) throws Exception{
		return db.update("Write.modifyAfterGallery", dto);
	}

	public int commentWrite(Write_commentsDTO dto) {
		return db.insert("Write.commentWrite", dto);
	}

	public List<Write_commentsDTO> commentNow(Write_commentsDTO dto) {
		return db.selectList("Write.commentNow", dto);
	}

	public List<Write_commentsDTO> commentView(int write_seq) {
		return db.selectList("Write.commentView", write_seq);
	}
	public int commentDelete(int write_cmt_seq) throws Exception{
		return db.delete("Write.commentDelete", write_cmt_seq);
	}

	public List<Write_commentsDTO> reCommentList(Write_commentsDTO dto) {
		return db.selectList("Write.reCommentList", dto);
	}

	public int reCommentWrite(Write_commentsDTO dto) {
		return db.insert("Write.reCommentWrite", dto);
	}

	public List<Write_commentsDTO> reCommentNow(Write_commentsDTO dto) {
		return db.selectList("Write.reCommentNow", dto);
	}

	public int insertWrite(WriteDTO dto) {
		return db.insert("Write.insertWrite", dto);
	}

	public List<WriteDTO> listWr() {
		return db.selectList("Write.listWr");
	}

	public int updateWrList(WriteDTO dto) throws Exception{
		return db.update("Write.updateWrList", dto);
		
	}

	public int deleteWrList(WriteDTO dto) {
		return db.delete("Write.deleteWrList",dto);
	}

	public List<WriteDTO> noticePopupList(int cpage, String write_code) throws Exception {
		BoardConfigurator configurator = new BoardConfigurator();
		int startRowNum = (cpage-1)*configurator.RECORD_COUNT_WRITE_POP_UP+1;
		int endRowNum = startRowNum + configurator.RECORD_COUNT_WRITE_POP_UP -1;
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("startRowNum",startRowNum);
		param.put("endRowNum", endRowNum);
		param.put("write_code", write_code);
		return db.selectList("Write.noticePopupList",param);
	}

	public List<WriteDTO> noticePopupView(String write_code) {
		return db.selectList("Write.noticePopupView", write_code);
	}

	public List<WriteDTO> listBr() {
		return db.selectList("Write.listBr");
	}

	public int getNewBoardSeq() {
		return db.selectOne("Write.getNewBoardSeq");
	}

	public int commentReDelete(int write_cmt_seq) {
		return db.delete("Write.commentReDelete", write_cmt_seq);
	}

}

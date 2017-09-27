package us.duia.leejo0531.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.vo.DetailVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.TagVO;
import us.duia.leejo0531.vo.checkTimeVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * @author leejunyeon
 */
@Repository
public class QuestionDAO {

   @Autowired
   private SqlSession sqlSession;
   
   @Autowired
   private TagDAO tagdao;
   
   /**
    * DB에서 질문글의 시퀀스를 가져온다.
    * @return
    */
   public int Q_BOARD_SEQ_NEXTVAL() {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      int result = mapper.Q_BOARD_SEQ_NEXTVAL();
      return result;
   }
   
   /**
    * DB에 질문을 등록한다.
    * @param qstn QuestionVO
    * @return 등록 결과
    */
   public int insertQuestion(QuestionVO qstn) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      int result = mapper.insertQuestion( qstn);
      return result;
   }
   
   /**
    * DB에서 Question(질문)을 가져온다.
    * @param qstn QuestionVO
    * @return 가져온 결과
    */
   public QuestionVO selectOneQuestion(QuestionVO qstn) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      QuestionVO result = mapper.selectOneQuestion(qstn);
      return result;
   }

   /**
    * DB로부터 Major(대분류)를 ArrayList로 가져온다.
    * @return MajorVO Major
    */
   public ArrayList<MajorVO> getMajorList() {
      UserMapper mapper = sqlSession.getMapper(UserMapper.class);
      ArrayList<MajorVO> majorList = mapper.getMajorList();
      return majorList;
   }
   
   public MinorVO getMinor(int minorNum) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      MinorVO minor = mapper.getMinor(minorNum);
      return minor;
   }
   
   /**
    * DB로부터 Minor(소분류)를 ArrayList로 가져온다.
    * @return MinorVO Minor
    */
   public ArrayList<MinorVO> getMinorList() {
      UserMapper mapper = sqlSession.getMapper(UserMapper.class);
      ArrayList<MinorVO> minorList = mapper.getMinorList();
      return minorList;
   }
   
   public MajorVO getMajor(int majorNum) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      MajorVO major = mapper.getMajor(majorNum);
      return major;
   }
   
   /**
    * DB에서 질문을 삭제한다.
    * @param target 삭제할 질문 VO
    * @return 삭제 결과
    */
   public int deleteQuestion(QuestionVO target) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      int result = mapper.deleteQuestion(target);
      return result;
   }
   
   /**
    * DB로부터 context가 포함된 모든 질문글을 가져온다.
    * @param context 질문글에 포함된 단어
    * @return ArrayList<QuestionVO>
    */
   public ArrayList<QuestionVO> searchByContext(PageVO page){
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.searchByContext(page);
      return result;
   }
   
   public ArrayList<TagVO> getQuestionTag(QuestionVO question) {
//      System.out.println("getQuestionTag 진입 : " + sqlSession);
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
//      System.out.println("TagDAO 진입 : " + question);
      ArrayList<TagVO> tagList = mapper.getQuestionTag(question);
      return tagList;
   }
   
   public checkTimeVO getQuestionTime(int questionNum) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      checkTimeVO checkTime = mapper.getQuestionTime(questionNum);
      return checkTime;
   }
   /**
    * DB에서 모든 질문글을 가져온다
    * @return ArrayList<QuestionVO>
    */
   public ArrayList<QuestionVO> getAllQuestion(){
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.getAllQuestion();
      return result;
   }

   public ArrayList<QuestionVO> search_no_answered() {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.search_no_answered();
      return result;
   }
   
   /**
    * DB에서 매개변수로 받은 번호사이의 글을 조회한다 
    * @param startpage 가져올 게시글의 최근 page번호 , endpage 마지막 page번호 
    * @return ArrayList<QuestionVO>
    */
   public ArrayList<QuestionVO> getQuestionPage(Map<String, Object> map){
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.getQuestionPage(map);
      return result;
   }
   
   /**
    * 질문글 작성에서 녹화된 동영상을 DB에 넣는다.
    * @param map 동영상 파일의 이름과 저장된 주소
    * @return
    */
   public int insertVideoFromAskQuestion(HashMap<String, String> map) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      int result = mapper.insertVideoFromAskQuestion(map);
      return result;
   }

   public ArrayList<QuestionVO> myQuestionList(PageVO page) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.myQuestionList(page);
      return result;
   }

   public ArrayList<QuestionVO> searchRecentPost(PageVO page) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.searchRecentPost(page);
      return result;
   }
   
   public ArrayList<QuestionVO> searchUrgentPost(PageVO page) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.searchUrgentPost(page);
      return result;
   }
   
   public ArrayList<QuestionVO> searchInProgressPost(PageVO page) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      ArrayList<QuestionVO> result = mapper.searchInProgressPost(page);
      return result;
   }
   
   public HashMap<String, Integer> checkPreNextQuestionNum (int questionNum) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      HashMap<String, Integer> checkPreNextQuestionNum = mapper.checkPreNextQuestionNum(questionNum);
      return checkPreNextQuestionNum;
   }
   
   public int insertTag(TagVO tag) {
      TagMapper mapper = sqlSession.getMapper(TagMapper.class);
      int result = mapper.insertTag(tag);
      return result;
   }
   
   public int updateTag(TagVO tag) {
      TagMapper mapper = sqlSession.getMapper(TagMapper.class);
      int result = mapper.updateTag(tag);
      return result;
   }
   
   public DetailVO getQuestionDetail( QuestionVO qstn) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      DetailVO result = mapper.getQuestionDetail(qstn);
      return result;
   }

   public void rebuildQContentIndex() {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      mapper.rebuildQContentIndex();
   }

   public void rebuildRContentIndex() {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      mapper.rebuildRContentIndex();
   }
   
   /**
    * 질문글을 수정한다.
    * @param qstn
    * @return
    */
   public int modifyQuestion(QuestionVO qstn) {
      QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
      int result = mapper.modifyQuestion(qstn);
      return result;
   }


	public ArrayList<QuestionVO> getQList() {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		ArrayList<QuestionVO> qList = mapper.getQList();
		return qList;
	}
}

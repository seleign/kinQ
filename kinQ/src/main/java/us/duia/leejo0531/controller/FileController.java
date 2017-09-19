package us.duia.leejo0531.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.util.FileService;

/**
 * 1) 이 컨트롤러는 파일 업로드/다운로드 관련 컨트롤러이다.
 * 2) 비즈니스 로직은 FileService에 작성되어 있다.
 * 3) 
 * @author leejunyeon
 */
@Controller
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	QuestionDAO qstnDao;
	
	//코드 추가 필요
	@RequestMapping(value="fileupload", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List> uploadList( @RequestParam("files[]") List files){
		Map<String, List> result = null;
		return result;
	}
	
	/**
	 * Ajax로 업로드 된다. 질문/답변에서 녹화한 화면을 업로드할 때 사용한다.
	 * @param blob 형식의 녹화된 webm 파일
	 * @return 
	 * @return --작성 필요???
	 */
	@RequestMapping(value = "blob_upload", method = RequestMethod.POST)
	public @ResponseBody String blob_upload(MultipartFile blob, int questionNum, HttpSession session) {
		logger.info("blob_upload: " + blob.getOriginalFilename());
		logger.info("questionNum: " + questionNum);
		String userId = (String)session.getAttribute("userId");
		
		String QFILEPATH = FileService.blob_upload(blob, userId, questionNum);
		
		// 근데 어차피 QuestionVO에 녹화된 파일 주소를 가지고 있을 텐데, 여기에서 다시 Q_attach테이블에 넣어줘야하나?
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("QUESTIONNUM", String.valueOf(questionNum));
		map.put("USERNUM", String.valueOf((int)session.getAttribute("userNum")));
		map.put("QFILEPATH", QFILEPATH);
		map.put("QFILENAME", blob.getOriginalFilename());
		qstnDao.insertVideoFromAskQuestion(map);
		
		return QFILEPATH;
	}
	
	/**
	 * CKEditor에서 파일 업로드에 사용된다.
	 * 아직 코드를 정리 못 했음....
	 * @param upload 업로드 할 파일
	 * @param CKEditorFuncNum ?? 근데 이거 없으면 안됨
	 * @return 자바스크립트 콜백 함수 window.parent.CKEDITOR.tools.callFunction(CKEditorFuncNum, 파일 주소, 메세지)
	 */
	@RequestMapping(value = "cKEditorFileUpload", method = RequestMethod.POST)
	public @ResponseBody String cKEditorFileUpload(MultipartFile upload, String CKEditorFuncNum, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		return FileService.cKEditorFileUpload(upload, CKEditorFuncNum, userId);
	}
	
	/**
	 * CKEditor에 드래그 앤 드랍으로 이미지 파일을 넣을 때 사용한다.
	 * filetools 의 설정을 변경했음.....-- 기록사항
	 * @param blob 업로드 할 파일
	 * @return 업로드 결과
	 */
	@RequestMapping(value = "cKEditorDragAndDropFileUpload", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> cKEditorDragAndDropFileUpload(MultipartFile blob, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		return FileService.cKEditorDragAndDropFileUpload(blob, userId);
	}
	
	/**
	 * Ajax로 받은 img의 src를 Base64로 바꿔준다.
	 * @param imgSrc 이미지의 주소
	 * @return Base64화 된 이미지
	 */
	@RequestMapping(value = "imgToBase64", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, String> imgToBase64(String imgSrc) {
		return FileService.imgToBase64(imgSrc);
	}
}

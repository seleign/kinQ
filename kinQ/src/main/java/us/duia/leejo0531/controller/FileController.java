package us.duia.leejo0531.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	//코드 추가 필요
	@RequestMapping(value="fileupload", method = RequestMethod.GET)
	public @ResponseBody Map<String, List> uploads( @RequestParam("files[]") List files){
		Map<String, List> result = null;
		return result;
	}
	
	/**
	 * Ajax로 업로드 된다. 질문/답변에서 녹화한 화면을 업로드할 떄 사용한다.
	 * @param blob 형식의 녹화된 webm 파일
	 * @param fileName blob의 파일명
	 * @return --작성 필요???
	 */
	@RequestMapping(value = "blob_upload", method = RequestMethod.POST)
	public @ResponseBody void blob_upload(MultipartFile blob) {
		System.out.println(blob.getOriginalFilename());
		FileService.saveFile(blob, "/Users/leejunyeon/Desktop/");
	}
	
	/**
	 * CKEditor에서 파일 업로드에 사용된다.
	 * 아직 코드를 정리 못 했음....
	 * @param upload 업로드 할 파일
	 * @param CKEditorFuncNum ?? 근데 이거 없으면 안됨
	 * @return 자바스크립트 콜백 함수 window.parent.CKEDITOR.tools.callFunction(CKEditorFuncNum, 파일 주소, 메세지)
	 */
	@RequestMapping(value = "cKEditorFileUpload", method = RequestMethod.POST)
	public @ResponseBody String cKEditorFileUpload(MultipartFile upload, String CKEditorFuncNum) {
		System.out.println(upload.getOriginalFilename());
		FileService.saveFile(upload, "/Users/leejunyeon/Desktop/");
		
		//"http://images.goodsmile.info/cgm/images/product/20151005/5261/35771/large/06279a95903ea162cc97f533c57b3843.jpg
		return "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + "http://images.goodsmile.info/cgm/images/product/20151005/5261/35771/large/06279a95903ea162cc97f533c57b3843.jpg" + "','이미지를 업로드 하였습니다.'" + ")</script>"; //
	}
	
	/**
	 * CKEditor에 드래그 앤 드랍으로 이미지 파일을 넣을 때 사용한다.
	 * filetools 의 설정을 변경했음.....-- 기록사항
	 * @param blob 업로드 할 파일
	 * @return
	 */
	//cKEditorDragAndDropFileUpload
	@RequestMapping(value = "cKEditorDragAndDropFileUpload", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> cKEditorDragAndDropFileUpload(MultipartFile blob) {
		System.out.println(blob.getOriginalFilename());
		HashMap<String, String> result = new HashMap<>();
		result.put("uploaded", "1");
		result.put("fileName", "06279a95903ea162cc97f533c57b3843.jpg");
		result.put("url", "http://images.goodsmile.info/cgm/images/product/20151005/5261/35771/large/06279a95903ea162cc97f533c57b3843.jpg");
		
		//"uploaded": 1,  <- success일때 1, fail일때0
	    //"fileName": "foo.jpg",  <-파일명
	    //"url": "/files/foo.jpg" <-파일 url
		//"error" : "실패 메시지"  <- 업로드 실패했을 때 메시지
		return result;
	}
}

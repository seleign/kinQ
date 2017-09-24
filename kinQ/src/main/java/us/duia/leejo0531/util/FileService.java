package us.duia.leejo0531.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 관련 유틸 업로드한 파일의 저장 & 서버에 저장된 파일 삭제 등의 기능 제공
 */
public class FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);
	/* 여기를 각자 작업 환경에 맞게 수정한다.
	 * 여기 수정안하면 파일 업로드 안되니까 꼭 수정한다. 여기를 각자 작업 환경에 맞게 수정한다.
	 * 3번째 Static fileSaveDirPath에 스프링 resources의 경로(" " 부분)를 자신에게 맞게 변경.
	 */

	// resources/ 하단에 존재하는 파일이 업로드될 폴더명
	public static String uploadFolderName = "uploadedFile";  // 앞에 '/'는 없어야함
	
	// WAS의 임시폴더의 resources/ + uploadFolderName의 경로를 찾는다.
	public static String tmpPath = FileService.class.getResource("").getPath().substring(0, FileService.class.getResource("").getPath().lastIndexOf("WEB-INF")) + "resources/" + uploadFolderName + "/"; 
		// 서버 운영시: FileService.class.getResource("").getPath().substring(0, FileService.class.getResource("").getPath().lastIndexOf("WEB-INF")) + "resources/" + uploadFolderName + "/";
	// resources 폴더가 존재하는 절대경로
	public static String fileSaveDirPath = "/Users/leejunyeon/git/kinq/kinQ/src/main/webapp/resources/" + uploadFolderName + File.separator; // OS마다 다르니까 알아서...
		// 서버운영시:  "C:\\Users\\SCITMaster\\git\\kinq\\kinQ\\src\\main\\webapp\\resources\\" + uploadFolderName + File.separator;
	
	// 각자의 컴퓨터를 확인해서, tmpPath와  resources 폴더를 지정한
		public FileService() {
			
				if( System.getProperty("user.name").equals("leejunyeon") ) {
					fileSaveDirPath = "/Users/leejunyeon/git/kinq/kinQ/src/main/webapp/resources/" + uploadFolderName + File.separator;
				}else if( System.getProperty("user.name").equals("seleign") ) {
					fileSaveDirPath = "C:\\Users\\seleign\\git\\kinq\\kinQ\\src\\main\\webapp\\resources\\" + uploadFolderName + File.separator;
				}else {
					fileSaveDirPath = "C:\\Users\\SCITMaster\\git\\kinq\\kinQ\\src\\main\\webapp\\resources\\" + uploadFolderName + File.separator;
				}
				logger.info("파일 업로드를 하기 위해서 FileService의 fileSaveDirPath를 변경해야합니다. 지금의 fileSaveDirPath: " + fileSaveDirPath);
			}
	
	/**
	 * 업로드 된 파일을 지정된 경로에 저장하고, 저장된 파일명을 리턴
	 * 
	 * @param mfile 업로드된 파일
	 * @param uploadPath 저장할 경로
	 * @return 저장된 파일명
	 */
	public static String saveFile(MultipartFile mfile, String uploadPath, String id) {
		// 업로드된 파일이 없거나 크기가 0이면 저장하지 않고 null을 리턴
		if (mfile == null || mfile.isEmpty() || mfile.getSize() == 0) {
			return null;
		}

		// 저장 폴더가 없으면 생성
		File path = new File(uploadPath + id + File.separator);
		if (!path.isDirectory()) {
			path.mkdirs();
		}

		// 원본 파일명
		String originalFilename = mfile.getOriginalFilename();

		// 저장할 파일명을 오늘 날짜의 년월일로 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String savedFilename = sdf.format(new Date());

		// 원본 파일의 확장자
		String ext;
		int lastIndex = originalFilename.lastIndexOf('.');
		// 확장자가 없는 경우
		if (lastIndex == -1) {
			ext = "";
		}
		// 확장자가 있는 경우
		else {
			ext = "." + originalFilename.substring(lastIndex + 1);
		}

		// 저장할 전체 경로를 포함한 File 객체
		File serverFile = null;

		// 같은 이름의 파일이 있는 경우의 처리
		while (true) {
			serverFile = new File(uploadPath + File.separator + id + File.separator + savedFilename + ext);
			// 같은 이름의 파일이 없으면 나감.
			if (!serverFile.isFile())
				break;
			// 같은 이름의 파일이 있으면 이름 뒤에 long 타입의 시간정보를 덧붙임.
			savedFilename = savedFilename + new Date().getTime();
		}

		// 파일 저장
		try {
			mfile.transferTo(serverFile);
			logger.info("serverFile: " + serverFile);
			///C:/Users/SCITMaster/Documents/workspace-sts-3.9.0.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/kinQ/WEB-INF/classes/us/duia/leejo0531/util/

			//FileService.class.getResource("").getPath().substring(0, FileService.class.getResource("").getPath().lastIndexOf("WEB-INF" + File.separator + "classes" + File.separator)) + "resources" + File.separator + uploadFolderName; 
			/* transferTo로 저장하면, 프로젝트 resources 폴더에 파일이 바로 생기는데 웹에서 요청하는 resources는 이 폴더가 아니라 WAS가 따로 서비스용으로 임시로 만든 resources 폴더에서 요청하는 파일을 찾는다. 
			 * 제 경우에는 fullPath: /Users/leejunyeon/GoogleDrive/SCIT/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/kinQ/WEB-INF/classes/us/duia/leejo0531/util/
			 * 이렇게 tmp폴더에 저장되고, 이클립스에서 F5눌러서 다시 스프링을 소프트 초기화하면, 이 진짜 resources 폴더로부터 temp resources로 파일을 다시 복사해 오는 것을 확인했습니다.
			 * 이게 문제가 된는 것이, 이미지 파일을 서버에 업로드하면 진짜 resources 폴더에만 업로드한 파일이 있으므로 임시 resources 폴더에는 파일이 없습니다. (문제해결: F5를 이용한 소프트 초기화 필요)
			 * 그래서 웹페이지에서 resources로 업로드한 파일을 요청하면 임시 resources 폴더에는 찾고자 하는 파일이 없으므로 404에러가 터집니다. 
			 * 그래서 진짜 resources로부터 서비스 중인 resources 폴더로 파일을 한번 더 복사해야했습니다.
			 */

			logger.info("진짜 reources 폴더에서 :: " + fileSaveDirPath +id + File.separator + savedFilename + ext);
			logger.info("서비스 중인 resources 폴더로 파일을 복사한다. :: " + tmpPath + id + "/" + savedFilename + ext);
			
			// 서비스 중인 리소스 폴더가 존재하는가?
			path = new File(tmpPath + id + File.separator);
			if(!path.isDirectory()) {
				path.mkdirs();
			}
			
			FileInputStream inputStream = new FileInputStream(fileSaveDirPath +id + File.separator + savedFilename + ext); 
			FileOutputStream outputStream = new FileOutputStream(tmpPath + id + File.separator + savedFilename + ext);
			FileChannel fcin = inputStream.getChannel(); 
			FileChannel fcout = outputStream.getChannel(); 
			fcin.transferTo(0, fcin.size(), fcout); 
			fcout.close(); 
			fcin.close(); 
			outputStream.close(); 
			inputStream.close();
		} catch (Exception e) {
			savedFilename = null;
			ext = null;
			e.printStackTrace();
		}
		return savedFilename + ext;
	}
	
	/**
	 * img의 src에 있는 이미지를 Base64인코딩으로 바꿔준다.
	 * @param imgSrc 이미지의 주소
	 * @return
	 */
	public static HashMap<String, String> imgToBase64 (String imgSrc) {
		HashMap<String, String> result = new HashMap<>();
		if(imgSrc.substring(0, 5).equals("data:")) { //이미 base64로 인코딩 된것일 때
			logger.info("이미 base64인 이미지");
			result.put("base64", imgSrc);	
			return result;
		} else {
			String ext = imgSrc.substring( imgSrc.lastIndexOf( "." ) + 1 );
			byte[] imageBytes = null;
			try {
				InputStream input = new URL(imgSrc).openStream();
				imageBytes = IOUtils.toByteArray(input);
			} catch (IOException e) {
				e.printStackTrace();
			}
			String base64 = Base64.getEncoder().encodeToString(imageBytes);
			base64 = "data:image/" + ext + ";base64," + base64;
			result.put("base64", base64);		
			return result;
		}
	}
	
	/**
	 * CKEditor에서 파일 업로드에 사용된다.
	 * @param upload 업로드 할 파일
	 * @param CKEditorFuncNum ?? 근데 이거 없으면 안됨
	 * @return 자바스크립트 콜백 함수 window.parent.CKEDITOR.tools.callFunction(CKEditorFuncNum, 파일 주소, 메세지)
	 */
	public static String cKEditorFileUpload(MultipartFile upload, String CKEditorFuncNum, String id) {
		logger.info( "cKEditorFileUpload: "	+ upload.getOriginalFilename() );
		String fileName = FileService.saveFile(upload, fileSaveDirPath, id);
		String url = "/resources/"  + uploadFolderName+ "/" + id + "/" + fileName;
		return "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + url + "','File Uploaded'" + ")</script>"; //
	}
	
	/**
	 * CKEditor에 드래그 앤 드랍으로 이미지 파일을 넣을 때 사용한다.
	 * filetools 의 설정을 변경했음.....-- 기록사항
	 * @param blob 업로드 할 파일
	 * @return
	 */
	public static HashMap<String, String> cKEditorDragAndDropFileUpload(MultipartFile blob, String id) {
		HashMap<String, String> result = new HashMap<>();
		if(blob.getOriginalFilename().equals("blob")) { //Base64로 인코딩된 이미지가 업로드 되었음
			logger.info("이미 base64인 이미지");
			byte[] imageBytes = null;
			String base64 = null;
			try {
				imageBytes = IOUtils.toByteArray(blob.getInputStream());
				base64 = Base64.getEncoder().encodeToString(imageBytes);
				base64 = "data:image/" + "blob" + ";base64," + base64;
			} catch (IOException e) {
				e.printStackTrace();
			}
			result.put("uploaded", "1");
			result.put("fileName", blob.getOriginalFilename());
			result.put("url", base64);
			
		} else if(!blob.getOriginalFilename().equals("blob")) { //이미지 파일일 때
			String fileName = saveFile(blob, fileSaveDirPath, id);
			result.put("uploaded", "1");
			result.put("fileName", fileName);
			result.put("url", "/resources/" + uploadFolderName + "/" + id + "/" + fileName);
		} else {
			logger.warn("파일 업로드 실패");
			result.put("uploaded", "0");
			result.put("fileName", "fail");
			result.put("url", "fail");
			result.put("error", "이미지 파일이 아닙니다.");
		}
		
		//"uploaded": 1,  <- success일때 1, fail일때0
	    //"fileName": "foo.jpg",  <-파일명
	    //"url": "/files/foo.jpg" <-파일 url
		//"error" : "실패 메시지"  <- 업로드 실패했을 때 메시지
		return result;
	}
	
	
	/**
	 * 질문하기 페이지에서 녹화한 동영상을 저장한다.
	 * @param blob 저장할 동영상
	 * @param id 파일을 업로드(전송)한 유저의 id
	 * @param questionNum 동영상이 작성된 글(questionNum)의 번호
	 * @return 저장된 동영상의 src 주소
	 */
	public static String blob_upload(MultipartFile blob, String id, int questionNum) {
		// questionNum 에 해당하는 곳에 저장해야함..
		
		logger.info("blob_upload: " + blob.getOriginalFilename());
		String fileName = FileService.saveFile(blob, FileService.fileSaveDirPath, id);
		String path = "/resources/" + uploadFolderName + "/" + id + "/" + fileName;
		return path;
	}
	
	/**
	 * 서버에 저장된 파일의 전체 경로를 전달받아, 해당 파일을 삭제
	 * @param fullpath 삭제할 파일의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteFile(String fullpath) {
		// 파일 삭제 여부를 리턴할 변수
		boolean result = false;

		// 전달된 전체 경로로 File객체 생성
		File delFile = new File(fullpath);

		// 해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}
		return result;
	}
}

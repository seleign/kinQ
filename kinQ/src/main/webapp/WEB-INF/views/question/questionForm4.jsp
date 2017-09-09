<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
* 본 페이지는 질문하기와 질문 수정하기가 하나인 페이지 입니다.
* 
*
 -->
<%-- CKeditor에 특정 옵션을 주거나 뭔가 바꿔야한다면, 저(준연)에게 말해주세요. 물론 기능 추가도 됩니다.--%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>質問する</title>
<!-- CKeditor -->
<script src="/resources/ckeditor/ckeditor.js"></script> 
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
<script src="/resources/ckeditor/adapters/jquery.js"></script>
<!-- 음성 녹음을 위한 RTC -->
<script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
<!-- 화면 녹화를 위한 RTC -->
<script src="https://cdn.webrtc-experiment.com/screenshot.js"></script>
<!-- RTC에서 DOM 객체를 제어하기 위한 스크립트 -->
<script src="https://rtcmulticonnection.herokuapp.com/dev/getHTMLMediaElement.js"></script>
<!-- 드래그/리사이즈를 위해 사용한 jquery-ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 드래그/리사이즈를 위해 사용한 css // 아직 여기서 어느 코드가 역할을 하는지 모름... 알아봐야함 -->
<link rel="stylesheet" type="text/css"
 href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/themes/cupertino/jquery-ui.css" />
 
<script type="text/javascript">
window.onload = function() {
	// 1. Ckeditor 초기화, 파일 업로드 주소 설정
		CKEDITOR.replace('questionContent',{ 
    	    		filebrowserUploadUrl: 'cKEditorFileUpload'
   		 }); // Ckeditor 초기화 종료
	
	// 2. 긴급 질문의 시간제한(date) input 활성/비활성
	//데이트 피커로 시간 고르게하면 편할듯?? -- 추가 코드 작성 필요
	$('#urgent').click(function() {
		if($(this).is(":checked")) { //체크되어 있다면, 시간제한을 선택할 수 있게 한다.
			$("#timeLimit").prop('disabled', false);
		} else { //체크가 안되어 있으면, 시간제한을 선택할 수 없게하고, val을 null로 초기화 한다.
			$("#timeLimit").prop('disabled', true);
		}
	});	//긴급 질문 시간 설정 종료
   		
	// 3. 
	
	
	//녹화
	//동영상 녹화 코드
		document.getElementById('btn-record-webm').onclick = function() {
			this.disabled = true;
			navigator.mediaDevices.getUserMedia({
				audio : true
			}).then(function(audioStream) {
				this.audioStream = audioStream;
				var canvas = document.getElementById('canvas');
				var finalStream = new MediaStream();
				this.canvasStream = canvas.captureStream();
				audioStream.getAudioTracks().forEach(function(track) {
					finalStream.addTrack(track);
				});
				canvasStream.getVideoTracks().forEach(function(track) {
					finalStream.addTrack(track);
				});

				recorder = RecordRTC(finalStream, {
					type : 'video'
				});
				recorder.startRecording();
			}); //then end

			//공유하는 DIV 쪽 기능
			stop = false;
			var elementToShare = document.getElementById('HtmlTagFromTheCKEDITOR');
			var canvas2d = document.createElement('canvas');
			var context = canvas2d.getContext('2d');
			canvas2d.width = elementToShare.clientWidth;
			canvas2d.height = elementToShare.clientHeight;

			canvas2d.style.top = 0;
			canvas2d.style.left = 0;
			canvas2d.style.zIndex = -1;
			$('#video_container').append(canvas2d);
			//(document.body).appendChild(canvas2d);
			(function looper() {
				if (stop) {
					recorder.stopRecording(function() {
						blob = recorder.getBlob(); //<이게 동영상 데이터
						$('#video_container').html('<video controls src="'
								+ URL.createObjectURL(blob)
								+ '" autoplay loop></video>');
						
						$("#canvas").remove(); //재생중이던 화면 정지
						var URL_BLOB = String(URL.createObjectURL(blob));
						var fileName = URL_BLOB.substring(URL_BLOB.lastIndexOf("/")+1 , URL_BLOB.length);
						var fileExt = blob.type.substring(blob.type.lastIndexOf("/")+1, blob.type.length);
						
						//ajax로 서버에 녹화된 영상 파일 전송
						var filename = String(URL.createObjectURL(blob));
						var formElement = document.querySelector("form");
						var formData = new FormData(formElement);
						
						formData.append("blob", blob, fileName+ "." +fileExt);

						$.ajax({
		                    url: 'blob_upload',
		                    processData: false,
		                    contentType: false,
		                    data: formData,
		                    type: 'POST',
		                    success: function(result){
		                    //성공시
		                            }
		                    });
						
						audioStream.stop();
						canvasStream.stop();
					});
					return;
				}

				(function looper() {
					html2canvas(elementToShare, {
						grabMouse : false,
						onrendered : function(canvas) {
							context.clearRect(0, 0, canvas2d.width,
									canvas2d.height);
							context.drawImage(canvas, 0, 0, canvas2d.width,
									canvas2d.height);
						}
					});
					canvas2d.id = 'canvas';
				})();

				setTimeout(looper, 10); //이게 화면 프레임수
			})();

		};
		
		document.getElementById('btn-record-webm-stop').onclick = function() {
			stop = true;
			this.disabled = true;
			return false;
		}
	
}; //onload 종료

// id에 해당하는 객체에 CKEDITOR에 작성된 글(html tag)를 넣는다. 주로 textarea에 사용됨.
function setTo_id_HtmlTagFromTheCKEDITOR(id) {
	$(id).empty(); //기존에 작성된 것을 삭제한다.
	$(id).append(getHtmlTagFromTheCKEDITOR());
};

// CKEDITOR에 작성된 글(html tag)를 가져온다.
function getHtmlTagFromTheCKEDITOR() {
	return CKEDITOR.instances.questionContent.getData();
};

// 동영상 녹화하는 페이지에 있는 태그들을 이동, 드래그 가능하게 만든다.

// 이게 하위 기능인듯
// id로 받은 태그 내의 모든 img의 src를 base64로 변환한다.
function imgSrcToBase64Src_In_id(id) {
	$(id).find('img').each(function(){
		var thisImg = this;
		toDataURL($(this).attr('src'), function(dataUrl) {
			$(thisImg).attr('src',dataUrl);
			$(thisImg).addClass('img_rnd');
			$(thisImg).wrap('<div class="rnd" />');
			tttta();
	  	})
	})
};

function tttta() {
	$('.img_rnd').resizable();
	$('.rnd').draggable({
    appendTo: 'body',
    start: function(event, ui) {
        isDraggingMedia = true;
    },
    stop: function(event, ui) {
        isDraggingMedia = false;
        // blah
    }
	});
}

// img src를 base64로 바꿔서, callback으로 돌려준다. 아웃풋은 jpg, png등으로 설정가능하다.
// -- 심각한 오류: CORS 문제가 있는 사이트의 이미지는 변경 불가능... 서버쪽에서 base64로 바꿔줘야할듯..
function toDataURL(src, callback, outputFormat) {
	  var img = new Image();
	  img.crossOrigin = 'Anonymous';
	  img.onload = function() {
	    var canvas = document.createElement('CANVAS');
	    var ctx = canvas.getContext('2d');
	    var dataURL;
	    canvas.height = this.naturalHeight;
	    canvas.width = this.naturalWidth;
	    ctx.drawImage(this, 0, 0);
	    dataURL = canvas.toDataURL(outputFormat);
	    callback(dataURL);
	  }
	  img.src = src;
// 	  if (img.complete || img.complete === undefined) {
// 	    img.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
// 	    img.src = src;
// 	  }
};
</script>
</head>
<body>

<form action="addQuestion" method="post" enctype="multipart/form-data" onsubmit="return false;">

<!-- 대분류(Major) 선택 -->
<label for="major">分類</label>
<select id="major" name="major" required="required">
<optgroup label="選択">
	<c:forEach var="major" items="${majorList}">
	<option value="${major.majorNum}">${major.majorName}</option>
	</c:forEach>
</optgroup>
</select>

<!-- 타이틀 -->
<label for="title">タイトル</label>
<input type="text" id="title" name="title" value="${title}">

<!-- 긴급질문 -->
<label for="urgent">緊急質問</label>
<label for="urgent">
<input type="checkbox" id="urgent" name="urgent" value="urgent" onclick=" ">大至急です。
<input type="text" id="timeLimit" name="timeLimit" disabled="disabled">
</label>
<!-- 태그 입력 -->
<br>
<p>여기에 태그를 입력 받는다. -- 누가 추가 좀...</p>

<%-- 스텝 1 - 일반 게시글 --%>
<div id="step1">
<h1>step1. 일반 글쓰기</h1>
<!-- CKeditor 컨텐츠 -->
<textarea name="questionContent">${questionContent}
<img alt="" src="https://www.gravatar.com/avatar/d50c83cc0c6523b4d3f6085295c953e0" style="height:300px; width:300px" /> <img src="http://images.goodsmile.info/cgm/images/product/20151005/5261/35771/large/06279a95903ea162cc97f533c57b3843.jpg" style="height:300px; width:300px" />
</textarea> 

<!-- 기타 파일 업로드 -->
<%-- 멀티 파일 업로더를 설치해주세요. 코드를 봐도 이해가 안됨... --%>
멀티파일 업로더<br>
<button type="submit">일반 게시글로 업로드</button>
<button type="button" onclick="setTo_id_HtmlTagFromTheCKEDITOR(HtmlTagFromTheCKEDITOR)">동영상 만들기</button>
<button type="button">취소</button>

</div> <!-- step 1 = 일반 글쓰기 종료 -->

<%-- 스텝 2 - 동영상 게시글 --%>
<div id="step2">
<h1>step2. WEBRTC를 이용한 녹화...</h1>
<button id="btn-record-webm" style="font-size: inherit;">화면 녹화</button>
<button id="btn-record-webm-stop" style="font-size: inherit;">화면 중지</button>

<!-- 기존에 녹화된 영상과 녹화 할 영역(canvas)을 가진 DIV -->
<div id="video_and_cavas_container">
	<div id="video_container">
		<!-- 수정하기 일 땐 기존에 녹화된 파일이 여기에 보인다. -->
		<video src="${video_src }" hidden="hidden"></video>
		<img id="shared-part-of-screen-preview" style="max-width: 100%;"> <!-- 이게 전송되는 화면의 프리뷰 -->
	</div>
	<div id="canvas_container">
		<!-- canvas -->
		<div id="HtmlTagFromTheCKEDITOR" contenteditable="true"
			style="text-align: center; border-top: 5px solid gray; width: 500px; background-color: #FBFBEE; height: 500px">
			<!-- 이 안에 있는 요소만 녹화가 되기 때문에, 드래그앤 드랍으로 여기로 div를 옴겨와야 한다. -->
		</div>
	</div>
</div>
<!--
<div id="HtmlTagFromTheCKEDITOR">
 여기에 에디터에 작성된 코드가 append된다. -->

	
</div>
</div> <!-- step 2 = 동영상 게시글 종료 -->

<button onclick="imgSrcToBase64Src_In_id(HtmlTagFromTheCKEDITOR)">imgSrcToBase64Src_In_id & 드래그, 리사이즈 가능하게</button>
<button type="submit">submit</button>
</form>
 

</body>
</html>
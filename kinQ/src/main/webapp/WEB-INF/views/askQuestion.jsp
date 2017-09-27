<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>Ask me – Responsive Questions and Answers Template</title>
<meta name="description"
	content="Ask me Responsive Questions and Answers Template">
<meta name="author" content="vbegy">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Main Style -->
<link rel="stylesheet" href="./resources/css/style.css">

<!-- Skins -->
<link rel="stylesheet" href="./resources/css/purple.css">

<!-- Responsive Style -->
<link rel="stylesheet" href="./resources/css/responsive.css">

<!-- Favicons -->
<link rel="shortcut icon" href="./resources/images/favicon_qs.png">

<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="./resources/js/jquery-migrate-1.4.1.js"></script>
<!-- js -->

	<!-- CKeditor -->
	<script src="./resources/ckeditor/ckeditor.js"></script>
	<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
	<script src="./resources/ckeditor/adapters/jquery.js"></script>

	<!-- 음성 녹음을 위한 RTC -->
	<script src="./resources/js/RecordRTC.js"></script>
	<!-- 화면 녹화를 위한 RTC -->
	<script src="./resources/js/screenshot.js"></script>
	<!-- RTC에서 DOM 객체를 제어하기 위한 스크립트 -->
	<script src="./resources/js/getHTMLMediaElement.js"></script>

	<script src="./resources/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="./resources/js/jquery.easing.1.3.min.js"></script>
	<script src="./resources/js/html5.js"></script>
	<script src="./resources/js/twitter/jquery.tweet.js"></script>
	<script src="./resources/js/jflickrfeed.min.js"></script>
	<script src="./resources/js/jquery.inview.min.js"></script>
	<script src="./resources/js/jquery.tipsy.js"></script>
	<script src="./resources/js/tabs.js"></script>
	<script src="./resources/js/jquery.flexslider.js"></script>
	<script src="./resources/js/jquery.prettyPhoto.js"></script>
	<script src="./resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script src="./resources/js/jquery.scrollTo.js"></script>
	<script src="./resources/js/jquery.nav.js"></script>
	<script src="./resources/js/tags.js"></script>
	<script src="./resources/js/jquery.bxslider.min.js"></script>
	<script src="./resources/js/custom.js"></script>

<script type="text/javascript">
	//DB에서 대분류 소분류 목록 가져오기 
	function loadMinorList(major){	
		$.ajax({
			url: 'minorList',
			method: 'get',
			data: {major : major},
			success: function(minorList){
				$("#minorSection").empty();
				$("#major").val(major).prop("selected", true);
				for(var i = 0; i < minorList.length; i++) {
					if(minorList[i].majorNum == major) {
						$("#minorSection").append('<label for="minorNum'+ minorList[i].minorNum +'"><input type="radio" required="required" value="'+ minorList[i].minorNum +'" name="MinorNum" id="minorNum'+ minorList[i].minorNum +'">'+ minorList[i].minorName + '</label>');
					}
				}
			}
		});
	}

	
window.onload = function() {
	
	// 1. Ckeditor 초기화, 파일 업로드 주소 설정
	CKEDITOR.replace('question_details',{ 
		filebrowserUploadUrl: 'cKEditorFileUpload'
	}); 
	
	// base64로 바꿀 임시 div
		 $("#tmpContents").hide();
	
	// 4. 녹화 영역의 크기를 가로 == 세로 로 맞춤
	var elementToShare = document.getElementById('HtmlTagFromTheCKEDITOR');
	$(elementToShare).height($(elementToShare).width());
	$(elementToShare).css('max-height', $(elementToShare).width());
	$(elementToShare).css('overflow-y', "auto");
	
	// 5. questionNum이 null이면 다시 페이지를 불러온다.
	if( isEmpty($("#questionNum").val() ) ) {
		location.href="addQuestion"; 
	}
	
	// 6. 수정하기일 때, 태그를 넣어준다.
	if(${question.relatedTag != null? true:false}) {
		<c:if test="${question.relatedTag != null? true:false }">
			<c:forEach var="tags" items="${question.relatedTag}">
				$('.taglist').prepend('<li class="tag" id="TAG${tags}"><span>'+ '${tags}'  +'</span> <a tabindex="-1" class="delete" onclick="deleteTag(TAG${tags})"><span>[X]</span></a></li>');
			</c:forEach>
		</c:if>
	}
	
	// 7. 수정하기일 때, 제목을 넣어준다.
	if(${question.title != null? true:false}) {
		$("#question-title").val("${question.title}");
	}
	if(${title != null? true:false}) {
		$("#question-title").val("${title}");
	}
	
	// 8. 현재 계정의 포인트를 가져온다.
	getRecentPoint();
	
	//녹화 -- 현재 맥에서만 작동 함
	//동영상 녹화 코드
		document.getElementById('btn-record-webm').onclick = function() {
		//비디오 컨테이너에 있는걸 날려버려야 함.
		$("#btn-record-webm-stop").attr("disabled", false);
		$('#video_container').empty();
		
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
			//$(elementToShare).height($(elementToShare).width());
			//$(elementToShare).css('max-height', $(elementToShare).width());
			//$(elementToShare).css('overflow-y', "auto");
			//$(elementToShare).height($(elementToShare).width());
			
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
						
						$("#canvas").remove(); //재생중이던 화면 정지
						var URL_BLOB = String(window.webkitURL.createObjectURL(blob));
						var fileName = URL_BLOB.substring(URL_BLOB.lastIndexOf("/")+1 , URL_BLOB.length);
						var fileExt = blob.type.substring(blob.type.lastIndexOf("/")+1, blob.type.length);
						
						//ajax로 서버에 녹화된 영상 파일 전송
						var filename = String(window.webkitURL.createObjectURL(blob));
						var formElement = document.querySelector("form");
						var formData = new FormData(formElement);
						
						formData.append("blob", blob, fileName+ "." +fileExt);
						formData.append("questionNum", '${questionNum}');
						
						$.ajax({
		                    url: 'blob_upload',
		                    processData: false,
		                    contentType: false,
		                    data: formData, 
		                    type: 'POST',
		                    success: function(result){
		                    			$('#video_container').html('<video controls src="'
		 								+ window.webkitURL.createObjectURL(blob)
		 								+ '" autoplay loop></video>');
		                    			$('#videoSrc').val(result);
		                    	
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
				setTimeout(looper, 300); //이게 화면 프레임수
			})();
		};
		
		// 녹화 정지 버튼
		document.getElementById('btn-record-webm-stop').onclick = function() {
			stop = true;
			this.disabled = true
			$("#btn-record-webm").attr("disabled", false);
			return false;
		}
		
		// 실수로 인풋 창에서 "엔터"를 눌러서 전송되는 것을 막는다.
		$(document).on("keypress", 'form', function (e) {
		    var code = e.keyCode || e.which;
		    if (code == 13) {
		        e.preventDefault();
		        return false;
		    }
		});

} //onload 종료

//id에 해당하는 객체에 CKEDITOR에 작성된 글(html tag)를 넣는다.
function setTo_id_HtmlTagFromTheCKEDITOR(id) {
	$(id).empty(); //기존에 작성된 것을 삭제한다.
	imgSrcToBase64Src();
};

//CKEDITOR에 작성된 글(html tag)를 가져온다.
function getHtmlTagFromTheCKEDITOR() {
	return CKEDITOR.instances.question_details.getData();
};

//id로 받은 태그 내의 모든 태그들을 드래그, 리사이즈 가능하게 만든다.
function moveableAndDragable(id) {
	//code Here
}

//태그 내의 모든 img의 src를 base64로 변환한다.
var Content;
var getUrl = window.location;
var baseUrl = getUrl.protocol + "//" + getUrl.host;
// 이 함수는 에디터 -> 녹화화면으로 내용이 옴겨질 때 사용된다.
function imgSrcToBase64Src() {
	// ckEditor에서 html을 가져온다.
	Content = CKEDITOR.instances.question_details.getData();	

	// 임시 영역에 붙인다.
	$("#tmpContents").html(Content);

	// 여기에서 img가 base64가 아닌건 base64로 바꾼다.
	var allImageCount = $("#tmpContents").find('img').length;
	var nowImageCount = 0;
	$("#tmpContents").find('img').each(function(){
		var imgObject = this;
		var imgSrc = $(imgObject).attr('src');
		if( imgSrc.substring(0, 5) == 'data:') { // 이미 Base64면 변환 작업을 하지 않는다.
			return;
		} else if(imgSrc.substring(0,1) == '.') {  // .resources 인 경우
			imgSrc = imgSrc.substring(1, imgSrc.length);
			imgSrc = baseUrl + imgSrc;
			$(imgObject).attr('src', imgSrc);
			imgToBase64()
		} 
		
		// Base64가 아니면 ajax로 Base64로 변환한다.
			function imgToBase64() {
				$.ajax({
		            url: 'imgToBase64',
		            data: {
		            		imgSrc: imgSrc
		           		},
		            type: 'GET',
		            success: function(result){
						$(imgObject).attr('src', result.base64)
						CKEDITOR.instances.HtmlTagFromTheCKEDITOR.setData($("#tmpContents").html());  //TODO
						
		                    }
		            });
			}
	}) 
};

//데이터가 널 또는 공백인지 확인하는 함수
var isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true
	}else{
		return false
	}
};

//태그를 입력하면 ol, li에 태그가 생긴다. 이를 서버에 전송하기 위해 hidden input 태그(name = "")으로 만든다.
//유효성 검사를 할 때 또는 서버로 전송하기 전에 이 함수를 호툴한다.
function liToHiddenRelatedTag() {
	$("#hiddenRelatedTag").empty();
	$("li.tag > span").each(function() {
		$("#hiddenRelatedTag").append('<input type="hidden" name="relatedTag" value="'+ $(this).text() +'">');
	})
}

//유효성 검사 isEmpty()
var videoIsRecorded = false;  // 이거 사용하도록 수정해야함..
function validationCheck() {
	liToHiddenRelatedTag(); // 태그 창에 있는 li를 히든 input에 넣음.
	getRecentPoint(); // 현재 소유 포인트를 한번 더 가져옴
	
	setTimeLimit(); // 긴급 알람 시간을 유효성 검사 할 때 다시 갱신
	var title = $("#question-title").val();
	var questionNum = $("#questionNum").val();
	var questionContent = CKEDITOR.instances.question_details.getData();
	var major = $("#major").val();
	var point = $("#point").val();

	//RecentPoint // 소유하고 있는 포인트
	if(RecentPoint < point) { // 걸은포인트가 소유한것보다 더 큰경우
		alert("ポイントが足りないです。")
		return false;
	}
	
	if(major == 0) {
		alert('Categoryを選んでください。')
		return false;
	}
	
	if( !isEmpty(title) && !isEmpty(questionNum) && !isEmpty(questionContent) && !isEmpty(major) ) {
		return true;
	} 	
	
//	alert(title)
//	alert(questionNum)
//	alert(questionContent)
//	alert(major)
	return false;
}

// 긴급알람 시간 설정
function setTimeLimit() {
	var selectdTime = parseInt($("#selectdTime").val());
	if(selectdTime == 0) {
		$("#timeLimit").val("");
		return;
	}
	
	var date = new Date();
	var year = parseInt(date.getFullYear());
	var month = parseInt(date.getMonth() + 1);
	var day = parseInt(date.getDate());
	var hour = parseInt(date.getHours());
	var minute = parseInt(date.getMinutes());
	var second = parseInt(date.getSeconds());
	
	second = parseInt(leadingZeros(second, 2));
	
	if((minute + selectdTime) > 60) { //현재 분과 선택된 분이 60분이 넘으면...
		hour = hour + 1;
		minute = (minute + selectdTime) - 60;
		minute = leadingZeros(minute, 2);
	} else {
		minute = minute + selectdTime;
	}
	
	if(hour > 24) {
		day = day + 1;
		hour = hour - 24;
	}
	$("#timeLimit").val( year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second + ".0");
	
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (var i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
	
}

// 수정모드일 때, 태그 삭제 가능하도록...
function deleteTag(tag) {
	$(tag).remove();
}

// 현재 포인트를 가져옴..
var RecentPoint = 0;
function getRecentPoint() {
	$.ajax({
		url: 'pointCheck',
		method: 'post',
		data: {},
		success: function(result){
			$('#RecentPoint').html(result);
			RecentPoint = result;
		}
	});
}
	//DB에서 대분류 소분류 목록 가져오기 
	function loadMinorList(major){	
		$.ajax({
			url: 'minorList',
			method: 'get',
			data: {major : major},
			success: function(minorList){
				$("#minorSection").empty();
				$("#major").val(major).prop("selected", true);
				for(var i = 0; i < minorList.length; i++) {
					if(minorList[i].majorNum == major) {
						$("#minorSection").append('<label for="minorNum'+ minorList[i].minorNum +'"><input type="radio" required="required" value="'+ minorList[i].minorNum +'" name="MinorNum" id="minorNum'+ minorList[i].minorNum +'">'+ minorList[i].minorName + '</label>');
					}
				}
			}
		});
	}

</script>

</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div class="breadcrumbs" id="sectionBack">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Ask Question</h1>

				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a> <span class="crumbs-span">/</span> <a
							href="#">Pages</a> <span class="crumbs-span">/</span> <span
							class="current">Ask Question</span>
					</div>
				</div>
			</div>
			<!-- End row -->
		</section>
		<!-- End container -->
	</div>
	<!-- End breadcrumbs -->

	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">

				<div class="page-content ask-question">
					<div class="boxedtitle page-title">
						<h2>Ask Question</h2>
					</div>

					<p>こんにちは。KinQに知りたい質問や気になることを気軽くに質問をすることができます。</p>

					<div class="form-style form-style-3" id="question-submit">
						<form
							action='${question.title == null? "addQuestion":"modifyQuestion"}'
							method="post" enctype="multipart/form-data"
							onsubmit="return validationCheck();">

							<!-- 글쓰기 번호가 여기에 hidden으로 존재한다. -->
							<input type="hidden" value="${questionNum}" name="questionNum"
								id="questionNum"
								placeholder="여기에는 Q_BOARD 시퀀스로부터 가져온 questionNum가 히든으로 있는다."
								required="required">

							<!-- 이걸 왜 nullable로 하지 않은이유가 있습니까? 누가 설계한것인가? -->
							<select name="qstatus" style="display: none;">
								<option value="in progress">in progress</option>
								<option value="solved">solved</option>
							</select>

							<div class="form-inputs clearfix">
								<p>
									<label class="required">タイトル<span>*</span></label>
									<c:if test="${title != null? true:false }">
										<input type="text" id="question-title" value="${title}"
											name="title" required="required">
									</c:if>
									<c:if test="${title == null? true:false }">
										<input type="text" id="question-title"
											value="${question.title}" name="title" required="required">
									</c:if>
									<span class="form-description">回答者が見やすいタイトルを入力してください。</span>
								</p>
								<div id="form-textarea">
									<label class="required">質問の内容<span>*</span></label>
									<p>
										<textarea id="question_details" name="questionContent"
											required="required" aria-required="true" cols="58" rows="8">${question.questionContent}</textarea>
										<span class="form-description">質問の内容がアップロードされます。また、映像の録画にも使用されます。</span>
									</p>
								</div>


								<!-- 아직 파일 업로드를 고려하여 컨트롤러를 만들지 않음. -->
								<!-- 								<label>Attachment</label> -->
								<!-- 									<noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript> -->
								<!-- 								<div class="fileinputs"> -->
								<!-- 									<input type="file" class="file"> -->
								<!-- 									<div class="fakefile"> -->
								<!-- 										<button type="button" class="button small margin_0">Select file</button> -->
								<!-- 										<span><i class="icon-arrow-up"></i>Browse</span> -->
								<!-- 									</div> -->
								<!-- 								</div> -->

								<p>
									<label class="required">Point</label> <input type="number"
										required="required" class="input" id="point" name="point"
										value="${question.point}"
										style="width: 82%; display: inline-block;"> <span
										class="form-description"> 質問するためにはポイントが必要です。 MAXIUM
										POINT: <output id="RecentPoint"></output>
									</span>
								</p>


								<p>
									<label>Tags</label> <input type="text" class="input"
										id="question_tags" data-seperator=","> <span
										class="form-description">質問の内容をタグで入力すると、より多くの回答者からの回答を得ることができます。<span
										class="color">question , poll</span> .
									</span>
								</p>

								<!-- 위에 tag입력으로 받은 것이 이 div에 hidden으로 생성된다. -->
								<div id="hiddenRelatedTag"></div>

								<p>
									<label class="required">Category<span>*</span></label> <span
										class="styled-select"> <select id="major" name="major"
										onchange="javascript:loadMinorList(this.options[this.selectedIndex].value)"
										required="required">
											<option value="0">選択</option>
											<c:forEach var="major" items="${majorList }">
												<option value="${major.majorNum}">${major.majorName}</option>
											</c:forEach>
									</select> <span class="form-description">
											<div id="minorSection"></div>
									</span>

									</span>
								</p>
								<p>
									<label for="urgent" class="required">緊急質問</label> <span
										id="urgent-span"> <label for="selectdTime" style="">大至急です。</label>
										<select id="selectdTime" onchange="setTimeLimit()"
										style="width: 200px; display: inline-block;">
											<option value="0">時間を選択してください</option>
											<option value="1">1分</option>
											<option value="3">3分</option>
											<option value="5">5分</option>
											<option value="10">10分</option>
											<option value="30">30分</option>
											<option value="60">60分</option>
									</select> 以内で質問の答えをもらいたいです。 <input type="text" id="timeLimit"
										name="timeLimit" value="${question.timeLimit}"
										style="width: 20%; display: none;">
									</span>
								</p>
								<p>
								<div class="ask-video">
									<label class="required">video<span>*</span></label>
									<div id="step2">
										<h1>質問の内容に音声をつけられます。</h1>

										<input type="button" id="btn-record-webm"
											class="button color small submit" value="画面の録画を始める">
										<input type="button" id="btn-record-webm-stop"
											class="button color small submit" value="画面の録画を中止する">

										<!-- 녹화한 영상이 있다면, 여기에 hidden으로 videoSrc가 존재한다. -->
										<input type="text" name="videoSrc"
											value="${question.videoSrc}" id="videoSrc"
											style="display: none;">


										<!-- 기존에 녹화된 영상과 녹화 할 영역(canvas)을 가진 DIV -->
										<div id="video_and_cavas_container">
											<div id="canvas_container">
												<div id="HtmlTagFromTheCKEDITOR" contenteditable="true"
													style="background-color: #FBFBEE; width: 100%;">
													<!-- 이 안에 있는 요소만 녹화가 되기 때문에, 드래그앤 드랍으로 여기로 div를 옴겨와야 한다. -->
													<!-- 여기에 에디터에 쓴 내용이 여기로 옴겨진다.  -->
												</div>
											</div>
											<div id="video_container" style="width: 100%;">
												<!-- 수정하기 일 땐 기존에 녹화된 파일이 여기에 보인다. -->
												<c:if test="${question.videoSrc == null}">
													<!-- 처음 글을 쓰거나, 기존에 영상을 녹화하지 않은 상태로 수정할 경우 녹화한 동영상이 없다. -->
												</c:if>
												<c:if test="${question.videoSrc != null}">
													<video src="${question.videoSrc}" controls="controls"
														preload="auto"></video>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								</p>
							</div>
							<p id="p-ask-buttons" class="form-submit">
								<input type="submit" id="publish-question" value="質問する"
									class="button color small submit"> <input type="button"
									id="ask-button" value="画面の録画" class="button color small submit"
									onclick="setTo_id_HtmlTagFromTheCKEDITOR(HtmlTagFromTheCKEDITOR)">
							</p>
						</form>
					</div>
				</div>
				<!-- End page-content -->
			</div>
			<!-- End main -->
			<jsp:include page="aside.jsp" flush="false" />
		</div>
		<!-- End row -->
	</section>
	<!-- End container -->

	<jsp:include page="footer.jsp" flush="false" />
	<!-- End wrap -->

	<div class="go-up">
		<i class="icon-chevron-up"></i>
	</div> 

	<div id="tmpContents"></div>
</body>
</html>
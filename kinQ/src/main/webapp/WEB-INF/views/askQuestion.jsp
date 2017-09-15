<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>Ask me – Responsive Questions and Answers Template</title>
	<meta name="description" content="Ask me Responsive Questions and Answers Template">
	<meta name="author" content="vbegy">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css">
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/gray.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
	
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.js"></script>
<!-- chosen 설정 파일-->
<link type="text/css" href="./resources/css/chosen.min.css" rel="stylesheet">
	<script type="text/javascript">
	//DB에서 대분류 소분류 목록 가져오기 
	function loadMinorList(major){
		$.ajax({
			url: 'minorList',
			method: 'get',
			data: {major : major},
			success: function(minorList){
				var html = '';
				$.each(minorList, function(index, element){
					if(element.majorNum == major){
						var isPrinted = false;
						for( var i in chkNum) {
							if( element.minorNum == chkNum[i]) {
								html +=	'<input type="checkbox" id="chk'+element.minorNum+'" name="minor" checked="checked" disabled="true" onchange="javascript:addCheckboxList(\''+element.minorName+'\', \''+element.minorNum+'\')" value="'+element.minorNum+'">'+element.minorName+'<br>';
								isPrinted = true;
								break;
							}
						}
						if( !isPrinted) {
							html +=	'<input type="checkbox" id="chk'+element.minorNum+'" name="minor" onchange="javascript:addCheckboxList(\''+element.minorName+'\', \''+element.minorNum+'\')" value="'+element.minorNum+'">'+element.minorName+'<br>';
						}
					}//outer if
				});
				$('#minorSection').html(html);		
				html ='';
			}
		});
	}
	

	var chk = new Array(); // 소분류 일본명
	var chkNum = new Array(); // 소분류 고유 번호
	
	function addCheckboxList(minorName, minorNum){
			
		 	$('#chk'+minorNum).prop('disabled', true);

			checkboxHtml = '';

				$('#allInterests').empty();


				chk.push(minorName);
				chkNum.push(minorNum);
					
			for(var i in chk){	
				checkboxHtml+='<li value="'+chkNum[i]+'">'+chk[i]+'&nbsp;<a class="icon-remove" onclick="javascript:unchecking('+chkNum[i]+')"><a></li>'
			}
			$('#allInterests').html(checkboxHtml);
		}
	
	function unchecking(deleteNum){
		checkboxHtml = '';
		for(var i=0;i<chkNum.length;i++){
			if(chkNum[i]==deleteNum){
				var index = chkNum.indexOf(chkNum[i]);
				chk.splice(index, 1);
				chkNum.splice(index, 1);
				
				$('#chk'+deleteNum).prop('checked', false);
				$('#chk'+deleteNum).prop('disabled', false);
				
				
				for(var i in chk){	
					checkboxHtml+='<li id="del'+chkNum[i]+'">'+chk[i]+'&nbsp;<a class="icon-remove" onclick="javascript:unchecking('+chkNum[i]+')"><a></li>'
				}
				$('#allInterests').html(checkboxHtml);
			}
		}
	}
	</script>
	
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	
		
	<div class="breadcrumbs">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Ask Question</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<a href="#">Pages</a>
						<span class="crumbs-span">/</span>
						<span class="current">Ask Question</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				
				<div class="page-content ask-question">
					<div class="boxedtitle page-title"><h2>Ask Question</h2></div>
					
					<p>Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque.</p>
					
					<div class="form-style form-style-3" id="question-submit">
						<form action="askQuestion" method="post" enctype="multipart/form-data">
						<!-- 글쓰기 번호가 여기에 hidden으로 존재한다. -->
						<input type="text" value="${questionNum}" name="questionNum" placeholder="여기에는 Q_BOARD 시퀀스로부터 가져온 questionNum가 히든으로 있는다." required="required">
						
						<!-- 이걸 왜 nullable로 하지 않은이유가 있습니까? -->
						<select name="qstatus">
							<option value="in progress">in progress</option>
							<option value="solved">solved</option>
						</select>
						
							<div class="form-inputs clearfix">
								<p>
									<label class="required">Question Title<span>*</span></label>
									<input type="text" id="question-title" name="title">
									<span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>
								</p>
								<div id="form-textarea">
									<label class="required">Details<span>*</span></label>
								<p>
									<textarea id="question_details" name="questionContent" aria-required="true" cols="58" rows="8">${questionContent}</textarea>
									<span class="form-description">Type the description thoroughly and in detail .</span>
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
									<label>Tags</label>
									<input type="text" class="input" name="relatedTag" id="question_tags" data-seperator=",">
									<span class="form-description">Please choose  suitable Keywords Ex : <span class="color">question , poll</span> .</span>
								</p>
								<p>
									<label class="required">Category<span>*</span></label>
									<span class="styled-select">
										<select id="major" name="major" onchange="javascript:loadMinorList(this.options[this.selectedIndex].value)">
										<option value="0" selected="selected">選択</option>
										<c:forEach var="major" items="${majorList }">
											<option value="${major.majorNum}">${major.majorName}</option>
										</c:forEach>
										</select>
									<span class="form-description"><div id="minorSection"></div></span>
									<span class="form-description"><ul id="allInterests"></ul></span>
									</span>
								</p>
								<p>
									<label for="urgent" class="required">緊急質問</label>
									<span id="urgent-span">
									<c:if test="${timeLimit == null? true : false }">
										<input type="checkbox" id="urgent">大至急です。
										<input type="text" name="timeLimit" value="1991/05/31">
									</c:if>
									<c:if test="${timeLimit != null? true : false }">
										<input type="checkbox" id="urgent" checked="checked">大至急です。
										<input type="text" name="timeLimit" value="${timeLimit}">
									</c:if>
									</span>
								</p>
								<p>
								<div class="ask-video">
									<label class="required">video<span>*</span></label>
									<div id="step2">
									<h1>step2. WEBRTC를 이용한 녹화...</h1>
									<button id="btn-record-webm" style="font-size: inherit;">화면 녹화</button>
									<button id="btn-record-webm-stop" style="font-size: inherit;" disabled="disabled">화면 중지</button>
									
									<!-- 녹화한 영상이 있다면, 여기에 hidden으로 videoSrc가 존재한다. -->
									<input type="text" name="videoSrc" value="${videoSrc}" id="videoSrc" placeholder="녹화한 영상이 있다면, 여기에 hidden으로 videoSrc가 존재한다.">
									
									
									<!-- 기존에 녹화된 영상과 녹화 할 영역(canvas)을 가진 DIV -->
									<div id="video_and_cavas_container" >
										<div id="canvas_container">
											<div id="HtmlTagFromTheCKEDITOR" contenteditable="true" style="background-color: #FBFBEE; width: 100%;">
												<!-- 이 안에 있는 요소만 녹화가 되기 때문에, 드래그앤 드랍으로 여기로 div를 옴겨와야 한다. -->
												<!-- 여기에 에디터에 쓴 내용이 여기로 옴겨진다.  -->
											</div>
										</div>
										<div id="video_container" style="width: 100%;">
											<!-- 수정하기 일 땐 기존에 녹화된 파일이 여기에 보인다. -->
											<c:if test="${video_src == null}">
												<!-- 처음 글을 쓰거나, 기존에 영상을 녹화하지 않은 상태로 수정할 경우 녹화한 동영상이 없다. -->
											</c:if>
											<c:if test="${video_src != null}">
												<video src="${video_src}" controls="controls" preload="auto"></video>
											</c:if>
										</div>
									</div>
									</div>
								</div>
								</p>
							</div>
							<p id="p-ask-buttons" class="form-submit">
								<input type="submit" id="publish-question" value="질문하기" class="button color small submit">
								<input type="button" id="ask-button" value="영상녹화" class="button color small submit" onclick="setTo_id_HtmlTagFromTheCKEDITOR(HtmlTagFromTheCKEDITOR)">
							</p>
						</form>
					</div>
				</div><!-- End page-content -->
			</div><!-- End main -->
			<jsp:include page="aside.jsp" flush="false" />
		</div><!-- End row -->
	</section><!-- End container -->
	
	<footer id="footer">
		<section class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="widget widget_contact">
						<h3 class="widget_title">Where We Are ?</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
						<ul>
							<li>
								<span>Address :</span>
								Ask Me Network, 33 Street, syada Zeinab, Cairo, Egypt.
							</li>
							<li>
								<span>Support :</span>Support Telephone No : (+2)01111011110
							</li>
							<li>Support Email Account : info@example.com</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget_title">Quick Links</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="ask_question.html">Ask Question</a></li>
							<li><a href="#">About</a></li>
							<li><a href="cat_question.html">Questions</a></li>
							<li><a href="user_profile.html">Users</a></li>
							<li><a href="blog_1.html">Blog</a></li>
							<li><a href="right_sidebar.html">Pages</a></li>
							<li><a href="shortcodes.html">Shortcodes</a></li>
							<li><a href="contact_us.html">Contact Us</a></li>
							<li><a href="#">FAQs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="widget">
						<h3 class="widget_title">Popular Questions</h3>
						<ul class="related-posts">
							<li class="related-item">
								<h3><a href="#">This is my first Question</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
								<div class="clear"></div><span>Feb 22, 2014</span>
							</li>
							<li class="related-item">
								<h3><a href="#">This Is My Second Poll Question</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
								<div class="clear"></div><span>Feb 22, 2014</span>
							</li>
						</ul>
					</div>	
				</div>
				<div class="col-md-3">
					<div class="widget widget_twitter">
						<h3 class="widget_title">Latest Tweets</h3>
						<div class="tweet_1"></div>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</footer><!-- End footer -->
	<footer id="footer-bottom">
		<section class="container">
			<div class="copyrights f_left">Copyright 2014 Ask me | <a href="#">By 2code</a></div>
			<div class="social_icons f_right">
				<ul>
					<li class="twitter"><a original-title="Twitter" class="tooltip-n" href="#"><i class="social_icon-twitter font17"></i></a></li>
					<li class="facebook"><a original-title="Facebook" class="tooltip-n" href="#"><i class="social_icon-facebook font17"></i></a></li>
					<li class="gplus"><a original-title="Google plus" class="tooltip-n" href="#"><i class="social_icon-gplus font17"></i></a></li>
					<li class="youtube"><a original-title="Youtube" class="tooltip-n" href="#"><i class="social_icon-youtube font17"></i></a></li>
					<li class="skype"><a original-title="Skype" class="tooltip-n" href="skype:#?call"><i class="social_icon-skype font17"></i></a></li>
					<li class="flickr"><a original-title="Flickr" class="tooltip-n" href="#"><i class="social_icon-flickr font17"></i></a></li>
					<li class="rss"><a original-title="Rss" class="tooltip-n" href="#"><i class="social_icon-rss font17"></i></a></li>
				</ul>
			</div><!-- End social_icons -->
		</section><!-- End container -->
	</footer><!-- End footer-bottom -->
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>



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

<!-- 드래그/리사이즈를 위해 사용한 jquery-ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./resources/js/chosen.proto.min.js"></script>
<!-- 수정된 chosen 플러그인입니다. 교체 불가. -->




<script src="./resources/js/chosen.jquery.js"></script>
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
window.onload = function() {
	// 1. Ckeditor 초기화, 파일 업로드 주소 설정
	CKEDITOR.replace('question_details',{ 
		filebrowserUploadUrl: 'cKEditorFileUpload'
	}); 
	
	// 3. 태그 입력 chosen 초기화
	jQuery(".chosen-select").chosen({
			max_select_options: 5,
			no_result_text: "No result found. Press enter to add"
		});
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
			$(elementToShare).height($(elementToShare).width());
			$(elementToShare).css('max-height', $(elementToShare).width());
			$(elementToShare).css('overflow-y', "auto");
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

//글쓰기 페이지의 유효성 검사
function formCheck() {
	var title = $('#title').val();
	if(title==''){
		alert('おタイトルを入力して下さい。');
		return false;
	}
	
	var minor = $('#minor').val();
	if( minor=='') {
		alert( '分類を選んでください。');
		return false;
	}
	return true;
}

//id에 해당하는 객체에 CKEDITOR에 작성된 글(html tag)를 넣는다.
function setTo_id_HtmlTagFromTheCKEDITOR(id) {
	$(id).empty(); //기존에 작성된 것을 삭제한다.
	$(id).append(getHtmlTagFromTheCKEDITOR());
	imgSrcToBase64Src_In_id(id);
};

//CKEDITOR에 작성된 글(html tag)를 가져온다.
function getHtmlTagFromTheCKEDITOR() {
	return CKEDITOR.instances.question_details.getData();
};

//id로 받은 태그 내의 모든 태그들을 드래그, 리사이즈 가능하게 만든다.
function moveableAndDragable(id) {
	//code Here
}

//id로 받은 태그 내의 모든 img의 src를 base64로 변환한다.
function imgSrcToBase64Src_In_id(id) {
	$(id).find('img').each(function(){
		var imgObject = this;
		
		if( $(imgObject).attr('src').substring(0, 5) == 'data:') { // 이미 Base64면 변환 작업을 하지 않는다.
			
			return;
		} else { // Base64가 아니면 ajax로 Base64로 변환한다.
			$.ajax({
	            url: 'imgToBase64',
	            data: {
	            		imgSrc: 	$(imgObject).attr('src')
	           		},
	            type: 'GET',
	            success: function(result){
					$(imgObject).attr('src', result.base64)
	                    }
	            });
		}
	}) // each 종료
};
</script>
<!-- End js -->

</body>
</html>
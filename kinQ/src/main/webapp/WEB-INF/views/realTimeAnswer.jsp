<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>RealTime Answer</title>
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
<!-- JQuery -->
<script src="./resources/js/jquery-3.2.1.min.js"></script>
<script src="./resources/js/jquery-migrate-1.4.1.js"></script>
<script src="./resources/js/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- CKeditor -->
<script src="./resources/ckeditor/ckeditor.js"></script> 

<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
<script src="./resources/ckeditor/adapters/jquery.js"></script>

<!-- WEBRTC 용 자바스크립트 -->
<script src="./resources/js/RecordRTC.js"></script>
<script src="./resources/js/adapter-latest.js"></script>
<script src="./resources/js/screenshot.js"></script>
<script src="./resources/js/gumadapter.js"></script>
<script src="./resources/js/RTCMultiConnection.min.js"></script>
<script src="./resources/js/adapter.js"></script>
<script src="./resources/js/socket.io.js"></script>
<script src="./resources/js/getHTMLMediaElement.js"></script>
<script src="./resources/js/FileBufferReader.js"></script>

<script src="./resources/js/chosen.jquery.js"></script>
<script src="./resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="./resources/js/jquery.easing.1.3.min.js"></script>
<script src="./resources/js/html5.js"></script>
<script src="./resources/js/twitter/jquery.tweet.js"></script> 
<script src="./resources/js/jflickrfeed.min.js"></script>
<script src="./resources/js/jquery.inview.min.js"></script>
<script src="./resources/js/jquery.tipsy.js"></script>
<script src="./resources/js/jquery.flexslider.js"></script>
<script src="./resources/js/jquery.prettyPhoto.js"></script>
<script src="./resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="./resources/js/jquery.scrollTo.js"></script>
<script src="./resources/js/jquery.nav.js"></script>
<script src="./resources/js/tags.js"></script>
<script src="./resources/js/jquery.bxslider.min.js"></script>
<script src="./resources/js/custom.js"></script>
	
<script>
	var recorder;
	var audioStream;
	var canvasStream;
	var stop;
	var canvasSetTime;
	window.onload = function() { //onload 시작
		$( "#tabs" ).tabs();
		$( "#tabs2" ).tabs();

		$("#part-of-screen-to-be-shared").height(  $("#part-of-screen-to-be-shared").width() );
		$("#part-of-screen-to-be-shared").css('max-width', $("#part-of-screen-to-be-shared").width());
		$("#part-of-screen-to-be-shared").css('max-height', $("#part-of-screen-to-be-shared").width());
		$("#part-of-screen-to-be-shared").css('overflow', 'scroll');
		
		// 1. Ckeditor 초기화, 파일 업로드 주소 설정
		CKEDITOR.replace('ReplyContent',{ 
    	    		filebrowserUploadUrl: 'cKEditorFileUpload'
   		 }); // Ckeditor 초기화 종료
   		 
   		 // 2. 녹화 시작 버튼이 눌렸을 때
		document.getElementById('btn-record-webm').onclick = function() {
			$("#btn-record-webm-stop").attr("disabled", false);
			
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
			var elementToShare = document.getElementById('part-of-screen-to-be-shared');
			var canvas2d = document.createElement('canvas');
			var context = canvas2d.getContext('2d');
			canvas2d.width = elementToShare.clientWidth;
			canvas2d.height = elementToShare.clientHeight;
			canvas2d.id = 'canvas';
			canvas2d.style.top = 0;
			canvas2d.style.left = 0;
			canvas2d.style.zIndex = -1;
			
			// 여기에 appendChild(canvas2d)가 녹화되는 화면(프리뷰)가 보이게 할 곳이다.
			$('#OpponentScreen').append(canvas2d); // 이게 내가 녹화중인 화면
			
			// DIV를 canvas2d로 보내고, canvas2d를 녹화(+음성)하는 코드	
			var looper = function looper() {
				html2canvas(elementToShare, {
					grabMouse : false,
					onrendered : function(canvas) {
						context.clearRect(0, 0, canvas2d.width, canvas2d.height);
						context.drawImage(canvas, 0, 0, canvas2d.width, canvas2d.height);
					}
				});
				
			};

			canvasSetTime = setInterval(looper, 300); //이게 화면 프레임수
		
		};
	
		
		// 녹화 정지 버튼
		document.getElementById('btn-record-webm-stop').onclick = function() {
			stop = true;
			this.disabled = true
			//$("#btn-record-webm").attr("disabled", false);
			if (stop) { // 녹화 중지 버튼이 눌리면 stop = true가 된다.
				recorder.stopRecording(function() {
					var blob = recorder.getBlob(); //<이게 동영상 데이터
					var URL_BLOB = String(window.webkitURL.createObjectURL(blob));
					var fileName = URL_BLOB.substring(URL_BLOB.lastIndexOf("/")+1 , URL_BLOB.length);
					var fileExt = blob.type.substring(blob.type.lastIndexOf("/")+1, blob.type.length);
							
					//ajax로 서버에 녹화된 영상 파일 전송
					var filename = String(window.webkitURL.createObjectURL(blob));
					var formElement = document.querySelector("form");
					var formData = new FormData(formElement);
							
					formData.append("blob", blob, fileName+ "." +fileExt);
					formData.append("questionNum", '${question.questionNum}');
							
					$.ajax({
						url: 'blob_upload',
			            processData: false,
			            contentType: false,
			            data: formData, 
			            type: 'POST',
			            success: function(result){
			            		$('#videos-container').html('<video controls src="'
			 				+ window.webkitURL.createObjectURL(blob)
			 				+ '" autoplay loop controls="controls" preload="auto"></video>');
			                $('#videoSrc').val(result);
			                }
			            });		
							
					$("#canvas").remove(); // 자신의 녹화중인 화면(프리뷰)를 삭제한다.
					$("#shared-part-of-screen-preview").remove(); // 상대방의 화면을 삭제한다.
					$("#part-of-screen-to-be-shared").remove(); // 자신이 공유중인 화면을 삭제한다
					
					audioStream.stop();
					canvasStream.stop();
					clearTimeout(canvasSetTime);
				});
			}
			return false;
		}
		
		window.enableAdapter = true; // enable adapter.js

		// ......................................................
		// .......................UI Code........................
		// ......................................................
		document.getElementById('open-room').onclick = function() {
			disableInputButtons();
			connection.open(document.getElementById('room-id').value,
					function() {
						showRoomURL(connection.sessionid);
					});
		};

		document.getElementById('join-room').onclick = function() {
			disableInputButtons();
			connection.join(document.getElementById('room-id').value);
		};

		document.getElementById('open-or-join-room').onclick = function() {
			disableInputButtons();
			connection.openOrJoin(document.getElementById('room-id').value,
					function(isRoomExists, roomid) {
						if (!isRoomExists) {
							showRoomURL(roomid);
						}
					});
		};

		document.getElementById('btn-leave-room').onclick = function() {
			this.disabled = true;
			if (connection.isInitiator) {
				// use this method if you did NOT set "autoCloseEntireSession===true"
				// for more info: https://github.com/muaz-khan/RTCMultiConnection#closeentiresession
				connection
						.closeEntireSession(function() {
						 	console.log("Entire session has been closed.");
						});
			} else {
				connection.leave();
			}
			
			$("#btn-record-webm-stop").click();

		};

		// ......................................................
		// ................FileSharing/TextChat Code.............
		// ......................................................

		document.getElementById('share-file').onclick = function() {
			var fileSelector = new FileSelector();
			fileSelector.selectSingleFile(function(file) {
				connection.send(file);
			});
		};

		document.getElementById('input-text-chat').onkeyup = function(e) {
			if (e.keyCode != 13)
				return;

			// removing trailing/leading whitespace
			this.value = this.value.replace(/^\s+|\s+$/g, '');
			if (!this.value.length)
				return;

			connection.send(this.value);
			
			// 자신의 채팅창에 보이게 하기
			
			appendDIV(this.value);
			this.value = '';
		};

		var chatContainer = document.querySelector('.chat-output');

		function appendDIV(event) {
			var div = document.createElement('div');
			if(typeof event == 'string') {
				div.innerHTML = event.data || event;
				chatContainer.insertBefore(div, chatContainer.firstChild);
				div.tabIndex = 0;
				div.focus();
				document.getElementById('input-text-chat').focus();
			} else if (event.data.substring(0, 21) == 'data:image/png;base64') {
				sharedPartOfScreenPreview.src = event.data; //이게 전송되는 화면 값..
			} else {
				if(event.data.substring(0,6) == 'data:,') {
					return;
				}
				div.innerHTML = event.data || event;
				chatContainer.insertBefore(div, chatContainer.firstChild);
				div.tabIndex = 0;
				div.focus();
				document.getElementById('input-text-chat').focus();
			}
		}

		// ......................................................
		// ..................RTCMultiConnection Code.............
		// ......................................................

		var connection = new RTCMultiConnection();

		// by default, socket.io server is assumed to be deployed on your own URL
		// comment-out below line if you do not have your own socket.io server
		connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

		connection.socketMessageEvent = 'audio-video-file-chat-demo';

		connection.enableFileSharing = true; // by default, it is "false".

		connection.session = {
			audio : true,
			video : true,
			data : true
		};

		connection.sdpConstraints.mandatory = {
			OfferToReceiveAudio : true,
			OfferToReceiveVideo : true
		};

		connection.videosContainer = document.getElementById('videos-container');
		connection.onstream = function(event) {
			event.mediaElement.removeAttribute('src');
			event.mediaElement.removeAttribute('srcObject');

			var video = document.createElement('video');
			video.controls = true;
			if (event.type === 'local') {
				video.muted = true;
			}
			video.srcObject = event.stream;

			var width = parseInt(connection.videosContainer.clientWidth / 2) - 20;
			var mediaElement = getHTMLMediaElement(video, {
				title : event.userid,
				buttons : [ 'full-screen' ],
				width : width,
				display : hidden,
				showOnMouseEnter : false
			});

			connection.videosContainer.appendChild(mediaElement);

			setTimeout(function() {
				mediaElement.media.play();
			}, 5000);

			mediaElement.id = event.streamid;
		};

		connection.onstreamended = function(event) {
			var mediaElement = document.getElementById(event.streamid);
			if (mediaElement) {
				mediaElement.parentNode.removeChild(mediaElement);
			}
		};

		connection.onmessage = appendDIV;
		connection.filesContainer = document.getElementById('file-container');

		var sharedPartOfScreenPreview = document.getElementById('shared-part-of-screen-preview');

		
		var lastSharedScreenShot = '';
		connection.sharePartOfScreen = function(element) {
			html2canvas(element, {
				onrendered : function(canvas) {
					var screenshot = canvas.toDataURL('image/png', 1);
					if (screenshot === lastSharedScreenShot) {
						connection.sharePartOfScreen(element);
						return;
					}
					connection.send(screenshot);
					connection.sharePartOfScreen(element);
				},
				grabMouse : true
			});
		};

		connection.onopen = function() {
			document.getElementById('share-file').disabled = false;
			document.getElementById('input-text-chat').disabled = false;
			document.getElementById('btn-leave-room').disabled = false;
			console.log('You are connected with: ' + connection.getAllParticipants().join(', '));
			
			if (!lastSharedScreenShot.length) {
				document.getElementById('btn-share-part-of-sreen').disabled = false;
			}
		};

		document.getElementById('btn-share-part-of-sreen').onclick = function() {
			this.disabled = true;
			connection.sharePartOfScreen(document.getElementById('part-of-screen-to-be-shared'));
		};

		connection.onclose = function() {
			if (connection.getAllParticipants().length) {
				//alert("상대방과 연결되었습니다.");
				console.log('You are still connected with: '+ connection.getAllParticipants().join(', '));
			} else {  // 상대방이 연결을 끊었을 때
				alert("상대방이 연결을 끊었습니다.");
				console.log("Seems session has been closed or all participants left.");
			}
		};

		connection.onEntireSessionClosed = function(event) {
			document.getElementById('share-file').disabled = true;
			document.getElementById('input-text-chat').disabled = true;
			document.getElementById('btn-leave-room').disabled = true;

			document.getElementById('open-or-join-room').disabled = false;
			document.getElementById('open-room').disabled = false;
			document.getElementById('join-room').disabled = false;
			document.getElementById('room-id').disabled = false;

			connection.attachStreams.forEach(function(stream) {
				stream.stop();
			});

			// don't display alert for moderator
			if (connection.userid === event.userid)
				return;
			// 내가 연결을 끊었을 때
			console.log('내가 연결을 끊었다. ' + event.userid)
		};

		connection.onUserIdAlreadyTaken = function(useridAlreadyTaken,
				yourNewUserId) {
			// seems room is already opened+
			connection.join(useridAlreadyTaken);
		};

		function disableInputButtons() {
			document.getElementById('open-or-join-room').disabled = true;
			document.getElementById('open-room').disabled = true;
			document.getElementById('join-room').disabled = true;
			document.getElementById('room-id').disabled = true;
		}

		// ......................................................
		// ......................Handling Room-ID................
		// ......................................................

		function showRoomURL(roomid) {
			var roomHashURL = '#' + roomid;
			var roomQueryStringURL = '?roomid=' + roomid;

			console.log("roomHashURL: " + document.location.href + roomHashURL);
			console.log("roomQueryStringURL: " + document.location.href + roomQueryStringURL);
		}

		(function() {
			var params = {}, r = /([^&=]+)=?([^&]*)/g;

			function d(s) {
				return decodeURIComponent(s.replace(/\+/g, ' '));
			}
			var match, search = window.location.search;
			while (match = r.exec(search.substring(1)))
				params[d(match[1])] = d(match[2]);
			window.params = params;
		})();

		var roomid = '${question.questionNum}';
		//if (localStorage.getItem(connection.socketMessageEvent)) {
		//	roomid = localStorage.getItem(connection.socketMessageEvent);
		//} else {
		//	roomid = connection.token(); // 페이지 처음방문했을 때, 랜덤으로 토큰을 생성한다.
		//}
		document.getElementById('room-id').value = roomid;
		document.getElementById('room-id').onkeyup = function() {
			localStorage.setItem(connection.socketMessageEvent, this.value);
		};

		var hashString = location.hash.replace('#', '');
		if (hashString.length && hashString.indexOf('comment-') == 0) {
			hashString = '';
		}

		var roomid = params.roomid;
		if (!roomid && hashString.length) {
			roomid = hashString;
		}

		if (roomid && roomid.length) {
			document.getElementById('room-id').value = roomid;
			//localStorage.setItem(connection.socketMessageEvent, roomid);

			// auto-join-room
			(function reCheckRoomPresence() {
				connection.checkPresence(roomid, function(isRoomExists) {
					if (isRoomExists) {
						connection.join(roomid);
						return;
					}

					setTimeout(reCheckRoomPresence, 5000);
				});
			})();

			disableInputButtons();
		}
		
		// question.userNum
		// user.userNum
		// question.questionContent
		var questionuserNum = '${question.userNum}';
		var userNum = '${userNum}';  // 세션에서 userNum을 가져온다.
		
		// question.userNum  == user.userNum 질문자
		// question.userNum  != user.userNum 답변자
		// 예외: 로그인을 하지 않았으면, user.userNum가 공백이므로 부정접근이다.
		
		if(!isEmpty(questionuserNum) && !isEmpty(userNum) ) {
			if(questionuserNum == userNum)	{ // 질문자이다.
// 				$("#open-room").click();
// 				$("#btn-share-part-of-sreen").click();
// 				$("#btn-record-webm").click();
			} else { // 답변자이다.
// 				$("#join-room").click();
// 				$("#btn-share-part-of-sreen").click();
// 				$("#btn-record-webm").click();
			}
			
		} else {
			console.log("부정 접근이므로 리다이렉트 시킨다.")
			// 부정 접근이므로 로그인 페이지 리다이렉트
		}

		
} //onload End
	
// 데이터가 널 또는 공백인지 확인하는 함수
var isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true
	}else{
		return false
	}
};


// 상대에게 받은 파일 중 오래된 것을 삭제한다.
function lastFileDelete() {
	$("#file-container").children().last().remove();
}

// 상대에게 받은 채팅 중 오래된 것을 삭제한다.
function lastFileChat() {
	$(".chat-output").children().last().remove();
}

// 유효성 검사
function formCheck() {
var questionNum = '${question.questionNum}';
var userNum = '${userNum}';
var ReplyContent = CKEDITOR.instances.ReplyContent.getData(); //TODO
var videoSrc = $('#videoSrc').val();

alert(videoSrc);
if(isEmpty(videoSrc)) {
	return false;
}

$.ajax({
	url: "registReply",
	type: "post",
	data: { questionNum: ${ question.questionNum },
			id: "${ userId }",
			videoSrc: videoSrc,
			userNum: ${userNum},
			replyContent: ReplyContent
	},
	success: function (success) {
		alert("댓글 등록 완료")
	}
})
	
}

</script>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />
<div class="breadcrumbs">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Real-time answers</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<a href="#">Pages</a>
						<span class="crumbs-span">/</span>
						<span class="current">Real-time answers</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div>
<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				
				<div class="page-content ask-question">
					<div class="boxedtitle page-title"><h2>Real-time answers</h2></div>
					
					<!-- here -->
					<fieldset>
<legend>개발용 버튼(삭제하지 말것)</legend>
<h5>JQuery로 버튼을 자동 click하는 방식으로 실시간 연결 진행. 실제 서비스에서는 이 필드셋을 hidden으로 해둔다.</h5>
<label>방 번호</label>
<input type="text" id="room-id" value="${question.questionNum}" size=20> <br>
<button id="open-room">1-1. 방 Open</button>
<button id="join-room">1-2. 방 Join</button>
<button id="btn-share-part-of-sreen" disabled>2. 공유화면 + 음성 전송</button>
<button id="btn-record-webm">3. 자신의 공유화면 녹화</button>
<button id="btn-leave-room" disabled>4. 접속 종료</button>
<button id="btn-record-webm-stop" disabled="disabled">5. 자신의 공유화면 녹화 중지 + 서버로 녹화된 영상 전송</button> <br>
<button id="open-or-join-room">(기능 테스트 중)Auto Open Or Join Room</button> <br>
<button onclick="formCheck()">댓글 등록 </button>
<input type="text" id="videoSrc" name="videoSrc" placeholder="업로드된 동영상의 주소">
</fieldset>
<table>
	<tr>
		<td>
		<div id="tabs" >
  <ul>
    <li><a href="#tabs-1">나의 공유화면</a></li>
    <li><a href="#tabs-2">질문자가 업로드한 동영상 / 내가 녹화한 영상 보기</a></li>
    <li><a href="#tabs-3">상대방의 화면</a></li>
  </ul>
  <div id="tabs-1">
		<!-- 이게 공유된다. DIV안에 있는게 이미지로 바뀌어서 전송된다. -->
	<div id="part-of-screen-to-be-shared" contenteditable="true" style="text-align: center; border: 5px solid gray; background: white;">
		<c:if test="${question.questionContent != null? true:false }">
			${question.questionContent}
		</c:if>
		<c:if test="${question.questionContent == null? true:false }">
			<h1>여기에는 질문글의 questionContent 가 불러와진다. (이 DIV는 가로 세로가 크기가 같다.)</h1>
		</c:if>
	</div>
  </div>

  <div id="tabs-2">
		<!-- 실시간 답변이 완료된 후, 녹화된 동영상이 여기에 보여진다. -->
	<div id="videos-container">
		<h6>실시간 답변이 완료된 후, 녹화된 동영상이 여기에 보여진다.</h6>
		<!-- ㄹㄹ -->
		<c:if test="${question.videoSrc != null? true:false }">
			<video src="${question.videoSrc}" controls="controls" preload="auto" width="100%"></video>
		</c:if>
		<c:if test="${question.videoSrc == null? true:false }">
			<h6>質問者がアップロードした動画がないです。</h6>
		</c:if>
	</div> 
   </div>
   <div id="tabs-3">
		<!-- 상대방의 화면이 여기에 보임 -->
		<img id="shared-part-of-screen-preview" alt="상대방의 화면이 여기에">
	</div>
</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<div id="tabs2">
  <ul>
    <li><a href="#tabs-4">질문 내용</a></li>
  	<li><a href="#tabs-5">내 에디터</a></li>
    <li><a href="#tabs-6">내 공유화면 프리뷰 </a></li>
  </ul>
    <div id="tabs-4">
 	<!-- 상대방의 질문 내용이 여기에 보인다. -->
 	${question.questionContent}
  </div>
    <div id="tabs-5">
		 <!-- 내가 답변할 에디터가 여기에 보인다. -->
		<textarea id="ReplyContent" name="ReplyContent" style="width: 1000px;"></textarea>
  </div>
    <div id="tabs-6">
	<!-- 내가 녹화중인 화면이 여기에 보임 -->
	<div id="OpponentScreen"></div>
  </div>
</div>
		</td>
	</tr>
</table>
				</div><!-- End page-content -->
			</div><!-- End main -->
			<!-- aside -->
	<aside class="col-md-3 sidebar">
	<div class="widget">
		<h3 class="widget_title">チャット及びファイル送り</h3>
		<input type="text" id="input-text-chat" placeholder="チャット入力" disabled style="display: inline-block;">
		<button id="share-file" disabled class="button color small submit">ファイルを送る</button> 

		<!-- 채팅 및 파일이 전송된 것이 여기에 나타난다. -->
		<div id="chat-container" style="border:3px solid gray;">
		<button onclick="lastFileDelete()" class="button color small submit" >最後のファイルを削除</button>	
		<button onclick="lastFileChat()" class="button color small submit">最後のチャットを削除</button>
		<h6>채팅 내용 + 송수신된 파일 DIV</h6>
			<div id="file-container"></div>
			<div class="chat-output"></div>
		</div>		
	</div>
	</aside>
		
		</div><!-- End row -->
	</section><!-- End container -->

<jsp:include page="footer.jsp" flush="false" />
</body>
</html>
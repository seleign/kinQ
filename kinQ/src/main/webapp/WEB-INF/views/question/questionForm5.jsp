<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>실시간 공유 페이지</title>

<!-- CKeditor -->
<script src="/resources/ckeditor/ckeditor.js"></script> 

<!-- JQuery -->
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
<script src="/resources/ckeditor/adapters/jquery.js"></script>


<script src="/resources/js/RecordRTC.js"></script>
<script src="/resources/js/adapter-latest.js"></script>
<script src="/resources/js/screenshot.js"></script>
<script src="/resources/js/gumadapter.js"></script>
<script src="/resources/js/RTCMultiConnection.min.js"></script>
<script src="/resources/js/adapter.js"></script>
<script src="/resources/js/socket.io.js"></script>
<script src="/resources/js/getHTMLMediaElement.js"></script>
<script src="/resources/js/FileBufferReader.js"></script>

	
<script>
window.onload = function() {

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
				setTimeout(looper, 10); //이게 화면 프레임수
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
}; //onload 종료
</script>
</head>
<body>
	<h1>
		Audio+Video+TextChat+FileSharing using RTCMultiConnection
		<p class="no-mobile"> Multi-user (many-to-many) video streaming + text chat + file sharing using mesh networking model.</p>
	</h1>

	<section class="make-center">
		<input type="text" id="room-id" value="abcdef" autocorrect=off autocapitalize=off size=20>
		<button id="open-room">Open Room</button>
		<button id="join-room">Join Room</button>
		<button id="open-or-join-room">Auto Open Or Join Room</button>

		<br>
		<br> <input type="text" id="input-text-chat"
			placeholder="Enter Text Chat" disabled>
		<button id="share-file" disabled>Share File</button>
		<br>
		<button id="btn-leave-room" disabled>Leave /or close the room</button>
		<button id="btn-share-part-of-sreen" disabled>Share below entire DIV</button>
		<div id="room-urls" style="text-align: center; display: none; background: #F1EDED; margin: 15px -10px; border: 1px solid rgb(189, 189, 189); border-left: 0; border-right: 0;"></div>

		<div id="chat-container">
			<div id="file-container"></div>
			<div class="chat-output"></div>
		</div>
		
		<button id="btn-record-webm" style="font-size: inherit;">화면 녹화</button>
		<button id="btn-record-webm-stop" style="font-size: inherit;" disabled="disabled">화면 중지</button>
		
		<div id="videos-container"></div>
		
		<div id="video_and_cavas_container" >
	<div id="canvas_container" style="float: left;">
		<div id="HtmlTagFromTheCKEDITOR" contenteditable="true"
			style="text-align: center; border-top: 5px solid gray; width: 500px; background-color: #FBFBEE; height: 500px">
			<!-- 이 안에 있는 요소만 녹화가 되기 때문에, 드래그앤 드랍으로 여기로 div를 옴겨와야 한다. -->
			<h1>여기에 에디터에 쓴 내용이 여기로 옴겨진다. </h1>
		</div>
	</div>
	<div id="video_container" style="float: left; text-align: center; width: 500px; background-color: #FBFBEE; height: 500px">
		<!-- 수정하기 일 땐 기존에 녹화된 파일이 여기에 보인다. -->
		<c:if test="${video_src == null}">
			<h1>처음 글을 쓰거나, 수정모드일 때는 녹화한 동영상이 없다.</h1>
		</c:if>
		<c:if test="${video_src != null}">
			<video src="${video_src}"></video>
		</c:if>
	</div>
</div>

	</section>


	<script>
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
				connection.closeEntireSession(function() {
							alert("접속 종료");
						});
			} else {
				connection.leave();
			}
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
			appendDIV(this.value);
			this.value = '';
		};

		var chatContainer = document.querySelector('.chat-output');

		function appendDIV(event) {
			var div = document.createElement('div');
			//data:image/png;base64,
			//alert(event.data.substring(0, 21));
			if (event.data.substring(0, 21) == 'data:image/png;base64') {
				sharedPartOfScreenPreview.src = event.data; //이게 전송되는 화면 값..
			} else {
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
		connection.socketURL = '/';

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

		connection.videosContainer = document
				.getElementById('videos-container');
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

		var sharedPartOfScreenPreview = document
				.getElementById('shared-part-of-screen-preview');

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
			document.querySelector('h1').innerHTML = 'You are connected with: '
					+ connection.getAllParticipants().join(', ');

			if (!lastSharedScreenShot.length) {
				document.getElementById('btn-share-part-of-sreen').disabled = false;
			}
		};

		document.getElementById('btn-share-part-of-sreen').onclick = function() {
			this.disabled = true;
			connection.sharePartOfScreen(document
					.getElementById('part-of-screen-to-be-shared'));
		};

		connection.onclose = function() {
			if (connection.getAllParticipants().length) {
				document.querySelector('h1').innerHTML = 'You are still connected with: '
						+ connection.getAllParticipants().join(', ');
			} else {
				document.querySelector('h1').innerHTML = 'Seems session has been closed or all participants left.';
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
			document.querySelector('h1').innerHTML = 'Entire session has been closed by the moderator: '
					+ event.userid;
		};

		connection.onUserIdAlreadyTaken = function(useridAlreadyTaken,
				yourNewUserId) {
			// seems room is already opened
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

			var html = '<h2>Unique URL for your room:</h2><br>';

			html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">'
					+ roomHashURL + '</a>';
			html += '<br>';
			html += 'QueryString URL: <a id="test" href="' + roomQueryStringURL + '" target="_blank">'
					+ roomQueryStringURL + '</a>';

			var roomURLsDiv = document.getElementById('room-urls');
			roomURLsDiv.innerHTML = html;
			
			console.log(document.location.href + roomHashURL);
			console.log(document.location.href + roomQueryStringURL);

			roomURLsDiv.style.display = 'block';
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

		var roomid = '';
		if (localStorage.getItem(connection.socketMessageEvent)) {
			roomid = localStorage.getItem(connection.socketMessageEvent);
		} else {
			roomid = connection.token();
		}
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
			localStorage.setItem(connection.socketMessageEvent, roomid);

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
	</script>
</body>
</html>
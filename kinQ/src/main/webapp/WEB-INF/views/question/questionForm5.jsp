<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>실시간 공유 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="https://rtcmulticonnection.herokuapp.com/demos/logo.png">
<link rel="stylesheet" href="https://rtcmulticonnection.herokuapp.com/demos/stylesheet.css">
<link rel="stylesheet" href="https://rtcmulticonnection.herokuapp.com/dev/getHTMLMediaElement.css">

<script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="https://cdn.webrtc-experiment.com/screenshot.js"></script>
<script src="https://cdn.WebRTC-Experiment.com/gumadapter.js"></script>
<!-- <script src="https://cdn.webrtc-experiment.com/RTCMultiConnection.js"></script> 
<script src="https://cdn.webrtc-experiment.com/socket.io.js"></script> -->
<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/dev/adapter.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/dev/getHTMLMediaElement.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/dev/FileBufferReader.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/themes/cupertino/jquery-ui.css" />
	
<script>
	var recorder;
	var audioStream;
	var canvasStream;
	window.onload = function() { //onload start

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
			var stop = false;
			var elementToShare = document
					.getElementById('part-of-screen-to-be-shared');
			var canvas2d = document.createElement('canvas');
			var context = canvas2d.getContext('2d');
			canvas2d.width = elementToShare.clientWidth;
			canvas2d.height = elementToShare.clientHeight;

			canvas2d.style.top = 0;
			canvas2d.style.left = 0;
			canvas2d.style.zIndex = -1;
			(document.body || document.documentElement).appendChild(canvas2d);
			(function looper() {
				if (stop) {
					recorder.stopRecording(function() {
						var blob = recorder.getBlob(); //<이게 동영상 데이터
						var HTMLTAG = document.body.innerHTML;
						document.body.innerHTML = HTMLTAG
								+ '<video controls src="'
								+ URL.createObjectURL(blob)
								+ '" autoplay loop></video>';
						$("#canvas").remove();

						audioStream.stop();
						canvasStream.stop();
					});
					return;
				}

				(function looper() {
					html2canvas(elementToShare, {
						grabMouse : true,
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

			var seconds = 10;
			var interval = setInterval(function() {
				seconds--;
				if (document.querySelector('h1')) {
					document.querySelector('h1').innerHTML = seconds
							+ ' seconds remaining.';
				}
			}, 1000);

			setTimeout(function() {
				clearTimeout(interval);
				stop = true;
			}, seconds * 1000);
		};

	} //onload End
</script>
</head>
<body>
	<h1>
		Audio+Video+TextChat+FileSharing using RTCMultiConnection
		<p class="no-mobile">Multi-user (many-to-many) video streaming +
			text chat + file sharing using mesh networking model.</p>
	</h1>

	<section class="make-center">
		<input type="text" id="room-id" value="abcdef" autocorrect=off
			autocapitalize=off size=20>
		<button id="open-room">Open Room</button>
		<button id="join-room">Join Room</button>
		<button id="open-or-join-room">Auto Open Or Join Room</button>

		<br>
		<br> <input type="text" id="input-text-chat"
			placeholder="Enter Text Chat" disabled>
		<button id="share-file" disabled>Share File</button>
		<br>
		<br>
		<button id="btn-leave-room" disabled>Leave /or close the room</button>
		<button id="btn-share-part-of-sreen" disabled>Share below
			entire DIV</button>
		<div id="room-urls"
			style="text-align: center; display: none; background: #F1EDED; margin: 15px -10px; border: 1px solid rgb(189, 189, 189); border-left: 0; border-right: 0;"></div>

		<div id="chat-container">
			<div id="file-container"></div>
			<div class="chat-output"></div>
		</div>
		<button id="btn-record-webm" style="font-size: inherit;">Record
			as WebM</button>
		<div id="videos-container"></div>
		<!-- 이게 공유된다. -->
		<!-- DIV안에 있는게 이미지로 바뀌어서 전송된다. -->
		<div id="part-of-screen-to-be-shared" contenteditable="true"
			style="text-align: center; border-top: 5px solid gray; background-color: #FBFBEE;">
			<h2 style="color: red;">Content of this DIV is editable and
				resize-able!</h2>
			<p>
				Open a room and click "<strong>Shre below entire DIV</strong>" blue
				button. Now your div changes will be auto shared with any user who
				joined your room.
			</p>
			
			<!-- <canvas id="circlecanvas"></canvas> -->
			<textarea
				style="width: 30%; resize: both; height: 150px; margin-top: 10px; font-size: 20px; border: 1px solid blue;">Simple Text area</textarea>

		</div>
		<img id="shared-part-of-screen-preview" style="max-width: 100%;">
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
				// use this method if you did NOT set "autoCloseEntireSession===true"
				// for more info: https://github.com/muaz-khan/RTCMultiConnection#closeentiresession
				connection
						.closeEntireSession(function() {
							document.querySelector('h1').innerHTML = 'Entire session has been closed.';
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
			html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">'
					+ roomQueryStringURL + '</a>';

			var roomURLsDiv = document.getElementById('room-urls');
			roomURLsDiv.innerHTML = html;

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
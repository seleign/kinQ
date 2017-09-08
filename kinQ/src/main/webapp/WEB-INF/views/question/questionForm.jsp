<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>質問する</title>
<script src="/resources/ckeditor/ckeditor.js"></script> <!-- 에디터용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link type="text/css" href="./resources/css/chosen.min.css" rel="stylesheet">
<script src="./resources/js/chosen.proto.min.js"></script>
<!-- 수정된 플러그인입니다. 교체 불가. -->
<script src="./resources/js/chosen.jquery.js"></script>


<!-- Bootstrap styles -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="./resources/blueImp_jQuery_file_upload/css/jquery.fileupload.css">
<link rel="stylesheet" href="./resources/blueImp_jQuery_file_upload/css/jquery.fileupload-ui.css">

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>


<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="./resources/blueImp_jQuery_file_upload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="https://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="https://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="https://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- blueimp Gallery script -->
<script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="./resources/blueImp_jQuery_file_upload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="./resources/blueImp_jQuery_file_upload/js/main.js"></script>

<script type="text/javascript">
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
		
		if (!$('.answerType').is(":checked"))
		{
			alert( '望む答え方を選んでください。');
			return false;
		}
		return true;
	}

	function loadMinorList(major){
		$.ajax({
			url: 'minorList',
			method: 'get',
			data: {major : major},
			success: function(minorList){
				var html = '';
				$.each(minorList, function(index, element){
					if(element.majorNum == major){
						html +=	'<option value="' +element.minorNum +'">' +element.minorName +'</option>';
					}
				});
				$('#minor').html(html);	
			}
		});
	}
	
	$(function(){
		$('#tags').chosen();
	});
	
	$(".chosen-select").chosen({
		max_select_options: 5,
		no_result_text: "No result found. Press enter to add"
	});
	/* 
	$(function() {"C:/Users/seleign/Downloads/test.js"
        $("#attach").on('change', function(){
            readURL(this);
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
        		console.log(e);
//        		var html = $('#attached').html();
//        		html += '<img id="attached' +e.size +'">'
				$('#attached').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
    } */
    $(function () {
		// Change this to the location of your server-side upload handler:
		var url = '/fileupload';  // 사용
		$('#fileupload').fileupload({
			url: url,
			dataType: 'json',
			done: function (e, data) {
				$.each(data.result.files, function (index, file) {
					$('<p/>').text(file.name).appendTo('#files');
				});
			},
			progressall: function (e, data) {
				var progress = parseInt(data.loaded / data.total * 100, 10);
				$('#progress .progress-bar').css(
					'width',
					progress + '%'
				);
			}
		}).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
	});
</script>
</head>
<body>

<h1>質問する</h1>
	<div>
		<form action="addQuestion" id="fileupload" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
			<label for="title">タイトル</label><input type="text" id="title" name="title"><br>
			<!-- 질문글 내용 시작. 수정 필요. -->
			<label for="questionContent">内容</label><input type="text" id="questionContent" name="questionContent"><br>
			
			<textarea name="editor"></textarea>
			<script src="/resources/ckeditor/adapters/jquery.js"></script>
			<script type="text/javascript">
				window.onload = function() {
					CKEDITOR.replace('editor',{
      				 filebrowserUploadUrl: 'cKEditorFileUpload'
    					});
				}
			</script>

			<!-- 질문글 내용 끝. 수정 필요. -->
			<!-- 파일 첨부 -->
			<label for="fileupload">添付</label><br>
			<!-- The file input field used as target for the file upload widget -->
<!-- 		<input id="fileupload" type="file" name="files[]" multiple>
			The global progress bar
			<div id="progress" class="progress">
   			<div class="progress-bar progress-bar-success"></div>
			</div>
			The container for the uploaded files
			<div id="files" class="files"></div>
 -->
 			<!-- Redirect browsers with JavaScript disabled to the origin page -->
	        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
	        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
	        <div class="row fileupload-buttonbar">
	            <div class="col-lg-7">
	                <!-- The fileinput-button span is used to style the file input field as button -->
	                <span class="btn btn-success fileinput-button">
	                    <i class="glyphicon glyphicon-plus"></i>
	                    <span>Add files...</span>
	                    <input type="file" name="files[]" multiple>
	                </span>
	                <button type="submit" class="btn btn-primary start">
	                    <i class="glyphicon glyphicon-upload"></i>
	                    <span>Start upload</span>
	                </button>
	                <button type="reset" class="btn btn-warning cancel">
	                    <i class="glyphicon glyphicon-ban-circle"></i>
	                    <span>Cancel upload</span>
	                </button>
	                <button type="button" class="btn btn-danger delete">
	                    <i class="glyphicon glyphicon-trash"></i>
	                    <span>Delete</span>
	                </button>
	                <input type="checkbox" class="toggle">
	                <!-- The global file processing state -->
	                <span class="fileupload-process"></span>
	            </div>
	            <!-- The global progress state -->
	            <div class="col-lg-5 fileupload-progress fade">
	                <!-- The global progress bar -->
	                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
	                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
	                </div>
	                <!-- The extended global progress state -->
	                <div class="progress-extended">&nbsp;</div>
	            </div>
	        </div>
	        <!-- The table listing the files available for upload/download -->
	        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
 			
 			
			<!-- 분류 선택 -->
			<label for="field">分類</label>
			<select id="major" name="major"  onchange="javascript:loadMinorList(this.options[this.selectedIndex].value)">
				<option value="0" selected="selected">選択</option>
<c:forEach var="major" items="${majorList}">
				<option value="${major.majorNum}">${major.majorName}</option>
</c:forEach>
			</select>
			<select id="minor" name="minor"></select><br>
			<!-- 태그 입력 및 삭제-->
			<label for="tags">タッグ</label>
			<select id="tags" multiple class="chosen-select" style="width:300px;"></select><br>
			<!-- 답변방식 선택(체크박스) -->
			<label for="answerType">答え方</label><br>
			<input type="checkbox" id="textAnswer" name="answerType" class="answerType" value="text">テキスト<br>
			<input type="checkbox" id="voiceAnswer" name="answerType" class="answerType" value="voice">音声<br>
			<input type="checkbox" id="drawingAnswer" name="answerType" class="answerType" value="drawing">ドローイング<br>
			<input type="checkbox" id="videoAnswer" name="answerType" class="answerType" value="video">動画<br>
			<input type="checkbox" id="textAnswerRealTime" name="answerType" class="answerType" value="text-realtime">テキスト（リアルタイム）<br>
			<input type="checkbox" id="voiceAnswerRealTime" name="answerType" class="answerType" value="voice-realtime">音声（リアルタイム）<br>
			<input type="checkbox" id="drawingAnswerRealTime" name="answerType" class="answerType" value="drawing-realtime">ドローイング（リアルタイム）<br>
			<input type="checkbox" id="videoAnswerRealTime" name="answerType" class="answerType" value="video-realtime">動画（リアルタイム）<br>
			<!-- 실시간 답변 선택(체크박스) -->
			<hr>
			<label for="urgent">緊急質問</label><br>
			<input type="checkbox" id="urgent" name="urgent" value="urgent">大至急です。<br>
			
			<button onclick="javascript:history.go(-1);">戻る</button>
			<input type="submit" value="質問登録">
		</form>
	</div>
</body>
</html>
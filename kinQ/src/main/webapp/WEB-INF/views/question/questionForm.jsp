<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>join</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link type="text/css" href="./resources/css/chosen.min.css" rel="stylesheet">
<script src="./resources/js/chosen.proto.min.js"></script>
<!-- 수정된 플러그인입니다. 교체 불가. -->
<script src="./resources/js/chosen.jquery.js"></script>
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
	
</script>
</head>
<body>

<h1>質問する</h1>
	<div>
		<form action="addQuestion" id="qForm" method="post" onsubmit="return formCheck();">
			<label for="qtitle">タイトル</label><input type="text" id="title" name="title"><br>
			<!-- 질문글 내용 시작. 수정 필요. -->
			<label for="qcontent">内容</label><input type="text" id="questionContent" name="questionContent"><br>
			<!-- 질문글 내용 끝. 수정 필요. -->
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
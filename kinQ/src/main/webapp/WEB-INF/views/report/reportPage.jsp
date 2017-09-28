<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>緊Q</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[value=報告]").on("click", submission);
	});
	function submission(){
		
		var reportTitle = $('#reportTitle').val();
		
		if(reportTitle==''){
			alert('タイトルを’入力してください。');
			return false;
		}
		$('#reportForm').submit();
	}
	
</script>
</head>
<body>

<h3>違反報告</h3>

<!-- <form action="report" id="reportForm" method="POST"> -->
<form action="reportQnA" method="POST"  id="reportForm">
	<label for="reportTitle">タイトル：　</label><input type="text" name="reportTitle" id="reportTitle"><br>
 	<label for="reporterNum">書き手：　</label>${sessionScope.userId}<input type="hidden" value="${sessionScope.userNum}" name="reporterNum" id="reporterNum">
 	<hr>
	<lable for="reportedQNum">申告対象：　</lable>${reportedQNum }<input type="hidden" value="${reportedQNum }" name="reportedQNum">
	<hr>
	<label for="reportReason">申告事由</label><br>
		<input type="radio" name="reportReason" value="不適切な広告" checked="checked">不適切な広告<br>
		<input type="radio" name="reportReason" value="青少年に不適切な掲示物">青少年に不適切な掲示物<br>
		<input type="radio" name="reportReason" value="無意味な掲示物">無意味な掲示物<br>
		<input type="radio" name="reportReason" value="その他">その他<br>
	<hr>
	<input type="button" value="報告" >
	<input type="button" value="キャンセル" onclick="history.go(-1)">
</form>
</body>
</html>
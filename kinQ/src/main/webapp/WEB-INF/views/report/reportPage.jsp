<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report</title>
</head>
<body>

<h3>違反報告</h3>

<form action="report" id="reportForm">
<label for="title">タイトル</label>
<label for="writer">書き手</label>
<hr>
<label for="reason">申告事由</label><br>
<input type="radio" name="radioBtn" id="radioBtn" value="不適切な広告"><br>
<input type="radio" name="radioBtn" id="radioBtn" value="青少年に不適切な掲示物"><br>
<input type="radio" name="radioBtn" id="radioBtn" value="無意味な掲示物"><br>
<input type="radio" name="radioBtn" id="radioBtn" value="その他"><br>
<hr>
<input type="button" value="報告" onclick="javascript:submission()">
<input type="button" value="キャンセル" onclick="history.go(-1)">
</form>
</body>
</html>
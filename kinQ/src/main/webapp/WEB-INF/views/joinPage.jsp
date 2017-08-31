<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規取得</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="../resources/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">

	$(function(){
		$('#birth').datetimepicker({
			timepicker:false,
			format:'Ymd'
		});	
	});

</script>

</head>
<body>

<h1>新規取得</h1>

<div>
	<label for="name">Name</label><input type="text" name="userName" id="userName">
	<label for="id">ID</label><input type="text" name="id" id="id"><input type="button" value="重複チェック">
	<label for="pw">Password</label><input type="password" name="pw" id="pw">
	<label for="pwCheck">Password Check</label><input type="password" name="pwCheck" id="pwCheck">
	<label for="birth">Birthday</label><input type="text" id="birth" name="birth">
	<label for="email">Email</label><input type="text"  id="email" name="email">
	<label for="phone">Tel</label><input type="text"  id="phone" name="phone">
	<label for="phone">Interest</label>
		<select id="major" name="major">
			<option>教育・学習</option>
			<option>IT</option>
			<option>ゲーム</option>
			<option>エンタテインメント・芸術</option>
			<option>生活</option>
			<option>健康</option>
			<option>社会・政治</option>
			<option>経済</option>
			<option>旅行</option>
			<option>スポーツ</option>
		</select>
</div>
</body>
</html>
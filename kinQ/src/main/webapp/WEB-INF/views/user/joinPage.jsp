<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="./resources/jquery.datetimepicker.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./resources/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">

	function submission(){
		// 이름 체크		
		var userName = $('#userName').val();
		if(userName==''){
			alert('お名前を入力して下さい。'); return;
		}
		// 아이디 체크
		var id = $('#id').val();
		if(id==''){
			alert('IDを入力して下さい。'); return;
		}
		// 패스워드 체크
		var pw = $('#pw').val();
		var pwCheck = $('#pwCheck').val();
		if(pw=='' || pwCheck==''){
			alert('パスワードを入力して下さい。'); return;
		}
		if(pw != pwCheck){
			alert('パスワードを正確に入力してください。'); return;
		}
		
		$('#form').submit();
	}

	function loadMinorList(major){
		$.ajax({
			url: 'minorList',
			method: 'get',
			data: {major},
			success: function(minorList){
				var html = '';
				$.each(minorList, function(index, element){
					if(element.majorNum == major){
						html +=	'<input type="checkbox" value="'+element.minorNum+'">'+element.minorName+'<br>';
					}
				});
				$('#minorSection').html(html);				
			}
		});
	}
	
	
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

<form action="join" id="form" method="post">
	<div>
		<label for="name">Name</label><input type="text" name="userName" id="userName"><br>
		<label for="id">ID</label><input type="text" name="id" id="id"><input type="button" value="重複チェック"><br>
		<label for="pw">Password</label><input type="password" name="pw" id="pw"><br>
		<label for="pwCheck">Password Check</label><input type="password" name="pwCheck" id="pwCheck"><br>
		<label for="birth">Birthday</label><input type="text" id="birth" name="birth"><br>
		<label for="email">Email</label><input type="text"  id="email" name="email"><br>
		<label for="phone">Phone</label><input type="text"  id="phone" name="phone"><br>
		<label for="phone">Interest</label>
			<select id="major" name="major"  onchange="javascript:loadMinorList(this.options[this.selectedIndex].value)">
					<option value="0" selected="selected">選択</option>
				<c:forEach var="major" items="${majorList }">
					<option value="${major.majorNum} ">${major.majorName}</option>
				</c:forEach>
			</select>
			<div id="minorSection"></div>
			
			<input type="button" value="加入" onclick="javascript:submission()"><input type="button" value="前のページ" onclick="history.go(-1)">
	</div>
</form>
</body>
</html>
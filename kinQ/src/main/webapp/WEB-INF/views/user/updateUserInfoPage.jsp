<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>join</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="./resources/css/jquery.datetimepicker.min.css" rel="stylesheet">
	<script src="./resources/js/jquery.datetimepicker.full.min.js"></script> -->
<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css">
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/purple.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon.png">
	
<script type="text/javascript">
	var search = false;
	
	// 폼체크 및 submit
	function submission(){

		// 패스워드 체크
		var pw = $('#pw').val();
		var pwCheck = $('#pwCheck').val();
		if(pw=='' || pwCheck==''){
			alert('パスワードを入力して下さい。'); return false;
		}
		if(pw != pwCheck){
			alert('パスワードを正確に入力してください。'); return false;
		}
		// 생일 체크
		var birth = $('#birth').val();
		if(birth == ''){
			alert('生年月日を例のように記入してください。'); return false;
		}
		// 나이 체크
		var age = $('#age').val();
		if(age == ''|| isNaN(age)){
			alert('年を記入してください。'); return false;
		}
		//이메일 체크
		var email = $('#email').val();
		if(email == ''){
			alert('イーメールを入力してください。'); return false;
		}
		// 전화번호 체크
		var phone = $('#phone').val();
		if(phone == '' || isNaN(phone)){
			alert('電話番号を正確に入力してください。'); return false;
		}
		
		var interest = $('input[type="checkbox"]:checked').val();
		
		if(interest == null){
			alert('教える分野を選んで下さい。'); return false;
		}
		
		var checkboxArray = document.getElementById('checkboxArray');
		checkboxArray.value = chkNum;
		
		$('#updateform').submit();
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
	
/*   	$(function(){
		$('#birth').datetimepicker({
			timepicker:false,
			format:'Ymd'
		});	
	});   */

</script>

</head>
<body>

		<script type="text/javascript">
		function test() {
			$('.icon-remove', parent.document).click();
			return true;
		}
		</script>
		<div class="joinPageBack">
		<div class="form-style form-style-3">
			<form action="update" id="updateform" method="post" onsubmit="return test();">
				<div class="form-inputs clearfix">
					<p class="form-submit">
						<label for="id">ID</label>${sessionScope.userId}<br>
					</p>
					<p>
						<label for="name">Name</label>${sessionScope.userName}<br>
					</p>
					<p>
						<label for="pw">Password</label>
						<input type="password" name="pw" id="pw">
					</p>
					<p>
						<label for="pwCheck">Password Check</label>
						<input type="password" name="pwCheck" id="pwCheck">
					</p>
					<p>
						<label for="birth">Birthday</label>
						<input type="text" id="birth" name="birth" placeholder="例）　20170101">
					</p>
					<p>
						<label for="age">Age</label>
						<input type="text" id="age" name="age">
					</p>
					<p>
						<label for="email">Email</label>
						<input type="text"  id="email" name="email">
					</p>
					<p>
						<label for="phone">Phone</label>
						<input type="text"  id="phone"  placeholder="例)　08012345678" name="phone">
					</p>
					<p>
						<label for="interest">Interest</label>
						<select id="major" name="major"  onchange="javascript:loadMinorList(this.options[this.selectedIndex].value)">
							<option value="0" selected="selected">選択</option>
							<c:forEach var="major" items="${majorList }">
							<option value="${major.majorNum}">${major.majorName}</option>
							</c:forEach>
						</select>
						<div id="minorSection"></div>
					</p>
					<p>
						<h4>選んだ関心分野</h4>
			 			<ul id="allInterests"></ul>
					</p>
				</div>
				<p class="form-submit">
					 <input type="hidden" id="checkboxArray" value="" name="updatedCheckboxArray[]">
					 <input type="hidden" id="userNum" value="${sessionScope.userNum }">
					<input type="button" value="修正" onclick="javascript:submission()" class="button color small submit">
<!-- 					<input type="button" value="前のページ" onclick="history.go(-1)"> -->
				</p>
			</form>
		</div> 
		</div>


<!-- js -->
<script src="./resources/js/jquery.min.js"></script>
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
<!-- End js -->

</body>
</html>
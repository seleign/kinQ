<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>Ask me – Responsive Questions and Answers Template</title>
	<meta name="description" content="Ask me Responsive Questions and Answers Template">
	<meta name="author" content="vbegy">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css">
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/purple.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">


<script src="https://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
  <script type="text/javascript">
  	//웹소켓 터지면 uri문제입니다 확인해주세요 
  	// 실제 서버 인증서 있을때는 wss 뒤에 /leejo0531/ 없게 수정할 것 
// 	var webUri = "wss://" + window.location.host +"/count";
	var webUri = "ws://" + window.location.host +"/leejo0531/count";

	websocket = new WebSocket(webUri);
	websocket.onopen = function(evt){
		onOpen(evt);
	};
	websocket.onmessage = function(evt){
		onMessage(evt);
	};
	websocket.onerror = function(evt){
		onError(evt);
	};
	
	// 페이지 이동시에, 웹소켓 서버에 소켓 close를 해준다.
	$(window).on("beforeunload", function(){
       websocket.close();
    });
	
	function onOpen(evt){
		websocket.send("${sessionScope.userNum}");
	}
	function onMessage(evt){
		//메세지가 도착했을때 처리해줄 코드작성 arraylist가 반환될 것임 
		var html = "<p>"+evt.data+"</p>";
		$('#alarm_circle').append(html);
		alarmList(${sessionScope.userNum});
	}
	
	//빨간줄 뜨는거 무시하셔도 됩니다 
	$(function(){
		if(${sessionScope.userNum != null? true:false}){
			
		}
	});
	
	function alarmList(userNum){
		$.ajax({
			url: 'getAlarm',
			method: 'get',
			data: {userNum:userNum},
			success: function(result){
				var html = '';
					html += '<ul>';
				$.each(result, function(index, element){
					html += '<li>';
					if(element.alarmType =='reply'){
						html += '<a href="question_view?questionNum='+element.alarmAdress+'">질문에 답변이 달렸습니다.';
					}
					if(element.alarmType =='realtime'){
						html += '<li><a href="question_view?questionNum='+element.alarmAdress+'">실시간 답변 요청이 왔습니다.';
					}
					if(element.alarmType =='interest'){
						html += '<li><a href="question_view?questionNum='+element.alarmAdress+'">관심 항목에 대한 질문이 있습니다.';
					}
					html +='</li>';
				});
				html +='</ul>';
					$('#alarm_panel').append(html);
			}
		});
	}
	
	var isEmpty = function(value){
		if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
			return true
		}else{
			return false
		}
	};
	
	function checkNullValue() {
		var keyWord = $("input[name='search']").val();
 		if( isEmpty(keyWord)) {
 	 		return false;
		} 
 		return true;
	};
	
	function updateAlarm(userNum){
		
		$.ajax({
			url: 'updateAlarm',
			method: 'get',
			data: {
				userNum:userNum
			},
			success: function(result){
				return null;
			}
		});
	}
	
</script>
</head>
<body>

<div class="loader"><div class="loader_html"></div></div>

<div id="wrap" class="grid_1200">
<c:if test="${sessionScope.userName == null }">
	<div class="login-panel">
		<section class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="page-content">
						<h2>Login</h2>
						<div class="form-style form-style-3">
							<form action="login" id="loginform" method="post">
								<div class="form-inputs clearfix">
									<p class="login-text">
										<input type="text"  name="id" value="Username" onfocus="if (this.value == 'Username') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Username';}">
										<i class="icon-user"></i>
									</p>
									<p class="login-password">
										<input type="password" name="pw" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}">
										<i class="icon-lock"></i>
										<a href="#">Forget</a>
									</p>
								</div>
								<p class="form-submit login-submit">
									<input type="submit" value="Log in" class="button color small login-submit submit">
								</p>
								<div class="rememberme">
									<label><input type="checkbox" checked="checked"> Remember Me</label>
								</div>
							</form>
						</div>
					</div><!-- End page-content -->
				</div><!-- End col-md-6 -->
				<div class="col-md-6">
					<div class="page-content Register">
						<h2>Register Now</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravdio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequa. Vivamus vulputate posuere nisl quis consequat.</p>
						<a class="button color small signup" id="joinpagebutton">Create an account</a>
					</div><!-- End page-content -->
				</div><!-- End col-md-6 -->
			</div>
		</section>
	</div><!-- End login-panel -->
	</c:if>
	
	<!-- panel pop -->
	<div class="panel-pop" id="signup">
	<h2>新規取得<i class="icon-remove"></i></h2>
		<iframe src="join" class="signupIframe"></iframe>
	</div><!-- End signup -->
	
	<div class="panel-pop alarm" id="alarm_pop">
	<h2>Alarm<i class="icon-remove"></i></h2>
	<div class="form-style form-style-3" id="alarm_panel">
	</div>
	</div>
	
	<div class="panel-pop" id="lost-password">
		<h2>Lost Password<i class="icon-remove"></i></h2>
		<div class="form-style form-style-3">
			<p>Lost your password? Please enter your username and email address. You will receive a link to create a new password via email.</p>
			<form>
				<div class="form-inputs clearfix">
					<p>
						<label class="required">Username<span>*</span></label>
						<input type="text">
					</p>
					<p>
						<label class="required">E-Mail<span>*</span></label>
						<input type="email">
					</p>
				</div>
				<p class="form-submit">
					<input type="submit" value="Reset" class="button color small submit">
				</p>
			</form>
			<div class="clearfix"></div>
		</div>
	</div><!-- End lost-password -->
	
	<div id="header-top">
		<section class="container clearfix">
			<nav class="header-top-nav">
				<ul>
<!-- 					<li><a href="contact_us.html"><i class="icon-envelope"></i>Contact</a></li> -->
<!-- 					<li><a href="#"><i class="icon-headphones"></i>Support</a></li> -->
					<c:choose>
						<c:when test="${sessionScope.userName == null}">
							<li><a href="#" id="login-panel"><i class="icon-user"></i>Login Area</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#"><i class="icon-user"></i>${sessionScope.userName }様 Login 中…</a></li>
							<li><a href="logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
				<div class="header-search">
					<form action="search" method="get" onsubmit="return checkNullValue();">
						<div class="search_text">					
							<input type="hidden" name="from" value="1">
							<input type="hidden" name="to" value="10">
						    <input type="text" name="search">
						    <button type="submit" class="search-submit"></button>
					    </div>
						<div class="search_select">
	 						<select name="searchType">
								<option value="title">題名で</option>
								<option selected="selected" value="content">内容で</option>
								<option value="tag">タッグで</option>
								<option value="author">ユーザーで</option>
							</select>
						</div>
					</form>
				</div>
				<c:if test="${sessionScope.userName != null }">
				<div class="header-mypage">
					<a href="mypage"><i class="icon-user"></i>Mypage</a>
				</div>
				<div class="header_alarm">
					<div id="alarm_img">
					<a href="#" class="alarm_button" id="a_button" onclick="javascript:updateAlarm(${sessionScope.userNum})"><img src="./resources/images/bell.png"></a>
					<div id="alarm_circle"></div>
					</div>
				</div>
				</c:if>
		</section><!-- End container -->
	</div><!-- End header-top -->
	<header id="header">
		<section class="container clearfix">
			<div class="logo"><a href="index"><img alt="" src="images/logo_bs.png"></a></div>
			<nav class="navigation">
				<ul>
					<li class="current_page_item"><a href="index.html">Home</a></li>
					<li class="ask_question"><a href="askQuestion">質問ボード</a></li>
					<li><a href="pointShop">ポイントショップ</a></li>
					<li><a href="javascript:void(0)">サービス案内</a>
						<ul>
							<li><a href="terms">利用約款</a>
							<li><a href="terms">Q&A</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</section><!-- End container -->
	</header><!-- End header -->
</body>
</html>
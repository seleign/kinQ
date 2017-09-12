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
	<link rel="stylesheet" href="./resources/css/gray.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
  
</head>
<body>

<div class="loader"><div class="loader_html"></div></div>

<c:if test="${sessionScope.userName == null }">
<div id="wrap" class="grid_1200">
	<div class="login-panel">
		<section class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="page-content">
						<h2>Login</h2>
						<div class="form-style form-style-3">
							<form action="login" id="loginform" method="get">
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
	<div class="panel-pop" id="signup">
	<h2>新規取得<i class="icon-remove"></i></h2>
		<iframe src="join" class="signupIframe"></iframe>
	</div><!-- End signup -->
	
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
			<div class="header-mypage">
				<a href="mypage" id="login-panel"><i class="icon-user"></i>Mypage</a>
			</div>
<!-- 			<div class="header-search"> -->
<!-- 				<form> -->
<!-- 				    <input type="text" value="Search here ..." onfocus="if(this.value=='Search here ...')this.value='';" onblur="if(this.value=='')this.value='Search here ...';"> -->
<!-- 				    <button type="submit" class="search-submit"></button> -->
<!-- 				</form> -->
<!-- 			</div> -->
		</section><!-- End container -->
	</div><!-- End header-top -->
	<header id="header">
		<section class="container clearfix">
			<div class="logo"><a href="index"><img alt="" src="images/logo_ws.png"></a></div>
			<nav class="navigation">
				<ul>
					<li class="current_page_item"><a href="index.html">Home</a></li>
					<li class="ask_question"><a href="askQuestion">질문하기(폼이동)</a></li>
					<li><a href="cat_question.html">질문(하위메뉴 有)</a>
						<ul>
							<li><a href="cat_question.html">하위 1</a></li>
							<li><a href="single_question.html">하위 2</a></li>
							<li><a href="single_question_poll.html">하위 3</a></li>
						</ul>
					</li>
					<li><a href="blog_1.html">포인트샵 중분류-소분류</a>
						<ul>
							<li><a href="blog_1.html">중 1</a>
								<ul>
									<li><a href="blog_1.html">소 1-1</a></li>
									<li><a href="blog_1_l_sidebar.html">소 1-2</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="shortcodes">Shortcodes</a></li>
					<li><a href="contact_us.html">고객센터</a></li>
				</ul>
			</nav>
		</section><!-- End container -->
	</header><!-- End header -->
</body>
</html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
  	
  	<script type="text/javascript">

  	$(function(){
  			$.ajax({
  				url: 'asideData',
  				method: 'get',
  				data: {},
  				success: function(result){
  			  			$('#uNum').html(result[0]);
  			   			$('#cntSession').html(result[1]);
  			  			$('#qNum').html(result[2]);
  			  			$('#aNum').html(result[3]); 
  				}
  			});
  			
/*   			
  			
  		
  			var allUsersNum = ${allUsersNum};
  			var countSession = ${countSession};
  			var allQuestionsNum = ${allQuestionsNum };
  			var allAnswersNum = ${allAnswersNum };
  			
  			sessionStorage.setItem("allUsersNum", allUsersNum);
  			sessionStorage.setItem("countSession", countSession);
  			sessionStorage.setItem("allQuestionsNum", allQuestionsNum);
  			sessionStorage.setItem("allAnswersNum", allAnswersNum);
  			
  			
 */
  		});
  	
  	$(function(){
		$.ajax({
			url: 'hotTag',
			method: 'get',
			data: {},
			success: function(result){
				var html = "";
				$.each( result, function(index, element) {
					html += '<a href="search?search='+element+'&searchType=tag&from=1&to=10">'+element+'</a>';
				})
				$('#tags').html(html);
			}
		});
		
	});
  	
  	$(function(){
		$.ajax({
			url: 'asideRank',
			method: 'get',
			data: {},
			success: function(result){
				var html = "";
				$.each( result, function(index, element) {
					html += '<li><div class="author-img">';
					html += '<img width="60" height="60" src="https://placehold.it/60x60/FFF/444" alt="">';
					html += '</div><h6>'+element.userId+'</h6>';
					html += '<span class="comment">'+element.totalPoint+' 点</span></li>';
				})
				$('#simpleRankingList').html(html);
			}
		});
		
	});
  	</script>
</head>
<body>

<div class="loader"><div class="loader_html"></div></div>

<aside class="col-md-3 sidebar">
				<div class="widget widget_stats">
					<h3 class="widget_title">サイトの利用現状</h3>
					
					<div class="ul_list ul_list-icon-ok">
						<ul>
							<li><i class="icon-star"></i>全体会員数：  <span id="uNum"></span>　人</li>
							<li><i class="icon-group"></i>接続会員数：  <span id="cntSession"></span>　人</li>
							<li><i class="icon-comments-alt"></i>全体質問数：  <span id="qNum"></span>　個</li>
							<li><i class="icon-comments"></i>全体回答数：  <span id="aNum"></span>　個</li>
						</ul>
					</div>
				</div>
				
				<c:if test="${sessionScope.userName == null }">
				<div class="widget widget_login">
					<h3 class="widget_title">Login</h3>
					<div class="form-style form-style-2">
						<form action="login" id="loginform" method="post">
							<div class="form-inputs clearfix">
								<p class="login-text">
									<input type="text" name="id" value="Username" onfocus="if (this.value == 'Username') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Username';}">
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
						<ul class="login-links login-links-r">
							<li><a href="#">Register</a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
				</c:if>
				<div class="widget widget_highest_points">
					<h3 class="widget_title">Highest points</h3>
					<a href="rankingList">
						<ul id="simpleRankingList">
						</ul>
					</a>
				</div>
				<!-- 핫 태그 hot tag -->
				<div class="widget widget_tag_cloud">
					<h3 class="widget_title">Tags</h3>
					<div id="tags"></div>
				</div>
				
				<div class="widget">
					<h3 class="widget_title">Recent Questions</h3>
					<ul class="related-posts">
						<li class="related-item">
							<h3><a href="#">This is my first Question</a></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<div class="clear"></div><span>Feb 22, 2014</span>
						</li>
						<li class="related-item">
							<h3><a href="#">This Is My Second Poll Question</a></h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<div class="clear"></div><span>Feb 22, 2014</span>
						</li>
					</ul>
				</div>
				
			</aside><!-- End sidebar -->
</body>
</html>
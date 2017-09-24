<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	<footer id="footer">
		<section class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="widget widget_contact">
						<h3 class="widget_title">会社案内</h3>
						<ul>
							<li>
								<span>住所 :</span>
								ソウル市　江南区　嶺東大路　513
								
							</li>
							<li>
								<span>サポート :</span>
								代表番号 : (+82) 2-123-4567
							</li>
							<li>Eメール : info@kinq.com</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget_title">クイックリンク</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="askQuestion">質問ボード</a></li>
							<li><a href="pointShop">ポイントショップ</a></li>
							<li><a href="helpPage">ヘルプ</a></li>
						</ul>
					</div>
				</div>
			<div class="col-md-3">
					<div class="widget">
						<h3 class="widget_title">利用約款</h3>
						<ul class="related-posts">
							<li class="related-item">
								<a href="terms">緊Qサービスの利用約款確認</a>
							</li>
						</ul>
					</div>	
				</div>
 				<div class="col-md-3">
					<div class="widget widget_twitter">
						<h3 class="widget_title">Q&A</h3>
						<a href="terms">キューアンドエーページ</a>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</footer><!-- End footer -->
	<footer id="footer-bottom">
	<section class="container">
			<div class="copyrights f_left">Copyright 2017 緊Q. All Rights Reserved. </div>
		</section><!-- End container -->
	</footer><!-- End footer-bottom -->
	
</body>
</html>
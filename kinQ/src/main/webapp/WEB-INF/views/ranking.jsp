<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>緊Q</title>
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
	
	<link rel="stylesheet" href="./resources/css/mypageDesign.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
  	<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
   <style>
   	.rankTitle{
   		font-family: "Rounded Mplus 1c";
   	}
   	
   </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="./resources/js/dateFormat.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  </script>
  
  
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div class="breadcrumbs" id="sectionBack">
		<section class="container">
			<div class="row">
<!-- 				<div class="col-md-12">
					<h1>マイページ</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<a href="#">User</a>
						<span class="crumbs-span">/</span>
						<span class="current">Mypage</span>
					</div>
				</div>
-->
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-12">
						<div class="page-content">
							<h2 class="rankTitle">ユーザー活動ランキング</h2>
							<ul>
								<c:forEach var="rank" items="${rankList}">
									<li>
										<div style="display:inline-block; width:20%;">
											<c:if test="${rank.ranking!=0}">
												<span class="font-gold">${rank.ranking}</span>位:&nbsp;&nbsp;<span class="font-silver">${rank.userId}</span>
											</c:if>
											<c:if test="${rank.ranking==0}">
												<span class="font-gold">-</span>位:&nbsp;&nbsp;<span class="font-silver">${rank.userId}</span>
											</c:if>
										</div>
										<div style="text-align:right; display:inline-block; width:60%;">
											<span><i class="icon-question-sign"></i>${rank.qCount}個の質問x10点&nbsp;&nbsp;&nbsp;<i class="icon-lightbulb"></i>${rank.rCount}個の答えx20点&nbsp;&nbsp;&nbsp;<i class="icon-ok"></i>${rank.sCount}個の採択x30点&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
										</div>
										<div style="text-align:right; display:inline-block; width:15%;">
											<span class="font-skyblue">${rank.totalPoint}点</span>
										</div>
									</li>
									<hr>
								</c:forEach>
							</ul>
						</div><!-- End page-content -->
					</div><!-- End col-md-12 -->
				</div><!-- End row -->
			</div><!-- End main -->
			<jsp:include page="aside.jsp" flush="false" />
		</div><!-- End row -->
	</section><!-- End container -->
	<jsp:include page="footer.jsp" flush="false" />
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

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
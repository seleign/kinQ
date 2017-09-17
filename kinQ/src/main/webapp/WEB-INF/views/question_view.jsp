<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.js"></script>
<script src="./resources/js/jquery.min.js"></script>

<!-- CKeditor -->
<script src="./resources/ckeditor/ckeditor.js"></script> 
<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
<script src="./resources/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">
		var replyHtml = "";
		var bestReplyHtml = "";
		var userId = <%=(String)session.getAttribute("userId")%>;
		getMAxScoreReply();
		questionReplyList();
		
		window.onload = function() {
			// 1. Ckeditor 초기화, 파일 업로드 주소 설정
				CKEDITOR.replace('replyContent',{ 
		    	    		filebrowserUploadUrl: 'cKEditorFileUpload'
		   		 }); // Ckeditor 초기화 종료
		};
		
		function getMAxScoreReply() {
			$.ajax({
				url: "getMaxScoreReply",
				type: "get",
				data: { questionNum: ${ question.questionNum }},
				success: function (reply) {
					bestReplyHtml += "<h4>"+ reply.id + "</h4>";
					bestReplyHtml += "<div class=\"date\"><i class=\"icon-time\"></i>" + reply.r_RegDate + "</div>";
					bestReplyHtml += reply.replyContent +"<br>";
					bestReplyHtml += "<div class=\"question-answered question-answered-done\"><i class=\"icon-ok\"></i>Best Answer</div>";
					$("#bestReply").html(bestReplyHtml);
				}
			})
		}
		
		function questionReplyList() {
			$.ajax({
				url: "questionReplyList",
				type: "get",
				data: { questionNum: ${ question.questionNum }},
				success: function (replyList) {
					replyHtml += "<div class=\"boxedtitle page-title\"><h2>Answers ( <span class=\"color\">" + replyList.length +"</span> )</h2></div>";
					replyHtml += "<ol class=\"commentlist clearfix\">";
					for (var i = 0; i < replyList.length; i++) {
						replyHtml += "<li class=\"comment\">";
						replyHtml += "<div class=\"comment-body comment-body-answered clearfix\">";
						/* replyHtml += "<div class=\"avatar\"><img alt=\"\" src=\"http://placehold.it/60x60/FFF/444\"></div>" */
						replyHtml += "<div class=\"comment-text\">";
						replyHtml += "<div class=\"author clearfix\">";
						replyHtml += "<div class=\"comment-author\"><a href=\"#\">" + replyList[i].id + "</a></div>";
						replyHtml += "<div class=\"comment-vote\">";
						replyHtml += "<ul class=\"question-vote\">";
						replyHtml += "<li><a href=\"#\" class=\"question-vote-up\" title=\"Like\"></a></li>";
						replyHtml += "<li><a href=\"#\" class=\"question-vote-down\" title=\"Dislike\"></a></li>";
						replyHtml += "</ul>";
						replyHtml += "</div>";
						if (replyList[i].score > 0) {
							replyHtml += "<span class=\"question-vote-result\" style=\"color:green; font-weight:bold; margin-top: 5px;\">" + replyList[i].score + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
						} else if (replyList[i].score < 0){
							replyHtml += "<span class=\"question-vote-result\" style=\"color:red; font-weight:bold; margin-top: 5px;\">" + replyList[i].score*(-1) + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
						} else {
							replyHtml += "<span class=\"question-vote-result\" style=\"font-weight:bold; margin-top: 5px;\">" + replyList[i].score + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
						}
						replyHtml += "<div class=\"comment-meta\">";
						replyHtml += "<div class=\"date\"><i class=\"icon-time\"></i>" + replyList[i].r_RegDate + "</div>" ;
						replyHtml += "</div>";
						if (userId == replyList[i].id) {
							replyHtml += "<a class=\"comment-reply\" href=\"#\"><i class=\"icon-reply\"></i>삭제</a>" ;
						}
						replyHtml += "</div>";
						replyHtml += "<div class=\"text\">";
						replyHtml += "<p>" + replyList[i].replyContent + "</p>";
						replyHtml += "</div>";
						replyHtml += "</div>";
						replyHtml += "</div>";
						replyHtml += "</li>";
					}
					replyHtml += "</ol>";
					console.log(replyHtml);
					$("#commentlist").html(replyHtml);
					$("#answerCount").html(replyList.length);
				}
			})
		}
		
		
		function registReply() {
			var replyCtx = ducoment.getElementById("replyContent");
			$.ajax({
				url: "registReply",
				type: "get",
				data: { questionNum: ${ question.questionNum },
						id: user.id/* userId (변경필요)*/,
						replyContent: replyCtx
				},
				success: function (replyList) {
					getMAxScoreReply();
					questionReplyList();
				}
			})
		}
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	
	<div class="breadcrumbs">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>여기 뭐가 들어가나요?</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<a href="#">Questions</a>
						<span class="crumbs-span">/</span>
						<span class="current">${ question.title }</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				<article class="question single-question question-type-normal">
					<h2>${ user.id }</h2>
					<h2>
						<a href="single_question.html">${ question.title }</a>
					</h2>
					<!-- <a class="question-report" href="#">Report</a>
					<div class="question-type-main"><i class="icon-question-sign"></i>Question</div> -->
					<div class="question-inner">
						<div class="clearfix"></div>
						<div class="question-desc">
							<p>${ question.questionContent }</p>
						</div>
						<div class="question-details">
							<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>
							<span class="question-favorite"><i class="icon-star"></i>5</span>
						</div>
						<span class="question-category"><a href="#"><i class="icon-folder-close"></i>${ minor.minorName }</a></span>
						<span class="question-date"><i class="icon-time"></i>${ checkTimeResult } ago</span>
						<span class="question-comment"><a href="#"><i class="icon-comment"></i><span id="answerCount"></span> Answer</a></span>
						<span class="question-view"><i class="icon-user"></i>${ question.hit } views</span>
						<span class="single-question-vote-result">${ question.score }</span>
						<ul class="single-question-vote">
							<li><a href="#" class="single-question-vote-down" title="Dislike"><i class="icon-thumbs-down"></i></a></li>
							<li><a href="#" class="single-question-vote-up" title="Like"><i class="icon-thumbs-up"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</article>
				
				<div class="share-tags page-content">
					<div class="question-tags"><i class="icon-tags"></i>
						<c:forEach var="tag" items="${ tagList }">
							<a href="#">${ tag.tag }</a>&nbsp;&nbsp;
						</c:forEach>
					</div>
					<div class="share-inside-warp">
						<ul>
							<li>
								<a href="#" original-title="Facebook">
									<span class="icon_i">
										<span class="icon_square" icon_size="20" span_bg="#3b5997" span_hover="#666">
											<i i_color="#FFF" class="social_icon-facebook"></i>
										</span>
									</span>
								</a>
								<a href="#" target="_blank">Facebook</a>
							</li>
							<li>
								<a href="#" target="_blank">
									<span class="icon_i">
										<span class="icon_square" icon_size="20" span_bg="#00baf0" span_hover="#666">
											<i i_color="#FFF" class="social_icon-twitter"></i>
										</span>
									</span>
								</a>
								<a target="_blank" href="#">Twitter</a>
							</li>
							<li>
								<a href="#" target="_blank">
									<span class="icon_i">
										<span class="icon_square" icon_size="20" span_bg="#ca2c24" span_hover="#666">
											<i i_color="#FFF" class="social_icon-gplus"></i>
										</span>
									</span>
								</a>
								<a href="#" target="_blank">Google plus</a>
							</li>
							<li>
								<a href="#" target="_blank">
									<span class="icon_i">
										<span class="icon_square" icon_size="20" span_bg="#e64281" span_hover="#666">
											<i i_color="#FFF" class="social_icon-dribbble"></i>
										</span>
									</span>
								</a>
								<a href="#" target="_blank">Dribbble</a>
							</li>
							<li>
								<a target="_blank" href="#">
									<span class="icon_i">
										<span class="icon_square" icon_size="20" span_bg="#c7151a" span_hover="#666">
											<i i_color="#FFF" class="icon-pinterest"></i>
										</span>
									</span>
								</a>
								<a href="#" target="_blank">Pinterest</a>
							</li>
						</ul>
						<span class="share-inside-f-arrow"></span>
						<span class="share-inside-l-arrow"></span>
					</div><!-- End share-inside-warp -->
					<div class="share-inside"><i class="icon-share-alt"></i>Share</div>
					<div class="clearfix"></div>
				</div><!-- End share-tags -->
				
				<div class="about-author clearfix">
				    <div class="author-image">
				    	<a href="#" original-title="admin" class="tooltip-n"><img alt="" src="http://placehold.it/60x60/FFF/444"></a>
				    </div>
				    <div class="author-bio" id="bestReply"></div>
				</div><!-- End about-author -->
				
				<div id="related-posts">
					<h2>Related questions</h2>
					<textarea rows="" cols="" id="replyContent"></textarea>
					<button onclick="registReply()">등록</button>
				</div><!-- End related-posts -->
				
				<!-- 답글부분 -->
				<div id="commentlist" class="page-content">
				</div><!-- End page-content -->
				
				<!-- <div id="respond" class="comment-respond page-content clearfix"></div> -->
				
				<div class="post-next-prev clearfix">
				    <p class="prev-post">
				        <a href="#"><i class="icon-double-angle-left"></i>&nbsp;Prev question</a>
				    </p>
				    <p class="next-post">
				        <a href="#">Next question&nbsp;<i class="icon-double-angle-right"></i></a>                                
				    </p>
				</div><!-- End post-next-prev -->	
			</div><!-- End main -->
			<jsp:include page="aside.jsp" flush="false" />
		</div><!-- End row -->
	</section><!-- End container -->
	
	<footer id="footer">
		<section class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="widget widget_contact">
						<h3 class="widget_title">Where We Are ?</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.</p>
						<ul>
							<li>
								<span>Address :</span>
								Ask Me Network, 33 Street, syada Zeinab, Cairo, Egypt.
							</li>
							<li>
								<span>Support :</span>Support Telephone No : (+2)01111011110
							</li>
							<li>Support Email Account : info@example.com</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="widget">
						<h3 class="widget_title">Quick Links</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="ask_question.html">Ask Question</a></li>
							<li><a href="#">About</a></li>
							<li><a href="cat_question.html">Questions</a></li>
							<li><a href="user_profile.html">Users</a></li>
							<li><a href="blog_1.html">Blog</a></li>
							<li><a href="right_sidebar.html">Pages</a></li>
							<li><a href="shortcodes.html">Shortcodes</a></li>
							<li><a href="contact_us.html">Contact Us</a></li>
							<li><a href="#">FAQs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="widget">
						<h3 class="widget_title">Popular Questions</h3>
						<ul class="related-posts">
							<li class="related-item">
								<h3><a href="#">This is my first Question</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
								<div class="clear"></div><span>Feb 22, 2014</span>
							</li>
							<li class="related-item">
								<h3><a href="#">This Is My Second Poll Question</a></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam.</p>
								<div class="clear"></div><span>Feb 22, 2014</span>
							</li>
						</ul>
					</div>	
				</div>
				<div class="col-md-3">
					<div class="widget widget_twitter">
						<h3 class="widget_title">Latest Tweets</h3>
						<div class="tweet_1"></div>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</footer><!-- End footer -->
	<footer id="footer-bottom">
		<section class="container">
			<div class="copyrights f_left">Copyright 2014 Ask me | <a href="#">By 2code</a></div>
			<div class="social_icons f_right">
				<ul>
					<li class="twitter"><a original-title="Twitter" class="tooltip-n" href="#"><i class="social_icon-twitter font17"></i></a></li>
					<li class="facebook"><a original-title="Facebook" class="tooltip-n" href="#"><i class="social_icon-facebook font17"></i></a></li>
					<li class="gplus"><a original-title="Google plus" class="tooltip-n" href="#"><i class="social_icon-gplus font17"></i></a></li>
					<li class="youtube"><a original-title="Youtube" class="tooltip-n" href="#"><i class="social_icon-youtube font17"></i></a></li>
					<li class="skype"><a original-title="Skype" class="tooltip-n" href="skype:#?call"><i class="social_icon-skype font17"></i></a></li>
					<li class="flickr"><a original-title="Flickr" class="tooltip-n" href="#"><i class="social_icon-flickr font17"></i></a></li>
					<li class="rss"><a original-title="Rss" class="tooltip-n" href="#"><i class="social_icon-rss font17"></i></a></li>
				</ul>
			</div><!-- End social_icons -->
		</section><!-- End container -->
	</footer><!-- End footer-bottom -->
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
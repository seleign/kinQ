<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	
	<!-- 별점주기 -->
	<link rel="stylesheet" href="./resources/css/star.css">
	
	<link rel="stylesheet" href="./resources/js/video-js-6/video-js.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
	<link href="https://fonts.googleapis.com/earlyaccess/roundedmplus1c.css" rel="stylesheet" />
   <style>
   	.pageName {
   		font-family: "Rounded Mplus 1c";
   	}
   	.current{
   		font-family: "Rounded Mplus 1c";
   	}
   </style>
	
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/jquery.blockUI.js"></script>
<script src="./resources/js/custom.js"></script>
<script src="./resources/js/video-js-6/video.min.js"></script>

<!-- CKeditor -->
<script src="./resources/ckeditor/ckeditor.js"></script> 
<!-- CKeditor 내부 객체를 JQuery로 다루기 위한 adapters -->
<script src="./resources/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">
		var replyHtml = "";
		var bestReplyHtml = "";
		var selectedReply = "";
		var userId = "${ sessionScope.userId }";
		
		
		selectedReplyView();
		getMAxScoreReply();
		questionReplyList();
		
		window.onload = function() {
			if (userId != "" && userId != "${ user.id }") {
				// 1. Ckeditor 초기화, 파일 업로드 주소 설정
				CKEDITOR.replace('replyContent',{ 
		    	    		filebrowserUploadUrl: 'cKEditorFileUpload'
		   		}); // Ckeditor 초기화 종료
			}
		};
		
		var isEmpty = function(value){
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
				return true
			}else{
				return false
			}
		};
		
		function CKupdate(){
		    for ( instance in CKEDITOR.instances ){
		        CKEDITOR.instances[instance].updateElement();
		        CKEDITOR.instances[instance].setData('');
		    }
		}
		
		function getMAxScoreReply() {
			$.ajax({
				url: "getMaxScoreReply",
				type: "get",
				data: { questionNum: ${ question.questionNum }},
				success: function (reply) {
					if (!isEmpty(reply)) {
						bestReplyHtml += "<div class=\"boxedtitle page-title\"><h2>추천 답변</h2></div>"
						bestReplyHtml += "<h4>"+ reply.id + "</h4>";
						bestReplyHtml += "<div class=\"date\"><i class=\"icon-time\"></i>" + reply.r_RegDate + "</div>";
						if (!isEmpty(reply.videoSrc)) {
							bestReplyHtml += "<video id=\"my-video\" class=\"video-js\" controls data-setup='{}'>"
							bestReplyHtml += "<source src=\"" + reply.videoSrc +"\" type=\"video/webm\"></source>"
							bestReplyHtml += "</video>"
						}
						bestReplyHtml += reply.replyContent +"<br>";
						bestReplyHtml += "<div class=\"question-answered question-answered-done\"><i class=\"icon-ok\"></i>Best Answer</div>";
						$("#bestReply").html(bestReplyHtml);
						$("#" + reply.replyNum + "").hide();
						$("#bestReplyDiv").show();
						bestReplyHtml = "";
					} else {
						$("#bestReplyDiv").hide();
					}
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
					if (!isEmpty(userId)) {
						for (var i = 0; i < replyList.length; i++) {
							if (replyList[i].score >= 0) {
								replyHtml += "<ol class=\"commentlist clearfix\" id=\"" + replyList[i].replyNum + "\">";
								replyHtml += "<li class=\"comment\">";
								replyHtml += "<div class=\"comment-body comment-body-answered clearfix\">";
								/* replyHtml += "<div class=\"avatar\"><img alt=\"\" src=\"http://placehold.it/60x60/FFF/444\"></div>" */
								replyHtml += "<div class=\"comment-text\">";
								replyHtml += "<div class=\"author clearfix\">";
								replyHtml += "<div class=\"comment-author\"><a href=\"#\">" + replyList[i].id + "</a></div>";
								replyHtml += "<div class=\"comment-vote\">";
								replyHtml += "<ul class=\"question-vote\">";
								//reply에 대한 다른 유저들의 추천
								replyHtml += "<li><a href=\"javascript:updateRecommendUp("+ replyList[i].replyNum + "," + replyList[i].userNum +")\" class=\"question-vote-up\" title=\"Like\"></a></li>";
								replyHtml += "<li><a href=\"javascript:updateRecommendDown("+ replyList[i].replyNum + "," + replyList[i].userNum +")\" class=\"question-vote-down\" title=\"Dislike\"></a></li>";
								replyHtml += "</ul>";
								replyHtml += "</div>";
								if (replyList[i].recommend > 0) {
									replyHtml += "<span class=\"question-vote-result\" style=\"color:green; font-weight:bold; margin-top: 5px;\">" + replyList[i].recommend + "</span>";
								} else if (replyList[i].recommend < 0){
									replyHtml += "<span class=\"question-vote-result\" style=\"color:red; font-weight:bold; margin-top: 5px;\">" + replyList[i].recommend*(-1) + "</span>";
								} else {
									replyHtml += "<span class=\"question-vote-result\" style=\"font-weight:bold; margin-top: 5px;\">0</span>";
								}
								replyHtml += "<div class=\"comment-meta\">";
								replyHtml += "<div class=\"date\"><i class=\"icon-time\"></i>" + replyList[i].r_RegDate + "</div>" ;
								replyHtml += "</div>";
								if (userId == replyList[i].id) {
									replyHtml += "<a class=\"comment-reply\" href=\"javascript:deleteReply(" + replyList[i].replyNum + ")\"><i class=\"icon-reply\"></i>削除</a>";
								}
								if ( "${ user.id }" == userId && replyList[i].selectedReplyNum == 0) {
									replyHtml += "<a class=\"comment-reply\" href=\"javascript:recommendPop(" + replyList[i].replyNum + ")\"><i class=\"icon-reply\"></i>答えを選択</a>";
								}
								replyHtml += "</div>";
								replyHtml += "<div class=\"text\">";
								if (!isEmpty(replyList[i].videoSrc)) {
									replyHtml += "<video id=\"my-video\" class=\"video-js\" controls data-setup='{}'>"
									replyHtml += "<source src=\"" + replyList[i].videoSrc +"\" type=\"video/webm\"></source>"
									replyHtml += "</video>"
								}
								replyHtml += "<p>" + replyList[i].replyContent + "</p>";
								replyHtml += "</div>";
								replyHtml += "</div>";
								replyHtml += "</div>";
								replyHtml += "</li>";
								replyHtml += "</ol>";
							}
						}
						$("#commentlist").html(replyHtml);
					} else {
						/* replyHtml += "<table style=\"margin: auto;\"><tr>";
						replyHtml += "<h2 style=\"color: gray;margin: auto;\">ログインしてください。</h2>";
						replyHtml += "</tr></table>";
						$("#commentlist").html(replyHtml); */
						$("#related-posts").hide();
						$("#commentlist").hide();
					}
					$("#answerCount").html(replyList.length);
					replyHtml = "";
				}
			})
		}
		
		
		function registReply() {
			var replyCtx = CKEDITOR.instances.replyContent.getData();
			$.ajax({
				url: "registReply",
				type: "post",
				data: { questionNum: ${ question.questionNum },
						id: userId,
						replyContent: replyCtx
				},
				success: function (success) {
					selectedReplyView();
					getMAxScoreReply();
					questionReplyList();
					CKupdate();
				}
			})
		}
		
		function deleteReply(replyNum) {
			$.ajax({
				url: "deleteReply",
				type: "POST",
				data: { replyNum: replyNum },
				success: function (success) {
					getMAxScoreReply();
					questionReplyList();
					//window.location.reload(true);
				}
			})
		}
		
		function registReplyScore() {
			var score = parseInt($("#replyScore").text());
			alert(score);
			alert(selectedReply);
			if (score == 0) {
				registReplyCancel()
			} else {
				$.ajax({
					url: "selectedReply",
					type: "get",
					data: { 
							questionNum: ${ question.questionNum },
							replyNum: selectedReply,
							score: score
						  },
					success: function (sucess) {
						selectedReplyView();
						/* getMAxScoreReply();*/
						questionReplyList();
						registReplyCancel();
						selectedReplyView();
						//window.location.reload(true);
					}
				})
			}
		}
		
		function selectedReplyView() {
			$.ajax({
				url: "getSelectedReply",
				type: "get",
				data: { 
						questionNum: ${ question.questionNum },
					  },
				success: function (reply) {
					if (!isEmpty(reply)) {
						selectedReply += "<div class=\"boxedtitle page-title\"><h2>질문자 선택 답변</h2></div>"
						selectedReply += "<h4>"+ reply.id + "</h4>";
						selectedReply += "<div class=\"date\"><i class=\"icon-time\"></i>" + reply.r_RegDate + "</div>";
						if (!isEmpty(reply.videoSrc)) {
							selectedReply += "<video id=\"my-video\" class=\"video-js\" controls data-setup='{}'>"
							selectedReply += "<source src=\"" + reply.videoSrc +"\" type=\"video/webm\"></source>"
							selectedReply += "</video>"
						}
						selectedReply += reply.replyContent +"<br>";
						selectedReply += "<div class=\"question-answered question-answered-done\"><i class=\"icon-ok\"></i>Selected Answer</div>";
						$("#selectedReply").html(selectedReply);
						$("#" + reply.replyNum + "").hide();
						$("#selectedReplyDiv").show();
						selectedReply = "";
					} else {
						$("#selectedReplyDiv").hide();
					}
				}
			})
		}
		
		function registReplyCancel() {
			jQuery(".panel-pop").animate({"top":"-100%"},500).hide(function () {
				jQuery(this).animate({"top":"-100%"},500);
			});
			jQuery(".wrap-pop").remove();
		}
		
		function recommendPop(replyNum) {
			selectedReply = replyNum;
			jQuery(".panel-pop").animate({"top":"-100%"},10).hide();
			jQuery("#jeonsw").show().animate({"top":"50%"},500);
			jQuery("body").prepend("<div class='wrap-pop'></div>");
			wrap_pop();
			return false;
		}
		
		function wrap_pop() {
			jQuery(".wrap-pop").click(function () {
				jQuery(".panel-pop").animate({"top":"-100%"},500).hide(function () {
					jQuery(this).animate({"top":"-100%"},500);
				});
				jQuery(this).remove();
			});
		}
		
		function updateRecommendUp(replyNum, userNum) {
			$.ajax({
				url: "updateRecommendUp",
				type: "get",
				data: { 
						questionNum: ${ question.questionNum },
						replyNum: replyNum,
						userNum: userNum
					  },
				success: function (sucess) {
					getMAxScoreReply();
					questionReplyList();
				}
			})
		}
		
		function updateRecommendDown(replyNum, userNum) {
			$.ajax({
				url: "updateRecommendDown",
				type: "get",
				data: { 
						questionNum: ${ question.questionNum },
						replyNum: replyNum,
						userNum: userNum
					  },
				success: function (sucess) {
					getMAxScoreReply();
					questionReplyList();
				}
			})
		}
		
		
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div class="panel-pop" id="jeonsw">
		<div class="form-style form-style-3" id="recommendWindow">
				<span class="star-input">
				  <span class="input">
				    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
				    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
				    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
				    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
				    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
				    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
				    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
				    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
				    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
				    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
				  </span>
				  <output for="star-input"><b id="replyScore">0</b>점</output>
				</span>
			<button class="button color small submit" style="float: right;" onclick="registReplyScore()">선택하기</button>
			<button class="button color small submit" style="float: right;" onclick="registReplyCancel()">취소</button>
		</div>
	</div>
	<div class="breadcrumbs" id="sectionBack">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="pageName">質問内容</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">質問内容</span>
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
						<a href="single_question.html" class="qTitle">${ question.title }</a>
					</h2>
					<!-- <a class="question-report" href="#">Report</a>
					<div class="question-type-main"><i class="icon-question-sign"></i>Question</div> -->
					<div class="question-inner">
						<div class="clearfix"></div>
						<div class="question-desc">
							<c:if test="${ question.videoSrc ne null }">
								<video id="my-video" class="video-js" controls data-setup='{}'>
									<source src="${ question.videoSrc }" type="video/webm"></source>
								</video>
							</c:if>
							<p>${ question.questionContent }</p>
						</div>
						<div class="question-details">
						<c:if test="${ question.qstatus eq solved }">
							<span class="question-answered question-answered-done"><i class="icon-ok"></i>${ question.qstatus }</span>
						</c:if>
						<c:if test="${ question.qstatus ne solved }">
							<span class="question-answered"><i class="icon-ok"></i>${ question.qstatus }</span>
						</c:if>
							<span class="question-favorite"><i class="icon-star"></i>${ question.point }</span>
						</div>
						<span class="question-category"><a href="#"><i class="icon-folder-close"></i>${ minor.minorName }</a></span>
						<span class="question-date"><i class="icon-time"></i>${ checkTimeResult } ago</span>
						<span class="question-comment"><a href="#"><i class="icon-comment"></i><span id="answerCount"></span> Answer</a></span>
						<%-- <span class="question-view"><i class="icon-user"></i>${ question.hit } views</span> --%>
						<%-- <span class="single-question-vote-result">${ question.score }</span> --%>
						<ul class="single-question-vote">
							<!-- <li><a href="#" class="single-question-vote-down" title="Dislike"><i class="icon-thumbs-down"></i></a></li>
							<li><a href="#" class="single-question-vote-up" title="Like"><i class="icon-thumbs-up"></i></a></li> -->
							<c:if test="${ user.id == sessionScope.userId && question.qstatus ne solved && question.replyCount == 0}">
								<form method="get" action="modifyQuestion">
									<input type="submit" class="button color small submit" value="修正する" style="float: right;">
									<input type="hidden" name="questionNum" value="${ question.questionNum }">
								</form>
								<form method="get" action="deleteQuestion">
									<input type="submit" class="button color small submit" value="削除する" style="float: right;">
									<input type="hidden" name="questionNum" value="${ question.questionNum }">
								</form>
							</c:if>
						</ul>
						<div class="clearfix"></div>
					</div>
				</article>
				<div class="share-tags page-content">
					<div class="question-tags"><i class="icon-tags"></i>
						<c:forEach var="tag" items="${ tagList }">
							<a href="search?from=1&to=10&searchType=tag&search=${tag.tag}">${ tag.tag }</a>&nbsp;&nbsp;
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
					<!-- <div class="share-inside"><i class="icon-share-alt"></i>Share</div> -->
					<div class="clearfix"></div>
				</div><!-- End share-tags -->
				<div class="about-author clearfix" id="selectedReplyDiv">
					<div class="author-bio" id="selectedReply"></div>
				</div>
				<div class="about-author clearfix" id="bestReplyDiv">
				   <!--  <div class="author-image">
				    	<a href="#" original-title="admin" class="tooltip-n"><img alt="" src="http://placehold.it/60x60/FFF/444"></a>
				    </div> -->
				    <div class="author-bio" id="bestReply"></div>
				</div><!-- End about-author -->
						<c:if test="${ question.selectedReplyNum >= 0 }">
							<div id="related-posts">
								<table style="margin: auto;">
									<tr>
										<c:if test="${ sessionScope.userId != user.id and sessionScope.userId ne null}">
											<h2>答える</h2>
											<textarea rows="" cols="" id="replyContent"></textarea>
										</c:if>
									<tr>
										<c:if test="${ sessionScope.userId != user.id and sessionScope.userId ne null}">
											<td>
												<button class="button color small submit" onclick="registReply()">登録</button>
											</td>
										</c:if>
										<c:if test="${ sessionScope.userId != null }">
											<td>
												<form method="post" action="realTimeAnswer">
													<input type="submit" class="button color small submit" value="リアルタイムーアンサー">
													<input type="hidden" name="questionNum" value="${ question.questionNum }">
												</form>
											</td>
										</c:if>
										<c:if test="${ sessionScope.userId != user.id }">
											<td>
												<form method="post" action="videoAnswer">
													<input type="submit" class="button color small submit" value="動画でアンサー">
													<input type="hidden" name="questionNum" value="${ question.questionNum }">
												</form>
											</td>
										</c:if>
									</tr>
								</table>
							</div><!-- End related-posts -->
						</c:if>
				
				<!-- 답글부분 -->
				<div id="commentlist" class="page-content">
				</div><!-- End page-content -->
				
				<!-- <div id="respond" class="comment-respond page-content clearfix"></div> -->
				
				<div class="post-next-prev clearfix">
				    <p class="prev-post">
				    <c:if test="${ PREQUESTIONNUM != 0 }">
				        <a href="question_view?questionNum=${ PREQUESTIONNUM }"><i class="icon-double-angle-left"></i>&nbsp;Prev question</a>
				    </c:if>
				    </p>
				    <p class="next-post">
				    <c:if test="${ NEXTQUESTIONNUM != 0 }">
				        <a href="question_view?questionNum=${ NEXTQUESTIONNUM }">Next question&nbsp;<i class="icon-double-angle-right"></i></a>                                
				    </c:if>
				    </p>
				</div><!-- End post-next-prev -->	
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
<script src="./resources/js/star.js"></script>
<!-- <script src="./resources/js/custom.js"></script> -->
<!-- End js -->
	
	
</body>
</html>
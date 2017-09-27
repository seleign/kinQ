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
	<link rel="stylesheet" href="./resources/css/style.css?version=20170925"> 
	
	<!-- Skins --> 
	<link rel="stylesheet" href="./resources/css/purple.css?version=20170925">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css?version=20170925">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script src="./resources/js/dateFormat.min.js"></script>
  	<script type="text/javascript">
	
  	function questionView(questionNum) {
  		var questionview = document.questionview;
  		questionview.questionNum.value=questionNum ;
  		questionview.submit();
	}
  	
	function recentQlist(){
		$.ajax({
			url: 'searchRecentPost',
			method: 'post',
			data: {
				from: parseInt($('#rFrom').val()),
				to: parseInt($('#rTo').val())
				
			},
			success: function(result){
				var html = '';
				var page = result['page'];
				var qList = result['qList'];
				
				if( qList.length >0) {
					$.each(qList, function(index, element){
						if(element.timeCheck == -1){
							html +='<article class="question question-type-normal" id="q_urgent">';
						}else{
							html +='<article class="question question-type-normal">';
						}
						html += '<h2><a href=\"#\" onclick=\"questionView(' + element.questionNum + ')\">'+element.title+'</a></h2>';
						html += '<a class="question-report">Report</a>';
						html += '<div class="question-inner"><div class="clearfix"></div>';
						html += '<p class="question-desc">'+element.questionContent+'</p>';
						html += '<div class="question-details">';
						if(element.qstatus == "solved"){
							html += '<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>';
						}else{
							html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
						}
						html += '<span class="question-favorite"><i class="icon-star"></i>'+element.point+'</span></div>';
	 					html += '<span class="question-date"><i class="icon-time"></i>'+ DateFormat.format.prettyDate( element.regDate)+'</span>';
						html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.replyCount+'</a></span>';
						html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
						html += '<div class="clearfix"></div>';
						html += '</div></article>';
					});
					$('#QuestionList_tap').append(html);
					$('#rFrom').val( page.from +10);
					$('#rTo').val( page.to +10);
				}else {
					$('#QuestionList_tap').html('検索結果がありません。');
				}
			}
		});
	}
	
	function urgentQlist(){
		$.ajax({
			url: 'searchUrgentPost',
			method: 'post',
			data: {
				from: parseInt($('#uFrom').val()),
				to: parseInt($('#uTo').val())
				
			},
			success: function(result){
				var html = '';
				var page = result['page'];
				var qList = result['qList'];
				
				if( qList.length >0) {
					$.each(qList, function(index, element){
						if(element.timeCheck == -1){
							html +='<article class="question question-type-normal" id="q_urgent">';
						}else{
							html +='<article class="question question-type-normal">';
						}
						html += '<h2><a href=\"#\" onclick=\"questionView(' + element.questionNum + ')\">'+element.title+'</a></h2>';
						html += '<a class="question-report">Report</a>';
						html += '<div class="question-inner"><div class="clearfix"></div>';
						html += '<p class="question-desc">'+element.questionContent+'</p>';
						html += '<div class="question-details">';
						if(element.qstatus == "solved"){
							html += '<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>';
						}else{
							html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
						}
						html += '<span class="question-favorite"><i class="icon-star"></i>'+element.score+'</span></div>';
	 					html += '<span class="question-date"><i class="icon-time"></i>'+ DateFormat.format.prettyDate( element.regDate)+'</span>';
						html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.replyCount+'</a></span>';
						html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
						html += '<div class="clearfix"></div>';
						html += '</div></article>';
					});
					$('#QuestionList_tap_urgent').append(html);
					$('#uFrom').val( page.from +10);
					$('#uTo').val( page.to +10);
				}else {
					$('#QuestionList_tap_urgent').html('検索結果がありません。');
				}
			}
		});
	}
	
	function progressQlist(){
		$.ajax({
			url: 'searchInProgressPost',
			method: 'post',
			data: {
				from: parseInt($('#pFrom').val()),
				to: parseInt($('#pTo').val())
				
			},
			success: function(result){
				var html = '';
				var page = result['page'];
				var qList = result['qList'];
				
				if( qList.length >0) {
					$.each(qList, function(index, element){
						if(element.timeCheck == -1){
							html +='<article class="question question-type-normal" id="q_urgent">';
						}else{
							html +='<article class="question question-type-normal">';
						}
						html += '<h2><a href=\"#\" onclick=\"questionView(' + element.questionNum + ')\">'+element.title+'</a></h2>';
						html += '<a class="question-report">Report</a>';
						html += '<div class="question-inner"><div class="clearfix"></div>';
						html += '<p class="question-desc">'+element.questionContent+'</p>';
						html += '<div class="question-details">';
						if(element.qstatus == "solved"){
							html += '<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>';
						}else{
							html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
						}
						html += '<span class="question-favorite"><i class="icon-star"></i>'+element.score+'</span></div>';
	 					html += '<span class="question-date"><i class="icon-time"></i>'+ DateFormat.format.prettyDate( element.regDate)+'</span>';
						html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.replyCount+'</a></span>';
						html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
						html += '<div class="clearfix"></div>';
						html += '</div></article>';
					});
					$('#QuestionList_tap_progress').append(html);
					$('#pFrom').val( page.from +10);
					$('#pTo').val( page.to +10);
				}else {
					$('#QuestionList_tap_progress').html('検索結果がありません。');
				}
			}
		});
	}
	
	$(function(){
		recentQlist();
		urgentQlist();
		progressQlist();
	});
	
	
	

/* 	var startpage = 0;
	var endpage = 10;
	var urgentStartpage = 0;
	var urgentEndpage = 10;
	var progressStartpage = 0;
	var progressEndpage = 10;
	
	function userlist(){
		$.ajax({
			url: 'getQuestionPage',
			method: 'get',
			data: {startpage:startpage, endpage:endpage},
			success: function(result){
				var html = '';
				$.each(result, function(index, element){
					if(element.timeCheck == -1){
						html +='<article class="question question-type-normal" id="q_urgent">';
					}else{
						html +='<article class="question question-type-normal">';
					}
					html += '<h2><a href="question_view?questionNum='+element.questionNum+'">'+element.title+'</a></h2>';
					html += '<a class="button question-report">Report</a>';
					html += '<div class="question-inner"><div class="clearfix"></div>';
					html += '<p class="question-desc">'+element.questionContent+'</p>';
					html += '<div class="question-details">';
					if(element.qstatus == "solved"){
						html += '<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>';
					}else{
						html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
					}
					html += '<span class="question-favorite"><i class="icon-star"></i>'+element.score+'</span></div>';
					html += '<span class="question-date"><i class="icon-time"></i>'+element.limit+'</span>';
					html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.allReply+'</a></span>';
					html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
					html += '<div class="clearfix"></div>';
					html += '</div></article>';
				});
					$('#QuestionList_tap').append(html);
			}
		});
		startpage = startpage+10;
		endpage = endpage+10;
	}
	
	function urgentUserlist(){
		$.ajax({
			url: 'getQuestionPage',
			method: 'get',
			data: {startpage:urgentStartpage, endpage:urgentEndpage},
			success: function(result){
				var html = '';
				$.each(result, function(index, element){
					if(element.timeLimit){
						if(element.timeCheck == -1){
							html +='<article class="question question-type-normal" id="q_urgent">';
						}else{
							html +='<article class="question question-type-normal">';
						}
					html += '<h2><a href="question_view?questionNum='+element.questionNum+'">'+element.title+'</a></h2>';
					html += '<a class="question-report" href="javascript:void(0)" onclick="location.href=\'reportPage?reportedQNum='+element.questionNum+'\'">Report</a>';
					html += '<div class="question-inner"><div class="clearfix"></div>';
					html += '<p class="question-desc">'+element.questionContent+'</p>';
					html += '<div class="question-details">';
					if(element.qstatus == "solved"){
						html += '<span class="question-answered question-answered-done"><i class="icon-ok"></i>solved</span>';
					}else{
						html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
					}
					html += '<span class="question-favorite"><i class="icon-star"></i>'+element.score+'</span></div>';
					html += '<span class="question-date"><i class="icon-time"></i>'+element.Limit+'</span>';
					html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.AllReply+'</a></span>';
					html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
					html += '<div class="clearfix"></div>';
					html += '</div></article>';
					}
				});
					$('#QuestionList_tap_urgent').append(html);
			}
		});
		urgentStartpage = urgentStartpage+10;
		urgentEndpage = urgentEndpage+10;
	}
	
	function progressUserlist(){
		$.ajax({
			url: 'getQuestionPage',
			method: 'get',
			data: {startpage:progressStartpage, endpage:progressEndpage},
			success: function(result){
				var html = '';
				$.each(result, function(index, element){
					if(element.qstatus == "in progress"){
						if(element.timeCheck == -1){
							html +='<article class="question question-type-normal" id="q_urgent">';
						}else{
							html +='<article class="question question-type-normal">';
						}
					html += '<h2><a href="question_view?questionNum='+element.questionNum+'">'+element.title+'</a></h2>';
					html += '<a class="question-report" href="javascript:void(0)" onclick="location.href=\'reportPage?reportedQNum='+element.questionNum+'\'">Report</a>';
					html += '<div class="question-inner"><div class="clearfix"></div>';
					html += '<p class="question-desc">'+element.questionContent+'</p>';
					html += '<div class="question-details">';
					html += '<span class="question-answered"><i class="icon-ok"></i>in progress</span>';
					html += '<span class="question-favorite"><i class="icon-star"></i>'+element.score+'</span></div>';
					html += '<span class="question-date"><i class="icon-time"></i>'+element.Limit+'</span>';
					html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.AllReply+'</a></span>';
					html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
					html += '<div class="clearfix"></div>';
					html += '</div></article>';
					}
				});
					$('#QuestionList_tap_progress').append(html);
			}
		});
		progressStartpage = progressStartpage+10;
		progressEndpage = progressEndpage+10;
	}
	
	$(function(){

		userlist();
		urgentUserlist();
		progressUserlist();
	});
 */	
 $(function(){

	 function scroller() {

	   var scroll = $('div.scroll');// Sets the div with a class of scroll as a variable
	   
	   var height = scroll.height(); // Gets the height of the scroll div
	   
	   var topAdj = -height-30; /* '-height' turns the height                   of the UL into a negative #, 
	                * '- 50' subtracts an extra 50 pixels from the height of 
	         			 * the div so that it moves the trail of the UL higher to 
	 							 * the top of the div before the animation                ends
	 							 */
	 	
	 	scroll.animate({
	 		'top' : [topAdj, 'linear'] 
	 	}, 20000, function(){
	 		scroll.css('top', 80); //resets the top position of the Ul for the next cycle
	 		scroller(); // Recalls the animation cycle to begin.
	 	});}
	 	
	 scroller();

	 });
 
 </script>
  
  <style type="text/css">
  	.box {
  	color: black;
 	margin: 3em auto;
	padding: 2em; 
	width: 100%;
	height: 3em;
	position: relative;
	overflow: hidden;
 	top: 1em;
/* 	background-color: light-grey; */
/* 	box-shadow: 7px 5px 4px rgba(0,0,0,0.5); */
/* 	border: 1px solid black;
	border-radius: 2px; */
}

.scroll {
	position: absolute;
	}
	
	
  </style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<form name="questionview" action="question_view" method="post">
		<input type="hidden" name="questionNum" value="">
	</form>
	
	<div class="panel-pop" id="report_panel">
	<h2>Report<i class="icon-remove"></i></h2>
	<div class="form-style form-style-3">
	<div class="form-inputs clearfix">
		<p>
		<label for="reportTitle">タイトル：　</label>
		<input type="text" name="reportTitle" id="reportTitle">
		</p>
		<p>
 		<label for="reporterNum">書き手：　</label>${sessionScope.userId}
 		<input type="hidden" value="${sessionScope.userNum}" name="reporterNum" id="reporterNum">
 		</p>
 	<hr>
 		<p>
		<lable for="reportedQNum">申告対象：　</lable>
		${reportedQNum }<input type="hidden" value="${reportedQNum }" name="reportedQNum">
		</p>
	<hr>
		<p>
		<label for="reportReason">申告事由</label><br>
		<input type="radio" name="reportReason" value="不適切な広告" checked="checked">不適切な広告
		<input type="radio" name="reportReason" value="青少年に不適切な掲示物">青少年に不適切な掲示物
		<input type="radio" name="reportReason" value="無意味な掲示物">無意味な掲示物
		<input type="radio" name="reportReason" value="その他">その他
		</p>
	<hr>
	</div>
		<p>	
		<input type="button" id="report_input" class="button color small submit" value="報告" >
		<input type="button" class="button color small submit" value="キャンセル" onclick="history.go(-1)">
		</p>
	</div>
	</div><!-- End signup -->
	<div class="section-warp ask-me" id="askme_back">
		<div class="container clearfix">
			<div class="box_icon box_warp box_no_border box_no_background" box_border="transparent" box_background="transparent" box_color="#FFF">
				<div class="row">
					<div class="col-md-3">
						<h2>なんでも質問して!</h2>
						<p>一日にも、多くの情報を接して数多くの質問を接するあなたに最も最適化されたサイト!今、早速質問して返事して知識を共有してください</p>
						
								<div class="box">
								<div class="scroll">
									<ul>
										<c:forEach var="title" items= "${titleList }">
											<li><strong>${title}</strong></li><br>
										</c:forEach>
									</ul>
								</div>
							</div>
						
						<div class="clearfix"></div>
					</div>
					<div class="col-md-9">
						<form class="form-style form-style-2">
							<p>
								<textarea rows="4" id="question_title" onfocus="if(this.value=='今,あなたが一番知りたいことは何ですか?')this.value='';" onblur="if(this.value=='')this.value='今,あなたが一番知りたいことは何ですか?';">今あなたが一番知りたいことは何ですか?</textarea>
								<i class="icon-pencil"></i>
								<span class="color button small publish-question">質問</span>
							</p>
						</form>
							
					</div>
				</div><!-- End row -->
			</div><!-- End box_icon -->
		</div><!-- End container -->
	</div><!-- End section-warp -->
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				
				<div class="tabs-warp question-tab">
		            <ul class="tabs">
		                <li class="tab"><a href="#" class="current">Recent Questions</a></li>
		                <li class="tab"><a href="#">緊急</a></li>
		                <li class="tab"><a href="#">in progress</a></li>
		            </ul>
		            <div class="tab-inner-warp">
						<input type="hidden" id="rFrom" value="1">
						<input type="hidden" id="rTo" value="10">
						<div class="tab-inner" id="QuestionList_tap">
					    </div>
							<button class="button large gray-button" id="QuestionList_button" onclick="javascript:recentQlist()"><i class="icon-refresh"></i>Load More Questions</button>
					</div>
					<div class="tab-inner-warp">
						<input type="hidden" id="uFrom" value="1">
						<input type="hidden" id="uTo" value="10">
						<div class="tab-inner" id="QuestionList_tap_urgent">
					    </div>
					    <button class="button large gray-button" id="QuestionList_button" onclick="javascript:urgentQlist()"><i class="icon-refresh"></i>Load More Questions</button>
					</div>
					<div class="tab-inner-warp">
						<input type="hidden" id="pFrom" value="1">
						<input type="hidden" id="pTo" value="10">
						<div class="tab-inner" id="QuestionList_tap_progress">
					    </div>
					    <button class="button large gray-button" id="QuestionList_button" onclick="javascript:progressQlist()"><i class="icon-refresh"></i>Load More Questions</button>
					</div>
		        </div><!-- End page-content -->
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
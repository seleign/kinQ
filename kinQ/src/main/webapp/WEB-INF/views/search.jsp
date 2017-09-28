<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib	prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="./resources/js/dateFormat.min.js"></script>
  <script type="text/javascript">
 
  function questionView(questionNum) {
		var questionview = document.questionview;
		questionview.questionNum.value=questionNum ;
		questionview.submit();
	}	
  
	function resultList(){
		$.ajax({
			url: 'search',
			method: 'post',
			data: {
				search: $('#search').val(),
				searchType: $('#searchType').val(),
				from: parseInt($('#from').val()),
				to: parseInt($('#to').val())
				
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
//						html += '<a class="question-report" href="javascript:void(0)" onclick="location.href=\'reportPage?reportedQNum='+element.questionNum+'\'">Report</a>';
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
					$('#resultArea').append(html);
					$('#rFrom').val( page.from +10);
					$('#rTo').val( page.to +10);
				}else {
					$('#resultArea').html('検索結果がありません。');
				}
			}
		});
	}
	$(function(){
		resultList();
	});
  </script>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
		
	<form name="questionview" action="question_view" method="post">
		<input type="hidden" name="questionNum" value="">
	</form>	
		
	<div class="breadcrumbs" id="sectionBack">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>検索結果</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">検索結果</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				<input type="hidden" id="search" value="${page.search}">
				<input type="hidden" id="searchType" value="${page.searchType}">
				<input type="hidden" id="from" value="${page.from}">
				<input type="hidden" id="to" value="${page.to}">
				<div id="resultArea"></div>
				<a href="javascript:resultList()" class="load-questions"><i class="icon-refresh"></i>Load More Questions</a>
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
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
   	.pageName {
   		font-family: "Rounded Mplus 1c";
   	}
   	.current{
   		font-family: "Rounded Mplus 1c";
   	}
   	#update_button {
   		font-family: "Rounded Mplus 1c";
   	}
   </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="./resources/js/dateFormat.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawPostChart);
    function drawPostChart() {
      var data = google.visualization.arrayToDataTable([
        ["項目", "数", { role: "style" } ],
        ["質問数", ${questionsNum}, "skyblue"],
        ["答えのある質問", ${completedQuestions }, "gold"],
        ["回答数", ${answersNum }, "silver"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        width: 500,
        height: 300,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  	}
    

    google.charts.setOnLoadCallback(drawAnswerChart);
    function drawAnswerChart() {
    	
        var data = google.visualization.arrayToDataTable([
          ['Field', 'Answers per Field'],
          [ '${answeredField[0].majorName}',	${answeredField[0].majorNum}],
          [ '${answeredField[1].majorName}',	${answeredField[1].majorNum}],
          [ '${answeredField[2].majorName}',	${answeredField[2].majorNum}],
          [ '${answeredField[3].majorName}',	${answeredField[3].majorNum}],
          [ '${answeredField[4].majorName}',	${answeredField[4].majorNum}],
          [ '${answeredField[5].majorName}',	${answeredField[5].majorNum}],
          [ '${answeredField[6].majorName}',	${answeredField[6].majorNum}],
          [ '${answeredField[7].majorName}',	${answeredField[7].majorNum}],
          [ '${answeredField[8].majorName}',	${answeredField[8].majorNum}],
          [ '${answeredField[9].majorName}',	${answeredField[9].majorNum}]
          	
        ]);

        var options = {
          title: '活動分野'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    
    function showQuestionView( questionNum) {
    	
    }

	function myQuestionList(){
		$.ajax({
			url: 'myQuestionList',
			method: 'post',
			data: {
				search: $('#qsearch').val(),
				searchType: $('#qsearchType').val(),
				from: parseInt($('#qfrom').val()),
				to: parseInt($('#qto').val())
				
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
						html += '<h2><a href="#" onclick="questionView(' + element.questionNum + ')">'+element.title+'</a></h2>';
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
	 					html += '<span class="question-date"><i class="icon-time"></i>'+ DateFormat.format.prettyDate( element.regDate)+'</span>';
						html += '<span class="question-comment"><a href="#"><i class="icon-comment"></i>'+element.replyCount+'</a></span>';
						html += '<span class="question-view"><i class="icon-user"></i>'+element.hit+'</span>';
						html += '<div class="clearfix"></div>';
						html += '</div></article>';
					});
					$('#myQuestionArea').append(html);
					$('#rFrom').val( page.from +10);
					$('#rTo').val( page.to +10);
				}else {
					$('#myQuestionArea').html('検索結果がありません。');
				}
			}
		});
	}
	function myAnswerList(){
		$.ajax({
			url: 'myAnswerList',
			method: 'post',
			data: {
				search: $('#rsearch').val(),
				searchType: $('#rsearchType').val(),
				from: parseInt($('#rfrom').val()),
				to: parseInt($('#rto').val())
				
			},
			success: function(result){
				var html = '';
				var page = result['page'];
					var rList = result['rList'];
				
				$.each(rList, function(index, element){
					html += "<li class=\"comment\">";
					html += "<div class=\"comment-body comment-body-answered clearfix\">";
					/* html += "<div class=\"avatar\"><img alt=\"\" src=\"http://placehold.it/60x60/FFF/444\"></div>" */
					html += "<div class=\"comment-text\">";
					html += "<div class=\"author clearfix\">";
					html += "<div class=\"comment-author\"><a href=\"#\">" + element.id + "</a></div>";
					html += "<div class=\"comment-vote\">";
					html += "<ul class=\"question-vote\">";
					html += "<li><a href=\"#\" class=\"question-vote-up\" title=\"Like\"></a></li>";
					html += "<li><a href=\"#\" class=\"question-vote-down\" title=\"Dislike\"></a></li>";
					html += "</ul>";
					html += "</div>";
					if (element.score > 0) {
						html += "<span class=\"question-vote-result\" style=\"color:green; font-weight:bold; margin-top: 5px;\">" + element.score + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
					} else if (element.score < 0){
						html += "<span class=\"question-vote-result\" style=\"color:red; font-weight:bold; margin-top: 5px;\">" + element.score*(-1) + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
					} else {
						html += "<span class=\"question-vote-result\" style=\"font-weight:bold; margin-top: 5px;\">" + element.score + "</span>";//추천을 어떻게 받아서 계산할지 정해야됨
					}
					html += "<div class=\"comment-meta\">";
					html += "<div class=\"date\"><i class=\"icon-time\"></i>" + element.r_RegDate + "</div>" ;
					html += "</div>";
					if (${userNum} == element.userNum) {
						html += "<a class=\"comment-reply\" href=\"javascript:deleteReply(" + element.replyNum + ")\"><i class=\"icon-reply\"></i>삭제</a>" ;
					}
					html += "</div>";
					html += "<div class=\"text\">";
					html += "<p>" + element.replyContent + "</p>";
					html += "</div>";
					html += "</div>";
					html += "</div>";
					html += "</li>";
				});
				$('#myAnswerArea').append(html);
				$('#rfrom').val( page.from +10);
				$('#rto').val( page.to +10);
			}
		});
	}
	$(function(){
		myQuestionList();
		myAnswerList();
	});
  </script>
  
  
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div class="breadcrumbs" id="sectionBack">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="pageName">マイページ</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">Mypage</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<div class="panel-pop" id="updateUser">
	<h2>個人情報修正<i class="icon-remove"></i></h2>
		<iframe src="updateUserInfo" class=signupIframe></iframe>
	</div>
	
	<section class="container main-content">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="user-profile">
						<div class="col-md-12">
							<div class="page-content">
								<h2 class="pageName">活動現況</h2>
								<div class="ul_list ul_list-icon-ok about-user" style="float:left; padding-left:7%; padding-top: 4%; width: 30%;">
									<ul class="pageName">
										<li><i class="icon-user"></i>ID : <span><strong>${sessionScope.userId }</strong></span></li>
										<li><i class="icon-star-empty"></i>ランキング : <span><strong>${myRank.ranking}</strong></span>&nbsp;位</li>
										<li><i class="icon-star"></i>ポイント : <span><strong>${pChange }</strong></span>&nbsp;ポイント</li>
										<li><i class="icon-credit-card"></i>キャッシュ : <span><strong>${cChange }</strong></span>&nbsp;円</li>
								</ul>
								</div>
							    <div id="piechart" style="float: left; width: 60%;"></div>
								<br><hr><br><input type="button" id="update_button" class="button color small login-submit submit" value="個人情報修正">
							</div><!-- End page-content -->
						</div><!-- End col-md-12 -->
						<div class="col-md-12">
							<div class="page-content page-content-user-profile">
								<div class="user-profile-widget">
									<h2 class="pageName">質問・答え</h2>
	
											<div class="ul_list ul_list-icon-ok" id="leftsideContent" style="float: left; width: 40%; padding-top: 12%; padding-left: 6%;">
											<table class="dashboard-activity-table">
												<tbody id="tableBody">
													<tr>
														<td colspan="3">&nbsp;</td>
													</tr>
													<tr>
														<th class="text-center">
														<span class="icon-list-style">
														&nbsp;&nbsp;<i class="icon-question-sign"></i>質問数
														</span>
														</th>
														<th class="text-center">
														<span class="icon-list-style">
														&nbsp;&nbsp;<i class="icon-spinner"></i>答えのある質問
														</span>
														</th>
														<th class="text-center">
														<span class="icon-list-style">
														&nbsp;&nbsp;<i class="icon-lightbulb"></i>回答数
														</span>
														</th>
													</tr>
													<tr>
														<td class="text-center right-border font-skyblue">${questionsNum }</td>
														<td class="text-center right-border font-gold">${completedQuestions }</td>
														<td class="text-center font-silver">${answersNum }</td>
													</tr>
													<tr>
														<td colspan="3">&nbsp;</td>
													</tr>
												</tbody>
											</table>
									</div>
									<div id="columnchart_values" style="width: 900px; height: 300px; float: left; width: 40%;" id="rightsideContent"></div>
								</div><!-- End user-profile-widget -->
							</div><!-- End page-content -->
						</div><!-- End col-md-12 -->
					</div><!-- End user-profile -->
				</div><!-- End row -->
				<div class="clearfix"></div>
				<div class="tabs-warp question-tab">
					<ul class="tabs">
						<li class="tab"><a href="#" class="current">私の質問</a></li>
						<li class="tab"><a href="#">私の答え</a></li>
					</ul>
					<div class="tab-inner-warp">
						<div id="myQuestion" class="tab-inner">
							<input type="hidden" id="qsearch" value="${userName}">
							<input type="hidden" id="qsearchType" value="author">
							<input type="hidden" id="qfrom" value="1">
							<input type="hidden" id="qto" value="5">
							<div id="myQuestionArea" class="mypage-tab-inner"></div>
							<a href="javascript:myQuestionList()" class="load-questions mypage-tab-inner"><i class="icon-refresh"></i>Load More Questions</a>
						</div>
					</div>
					<div class="tab-inner-warp">
						<div id="myAnswer" class="tab-inner">
							<input type="hidden" id="rsearch" value="${userName}">
							<input type="hidden" id="rsearchType" value="author">
							<input type="hidden" id="rfrom" value="1">
							<input type="hidden" id="rto" value="5">
							<div id="myAnswerArea" class="mypage-tab-inner"></div>
							<a href="javascript:myAnswerList()" class="load-questions mypage-tab-inner"><i class="icon-refresh"></i>Load More Questions</a>
						</div>
					</div>
				</div>
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
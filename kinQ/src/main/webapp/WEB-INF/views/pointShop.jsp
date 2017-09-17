<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>ポイントショップ</title>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<style type="text/css">
 	 	ul {
   			list-style:none;
    		margin:5px;
    		padding:5px;
		}

		li {
    		margin: 0 0 0 0;
    		padding: 0 0 0 0;
    		border : 0;
    		float: left;
		}
  	</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<div class="breadcrumbs">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Point Shop</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">ポイントショップ</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content page-left-sidebar">
					
		<div class="row">
		
		
			<div class="col-md-9">
				
				<div id="accordions" class="row">
					
					
						<div id="alert" class="row">
						<div class="col-md-12"><div class="boxedtitle page-title"><h2 class="t_left">ポイント管理</h2></div></div>
					<div class="col-md-12">
						<div class="page-content page-shortcode">
							<div class="alert-message success">
							    <i class="icon-ok"></i>
							    <p><span>マイポイント</span><br>
							    <strong>${sessionScope.userName }</strong> 様のポイントは<strong>_____ポイント</strong>です。</p>
							</div>
							
						    <div class="alert-message info">
						        <i class="icon-bullhorn"></i>
						        <p><span>ポイント交換</span><br>ポイントの交換政策は緊Ｑの約款をご参考ください。<br><br>
						        
							<div class="page-content page-shortcode">
							<div class="tabs-warp">
							    <ul class="tabs">
							        <li class="tab"><a href="#">ポイント両替</a></li>
							        <li class="tab"><a href="#">払い戻し</a></li>
							    </ul>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>※ <strong>1ポイント</strong>は<strong>1円</strong>に相当します。手数料は<strong>5パーセント</strong>です。
							       		<input type="button" value="両替"></p>
							        </div>
							    </div>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							    		<p>※ <strong>最近一週間</strong>チャージしたポイントに限って払い戻せます。
							       		<input type="button" value="払い戻し"></p>
							        </div>
							    </div>

							</div>
						</div><!-- End page-content -->
						</p>
						    </div>
						    <div class="alert-message warning">
						        <i class="icon-exclamation-sign"></i>
						        <p><span>ポイントチャージ</span><br>
						        ポイントで質問やショッピングが出来ます。
						        <input type="button" value="ポイントチャージ"></p>
						    </div>
						</div><!-- End page-content -->
					</div>
				</div><!-- End #alert -->


				</div><!-- End #accordions -->
				
				<div class="gap"></div>
				<div class="divider"><span></span></div>
				

				
				<div id="buttons" class="row t_center">
					
					<div class="col-md-12"><div class="boxedtitle page-title"><h2 class="t_left">ショッピングモール</h2></div></div>
					<div class="page-content page-shortcode">
						<c:forEach var="good" items="${goodsList }">
							<ul>
								<li>
									<img src="./resources/images/pointShopImg/${good.imageurl }">&nbsp;&nbsp;<br><br>
									商品名：　${good.goodsName}<br>
									値段：　${good.price}<br>
									<input type="button" value="マイカート">&nbsp;<input type="button" value="購入">
									<br><br><br>
							</ul>
						
						</c:forEach>

					
					</div>
					
					
					<div class="clearfix"></div>
					<div class="gap"></div>
					
				</div><!-- End #Buttons -->
				
				
				<div class="divider"><span></span></div>
	
				

			</div><!-- End main -->
			<aside class="col-md-3 sidebar">
				<div class="widget widget_menu widget_menu_jquery">
					<ul>
						<li class="current_page_item"><a href="#accordions"><i class="icon-reorder"></i>Accordions & Toggle & Taps</a></li>
						<div class="accordion">
						<li class="accordion-title"><a href="#alert"><i class="icon-bullhorn"></i>教育・学習</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">乳幼児教育</a></li>
								<li><a href="">小学校</a></li>
								<li><a href="">中学校</a></li>
								<li><a href="">高等学校</a></li>
								<li><a href="">大学</a></li>
								<li><a href="">留学</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#buttons"><i class="icon-link"></i>IT</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">コンピューター</a></li>
								<li><a href="">ハードウェア</a></li>
								<li><a href="">ソフトウェア</a></li>
								<li><a href="">OS</a></li>
								<li><a href="">プログラミング</a></li>
								<li><a href="">ウェブサイト</a></li>
								<li><a href="">インターネット</a></li>
								<li><a href="">通信ネットワーク</a></li>
								<li><a href="">放送通信</a></li>
								<li><a href="">保安</a></li>
								<li><a href="">IT資格試験</a></li>
								<li><a href="">アプリケーション</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#testimonial"><i class="icon-thumbs-up"></i>ゲーム</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">RPGゲーム</a></li>
								<li><a href="">シミュレーションゲーム</a></li>
								<li><a href="">シューティングゲーム</a></li>
								<li><a href="">アクションゲーム</a></li>
								<li><a href="">レーシングゲーム</a></li>
								<li><a href="">スポーツゲーム</a></li>
								<li><a href="">ボード・パズルゲーム</a></li>
								<li><a href="">モバゲー</a></li>
								<li><a href="">ビデオゲーム</a></li>
								<li><a href="">ゲーマー</a></li>
								<li><a href="">インディーズゲーム</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#audio"><i class="icon-music"></i>エンタテインメント</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">TV・ラジオ</a></li>
								<li><a href="">音楽</a></li>
								<li><a href="">映画</a></li>
								<li><a href="">アニメ</a></li>
								<li><a href="">漫画</a></li>
								<li><a href="">ビデオ・DVD</a></li>
								<li><a href="">演劇</a></li>
								<li><a href="">ミュージカル</a></li>
								<li><a href="">オペラ</a></li>
								<li><a href="">ダンス</a></li>
								<li><a href="">美術</a></li>
								<li><a href="">デザイン</a></li>
								<li><a href="">写真</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#dropcaps"><i class="icon-bold"></i>生活</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">飲食</a></li>
								<li><a href="">美容</a></li>
								<li><a href="">ファッション</a></li>
								<li><a href="">ペット</a></li>
								<li><a href="">インテリア</a></li>
								<li><a href="">車</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#blockquote"><i class="icon-quote-left"></i>健康</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">歯学</a></li>
								<li><a href="">薬学</a></li>
								<li><a href="">栄養学</a></li>
								<li><a href="">運動</a></li>
								<li><a href="">医療</a></li>
								<li><a href="">保険</a></li>
								<li><a href="">健康常識</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#icons"><i class="icon-star-empty"></i>社会・政治</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">行政</a></li>
								<li><a href="">法律</a></li>
								<li><a href="">国防</a></li>
								<li><a href="">外交</a></li>
								<li><a href="">選挙</a></li>
								<li><a href="">雇用・労働</a></li>
								<li><a href="">宗教</a></li>
								<li><a href="">福祉</a></li>
								<li><a href="">環境</a></li>
								<li><a href="">災害</a></li>
								<li><a href="">社会文化</a></li>
								<li><a href="">機関・団体・人物</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#contact"><i class="icon-envelope"></i>経済</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">金融</a></li>
								<li><a href="">不動産</a></li>
								<li><a href="">税務</a></li>
								<li><a href="">経営</a></li>
								<li><a href="">貿易</a></li>
								<li><a href="">就職</a></li>
								<li><a href="">創業</a></li>
								<li><a href="">経済制度</a></li>
								<li><a href="">経済動向</a></li>
								<li><a href="">経済団体</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#bullet"><i class="icon-list"></i>旅行</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">国内旅行</a></li>
								<li><a href="">海外旅行</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#progess"><i class="icon-tasks"></i>スポーツ</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">球技スポーツ</a></li>
								<li><a href="">陸上・水上スポーツ</a></li>
								<li><a href="">ウインタースポーツ</a></li>
								<li><a href="">武芸</a></li>
								<li><a href="">レジャー</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#slideShow"><i class="icon-picture"></i>SlideShow</a></li>
						<li><a href="#video"><i class="icon-film"></i>video</a></li>
						<li><a href="#columns"><i class="icon-table"></i>Columns</a></li>
						</div>
					</ul>
				</div><!-- End widget_menu -->
			</aside><!-- End sidebar -->
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
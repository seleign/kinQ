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
    <script type="text/javascript">
    	
    	var totalPrice = 0;
    	var goodsName = new Array();
    	var goodsNum = new Array();
    	var goodsPrice = new Array();
    	
    	function myCart(goods, price, num){
    		$('#good'+num).prop('disabled', true);
    		goodsName.push(goods);
    		goodsNum.push(num);
    		goodsPrice.push(price);
    		
    		totalPrice += price;
    		
			var html = '';
			
    		for(var i in goodsName){
    			html+= '<li value="num'+goodsNum[i]+'">'+goodsName[i]+'&nbsp;<a class="icon-remove" onclick="javascript:unchecking('+goodsNum[i]+', '+goodsPrice[i]+')"></a></li><br>';
    		}
    		$('#goodsList').html(html);
    		$('#totalPrice').html('&nbsp;&nbsp;&nbsp;'+totalPrice+'ポイント');
    	}
    	
    	
     	function unchecking(deleteNum, price){
    		html = '';
    		
    		for(var i=0;i<goodsNum.length;i++){
    			if(goodsNum[i]==deleteNum){
    				var index = goodsNum.indexOf(goodsNum[i]);
    				goodsName.splice(index, 1);
    				goodsNum.splice(index, 1);
    				goodsPrice.splice(index, 1);
    				
    				$('#good'+deleteNum).prop('disabled', false);
    				
    	    		for(var j in goodsName){
    	    			html+= '<li value="num'+goodsNum[j]+'">'+goodsName[j]+'&nbsp;<a class="icon-remove" onclick="javascript:unchecking('+goodsNum[j]+', '+goodsPrice[j]+')"></a></li><br>';
    	    		}
    	    		$('#goodsList').html(html);
    	    		
    	    		totalPrice -= price;
    			}
    		}
    		$('#totalPrice').html('&nbsp;&nbsp;&nbsp;'+totalPrice+'ポイント'); 
    	} 
    	
    	function cancel(){
    		$('input[type=button]').prop('disabled', false);
    		goodsName = [];
    		goodsNum = [];
			var html = '';
			
    		for(var i in goodsName){
				html+= '<li>'+goodsName[i]+'</li><br>';
    		}
    		$('#goodsList').html(html);
    		
    		totalPrice = 0;
    		$('#totalPrice').html('&nbsp;&nbsp;&nbsp;'+totalPrice+'ポイント'); 
    	}
    	
    	
    		function charge(){  
    		    		var selectVal = $('#chargeAmount').val();  
    		    		  
    		    		if(selectVal == 0){  
    	    			alert('チャージする金額をご選び下さい。');  
    	    			return false;  
    		    		}  
    	    		  
    		    		$('form').submit();  
    	    	}  

    	 
    </script>
    
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
							    <strong>${sessionScope.userName }</strong> 様のキャッシュは　<strong>${cChange}　円</strong>　です。</p><br><hr><br>
							    <p>※ <strong>キャッシュ1円</strong>は<strong>1ポイント</strong>に交換できます。&nbsp;
							    <input type="button" value="キャッシュ　→　ポイントに交換">
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
							       		<input type="button" value="ポイント　→　現金に両替"></p>
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
						</div>
						     <form action="charge" method="post" name="form"> 
						    <div class="alert-message warning">
						        <i class="icon-exclamation-sign"></i>
						        <span>ポイントチャージ</span><br>  
 						        ポイントで質問やショッピングが出来ます。<br><br><hr><br>  
 						        <select class="combo" id="chargeAmount" name="chargeAmount" style="float: left;">  
 						        	<option value="0">金額選択</option>  
 						        	<option value="1000">1000 Points</option>  
 						        	<option value="2000">2000 Points</option>  
 						        	<option value="3000">3000 Points</option>  
 						        	<option value="4000">4000 Points</option>  
 						        	<option value="5000">5000 Points</option>  
 						        </select>  
 						  		&nbsp;&nbsp;&nbsp;<input type="button" value="ポイントチャージ" onclick="javascript:charge()">  
						    </div>
						    </form> 
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
									<input type="button" value="マイカート" id="good${good.goodsNum }" onclick="javascript:myCart('${good.goodsName}', ${good.price}, ${good.goodsNum})">
									&nbsp;<input type="button" value="購入" >
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
				<div class="widget_q widget_menu_q widget_menu_jquery">
					<div style="background-color: white; padding: 5%">
						<h2>マイカート</h2><hr><br> 
							<strong>ショッピングリスト</strong><br><br><div><ul id="goodsList"></ul></div>
							<br><hr><br>
							<strong>総合</strong><br><div id="totalPrice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 ポイント</div><br> 
							<hr><br>
						<a href="javascript:void(0)" onclick="javascript:cancel()" class="button small gray-button custom-button" style="float: left; width: 50%; font-size: 80%">キャンセル</a>
						<a href="#" class="button small yellow-button custom-button" style="width: 43%; font-size: 80%;">購入する</a>
					</div>
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
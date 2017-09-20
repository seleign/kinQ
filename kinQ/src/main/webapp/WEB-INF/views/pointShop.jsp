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
        	
/*      	$(function() {
    		$("#exchangeBtn").on('click', cashToPoint);
    	});
    	 */
    	
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


     	function cashToPoint(change){
    		
    		if(confirm('キャッシュをポイントに交換しますか。')==true){
     			$.ajax({
    				url: 'cashToPoint',
    				method: 'POST',
    				data: {currentChange : change},
    				success: function(result){
    					$('#myCash').html(result[0]);
    					$('#myPoint').html(result[1]);	
    				}
    			}); 
    		}
    	}
     	
     	function pointToMoney(point){
     		
     		var bankAccount = $('#bankAccount').val();
			if(bankAccount=='' || isNaN(bankAccount)){
				alert('銀行の口座番号をご入力ください。');
				return false;
			}
			if(confirm('ポイントを現金に両替しますか。') == true){
				$.ajax({
    				url: 'pointToCash',
    				method: 'POST',
    				data: {currentPoint : point},
    				success: function(result){
    					$('#myPoint').html(result);	
    				}
    			}); 
			}
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
						<div class="col-md-12">
							<div class="boxedtitle page-title">
								<h2 class="t_left">ポイント管理</h2>
							</div>
						</div>
						<div class="col-md-12">
							<div class="page-content page-shortcode">
								<div class="alert-message success">
									<i class="icon-ok"></i>
									<p>
										<span>マイキャッシュ</span><br> 
										<strong>${sessionScope.userName }</strong>
										様のキャッシュは <strong><span id="myCash">${cChange}</span> 円</strong> です。
									</p>
									<br><hr><br>
									<p>
										※ <strong>キャッシュ1円</strong>は<strong>1ポイント</strong>に交換できます。&nbsp;
										<input type="button" onclick="javascript:cashToPoint('${cChange}')" value="キャッシュ　→　ポイントに交換">
											
								</div>

								<div class="alert-message info">
									<i class="icon-bullhorn"></i>
									<p>
										<span>ポイント交換</span><br>
										<strong>${sessionScope.userName }</strong>様のポイントは <strong><span id="myPoint">${pChange}</span> ポイント</strong> です。
										ポイントの交換政策は緊Ｑの約款をご参考ください。<br>
										<br>
									<div class="page-content page-shortcode">
										<div class="tabs-warp">
											<ul class="tabs">
												<li class="tab"><a href="#">ポイント両替</a></li>
												<li class="tab"><a href="#">払い戻し</a></li>
											</ul>
											<div class="tab-inner-warp">
												<div class="tab-inner">
													<p>
														※ <strong>1ポイント</strong>は<strong>1円</strong>に相当します。手数料は<strong>5パーセント</strong>です。
										<br><br><hr><br>
										<div style="float: left;">
										<select id="chargeAmount" name="bankList" style="float: left;">
										<optgroup label="銀行選択"></optgroup>
										<optgroup label="都市銀行"></optgroup>
											<option>銀行選択</option>
											<option>みずほ銀行</option>
											<option>三菱東京UFJ銀行</option>
											<option>三井住友銀行</option>
											<option>りそな銀行</option>
											<option>埼玉りそな銀行</option>
										<optgroup label="北海道"></optgroup>
											<option>北海道銀行</option>
										<optgroup label="東北"></optgroup>
											<option>青森銀行</option>
											<option>みちのく銀行</option>
											<option>秋田銀行</option>
											<option>北都銀行</option>
											<option>荘内銀行</option>
											<option>山形銀行</option>
											<option>岩手銀行</option>
											<option>東北銀行</option>
											<option>七十七銀行</option>
											<option>東邦銀行</option>
										<optgroup label="関東甲信越"></optgroup>
											<option>群馬銀行</option>
											<option>足利銀行</option>
											<option>常陽銀行</option>
											<option>筑波銀行</option>
											<option>武蔵野銀行</option>
											<option>千葉銀行</option>
											<option>千葉興業銀行</option>
											<option>東京都民銀行</option>
											<option>横浜銀行</option>
											<option>第四銀行</option>
											<option>北越銀行</option>
											<option>山梨中央銀行</option>
											<option>八十二銀行</option>
										<optgroup label="北陸"></optgroup>
											<option>北陸銀行</option>
											<option>富山銀行</option>
											<option>北國銀行</option>
											<option>福井銀行</option>
										<optgroup label="東海"></optgroup>
											<option>静岡銀行</option>
											<option>スルガ銀行</option>
											<option>清水銀行</option>
											<option>大垣共立銀行</option>
											<option>十六銀行</option>
											<option>三重銀行</option>
											<option>百五銀行</option>
										<optgroup label="近畿"></optgroup>
											<option>滋賀銀行</option>
											<option>京都銀行</option>
											<option>近畿大阪銀行</option>
											<option>池田泉州銀行</option>
											<option>南都銀行</option>
											<option>紀陽銀行</option>
											<option>但馬銀行</option>
										<optgroup label="中国"></optgroup>
											<option>鳥取銀行</option>
											<option>山陰合同銀行</option>
											<option>中国銀行</option>
											<option>広島銀行</option>
											<option>山口銀行</option>
										<optgroup label="四国"></optgroup>
											<option>阿波銀行</option>
											<option>百十四銀行</option>
											<option>伊予銀行</option>
											<option>四国銀行</option>
										<optgroup label="九州・沖縄"></optgroup>
											<option>福岡銀行</option>
											<option>西日本シティ銀行</option>
											<option>筑邦銀行</option>
											<option>北九州銀行</option>
											<option>佐賀銀行</option>
											<option>十八銀行</option>
											<option>親和銀行</option>
											<option>肥後銀行</option>
											<option>大分銀行</option>
											<option>宮崎銀行</option>
											<option>鹿児島銀行</option>
											<option>琉球銀行</option>
											<option>沖縄銀行</option>
										</select> &nbsp;&nbsp;&nbsp;
										</div>
										<div style="text-align:right; display:inline-block;"><input type="text" id="bankAccount" placeholder="'-'なしの口座番号"></div>
										&nbsp;&nbsp;&nbsp;<input type="button" value="ポイント　→　現金に両替" onclick="javascript:pointToMoney(${pChange})"><br>
									</div>
								</div>
								<div class="tab-inner-warp">
									<div class="tab-inner">
										<p>
											※ <strong>最近一週間</strong>チャージしたポイントに限って払い戻せます。 <input type="button" value="払い戻し">
										</p>
									</div>
								</div>
							</div>
						</div>
									<!-- End page-content -->
					</div>
					<form action="charge" method="post" name="form">
									<div class="alert-message warning">
										<i class="icon-exclamation-sign"></i> <span>キャッシュチャージ</span><br>
										キャッシュはポイントに交換できます。質問やショッピングをする時、ポイントが使えます。<br>
										<br>
										<hr>
										<br> 
										<select class="combo" id="chargeAmount"
											name="chargeAmount" style="float: left;">
											<option value="0">金額選択</option>
											<option value="1000">1000 円</option>
											<option value="2000">2000 円</option>
											<option value="3000">3000 円</option>
											<option value="4000">4000 円</option>
											<option value="5000">5000 円</option>
										</select> &nbsp;&nbsp;&nbsp;<input type="button" value="ポイントチャージ" onclick="javascript:charge()">
									</div>
								</form>
							</div>
							<!-- End page-content -->
						</div>
					</div>
					<!-- End #alert -->


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
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
		$('input[name="hiddenTotalPrice"]').val(totalPrice);
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
    		goodsPrice = [];
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
     	
     	function cashToMoney(){
     		if(confirm('キャッシュを払い戻しますか。')==true){
     			$.ajax({
     				url: 'cashCheck',
     				method: 'POST',
     				data: {},
     				success: function(finalChange){
     					if(finalChange<=0){
     						alert('払い戻せるキャッシュがありません。');
     						return false;
     					}else{
     						
     			     		var bankAccount = $('#bankAccount2').val();
     						if(bankAccount=='' || isNaN(bankAccount)){
     							alert('銀行の口座番号をご入力ください。');
     							return false;
     						}else{
	     						$.ajax({
	     							url: 'cashToMoney',
	     							method: 'POST',
	     							data: {},
	     							success: function(finalChange){
	     								$('#myCash').html(finalChange);
	     							}
	     						});
     						}
     					}
     				}
     			});
     		}
     	}
     	
     	function pointToMoney(){
     		
     		var bankAccount = $('#bankAccount').val();
			if(bankAccount=='' || isNaN(bankAccount)){
				alert('銀行の口座番号をご入力ください。');
				return false;
			}
			if(confirm('ポイントを現金に両替しますか。') == true){
				$.ajax({
    				url: 'pointToCash',
    				method: 'POST',
    				data: {},  
    				success: function(result){
    					$('#myPoint').html(result);	
    				}
    			}); 
			}
     	}
     	
     	function orderGoods(){
     		var total = $('input[name="hiddenTotalPrice"]').val();
     		if(confirm('ポイントでカートのグッズを購入しますか。')==true){
     			
     			$.ajax({
     				url: 'pointCheck',
     				method: 'POST',
     				data: {},
     				success: function(finalP){
     					if(finalP>=total){
     						$.ajax({
			     				url: 'orderGoods',
			     				method: 'POST',
			     				data: {totalPrice : total},
			     				success: function(finalPChange){
			     					$('#myPoint').html(finalPChange);
			     		    		goodsName = [];
			     		    		goodsNum = [];
			     		    		goodsPrice = [];
			     		    		totalPrice = 0;
			     		    		$('input[type=button]').prop('disabled', false);
			     					$('#goodsList').html('');
			     					$('#totalPrice').html('&nbsp;&nbsp;&nbsp;'+totalPrice+' ポイント');
			     					$('input[name="hiddenTotalPrice"]').val(totalPrice);
			     					alert('購入完了');
			     				}
			     			});
     					}else{
     						alert('ポイントが不足します。');
	     		    		goodsName = [];
	     		    		goodsNum = [];
	     		    		goodsPrice = [];
	     		    		totalPrice = 0;
	     		    		$('input[name="hiddenTotalPrice"]').val(0);
	     		    		$('input[type=button]').prop('disabled', false);
     						return false;
     					}
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
		
		#cart{
			text-align:center;
			background-color: #ff6600;
			color: white;
			padding: 10%;
			border-radius: 20px;
		}

.pointShopBtn {
   border: 1px solid #ffffff;
   background: #ff830f;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffd1d1), to(#ff830f));
   background: -webkit-linear-gradient(top, #ffd1d1, #ff830f);
   background: -moz-linear-gradient(top, #ffd1d1, #ff830f);
   background: -ms-linear-gradient(top, #ffd1d1, #ff830f);
   background: -o-linear-gradient(top, #ffd1d1, #ff830f);
   background-image: -ms-linear-gradient(top, #ffd1d1 0%, #ff830f 100%);
   padding: 4.5px 9px;
   -webkit-border-radius: 12px;
   -moz-border-radius: 12px;
   border-radius: 12px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #ff6a14 0 1px 0;
   color: #ffffff;
   font-size: 15px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.pointShopBtn:hover {
   border: 1px solid #0a3c59;
   text-shadow: #32576e 0 1px 0;
   background: #030d14;
   background: -webkit-gradient(linear, left top, left bottom, from(#5b9cc7), to(#030d14));
   background: -webkit-linear-gradient(top, #5b9cc7, #030d14);
   background: -moz-linear-gradient(top, #5b9cc7, #030d14);
   background: -ms-linear-gradient(top, #5b9cc7, #030d14);
   background: -o-linear-gradient(top, #5b9cc7, #030d14);
   background-image: -ms-linear-gradient(top, #5b9cc7 0%, #030d14 100%);
   color: #fff;
   }
.pointShopBtn:active {
   text-shadow: #8ad2ff 0 1px 0;
   border: 1px solid #0a3c59;
   background: #062d47;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#030d14));
   background: -webkit-linear-gradient(top, #3e779d, #062d47);
   background: -moz-linear-gradient(top, #3e779d, #062d47);
   background: -ms-linear-gradient(top, #3e779d, #062d47);
   background: -o-linear-gradient(top, #3e779d, #062d47);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #062d47 100%);
   color: #fff;
   }


.psBtn {
   border: 1px solid #ffffff;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 6px 12px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #99cae8 0 1px 0;
   color: #5c4c4c;
   font-size: 14px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.psBtn:hover {
   border: 1px solid #ffffff;
   text-shadow: #f06897 0 1px 0;
   background: #f25c5c;
   background: -webkit-gradient(linear, left top, left bottom, from(#f58585), to(#f25c5c));
   background: -webkit-linear-gradient(top, #f58585, #f25c5c);
   background: -moz-linear-gradient(top, #f58585, #f25c5c);
   background: -ms-linear-gradient(top, #f58585, #f25c5c);
   background: -o-linear-gradient(top, #f58585, #f25c5c);
   background-image: -ms-linear-gradient(top, #f58585 0%, #f25c5c 100%);
   color: #fff;
   }
.psBtn:active {
   text-shadow: #e657a1 0 1px 0;
   border: 1px solid #ffffff;
   background: #d66565;
   background: -webkit-gradient(linear, left top, left bottom, from(#ff8f8f), to(#f25c5c));
   background: -webkit-linear-gradient(top, #ff8f8f, #d66565);
   background: -moz-linear-gradient(top, #ff8f8f, #d66565);
   background: -ms-linear-gradient(top, #ff8f8f, #d66565);
   background: -o-linear-gradient(top, #ff8f8f, #d66565);
   background-image: -ms-linear-gradient(top, #ff8f8f 0%, #d66565 100%);
   color: #fff;
   }
  	</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<section class="container main-content page-left-sidebar">
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
	
<c:choose>
<c:when test="${userId !=null}">
					
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
										<input type="button" onclick="javascript:cashToPoint('${cChange}')" class="psBtn" value="キャッシュ　→　ポイントに交換">
											
								</div>

								<div class="alert-message info">
									<i class="icon-bullhorn"></i>
									<p>
										<span>ポイント交換</span><br>
										<strong>${sessionScope.userName }</strong>様のポイントは <strong><span id="myPoint">${pChange}</span> ポイント</strong> です。
										<br>
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
														※ ポイントの交換政策は緊Ｑの約款をご参考ください。
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
										&nbsp;&nbsp;&nbsp;<input type="button" class="psBtn"  value="ポイント　→　現金に両替" onclick="javascript:pointToMoney()"><br>
									</div>
								</div>
								<div class="tab-inner-warp">
									<div class="tab-inner">
										<p>
										※ キャッシュの払い戻し政策は緊Ｑの約款をご参考ください。
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
										<div style="text-align:right; display:inline-block;"><input type="text" id="bankAccount2" placeholder="'-'なしの口座番号"></div>
										&nbsp;&nbsp;&nbsp; <input type="button" class="psBtn" value="払い戻し" onclick="javascript:cashToMoney()">
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
										</select> &nbsp;&nbsp;&nbsp;<input type="button" class="psBtn" value="ポイントチャージ" onclick="javascript:charge()">
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
									値段：　${good.price}&nbsp;ポイント<br><br>
									<input type="button" class="pointShopBtn" value="My Cart" id="good${good.goodsNum }" onclick="javascript:myCart('${good.goodsName}', ${good.price}, ${good.goodsNum})">
									<br><br><br><br>
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
					<div style="background-color: #fff9c4; border-radius: 20px; padding: 5%">
						<h2 id="cart">マイカート</h2><hr><br> 
							<h4 style="color: black;">ショッピングリスト</h4><div><ul id="goodsList"></ul></div>
							<br><hr><br>
							<h4 style="color: red;">総合</h4><div id="totalPrice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 ポイント</div><br> 
							<hr><br>
						<a href="javascript:void(0)" onclick="javascript:cancel()" class="button small gray-button custom-button" style="float: left; width: 50%; font-size: 80%; padding-left: 13%; border-radius: 5px;">キャンセル</a>
						<a href="javascript:void(0)" class="button small yellow-button custom-button" style="width: 43%; font-size: 80%; padding-left: 12%; border-radius: 5px;" onclick="javascript:orderGoods()"><input type="hidden" name="hiddenTotalPrice" value="">購入する</a>
					</div>
				</div><!-- End widget_menu -->
			</aside><!-- End sidebar -->

		</div><!-- End row -->
	</section><!-- End container -->
	
	<jsp:include page="footerPointShop.jsp" flush="false" />
<!-- </div>End wrap -->
</c:when>
<c:otherwise>

				<div id="buttons" class="row t_center">
					
					<div class="col-md-12"><div class="boxedtitle page-title"><h2 class="t_left">ショッピングモール</h2></div></div>
					<div class="page-content page-shortcode">
						<c:forEach var="good" items="${goodsList }">
							<ul>
								<li>
									<img src="./resources/images/pointShopImg/${good.imageurl }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
									商品名：　${good.goodsName}<br>
									値段：　${good.price}&nbsp;ポイント<br><br>
									<br><br><br><br>
							</ul>
						
						</c:forEach>
					</div>
					</div>
</c:otherwise>


</c:choose>


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
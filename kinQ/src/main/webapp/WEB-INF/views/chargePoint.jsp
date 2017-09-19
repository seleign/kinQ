<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>ポイントチャージ</title>  
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>  
<script src="https://code.jquery.com/jquery-3.2.1.min.js"  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="  crossorigin="anonymous"></script>  
<script type="text/javascript">  
window.onload = function() {  
IMP.init('imp52000562'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능  
  
	var amount = ${chargeAmount};  
	  
	IMP.request_pay({  
	    pg : 'nice',  
	    pay_method : 'card',  
	    merchant_uid : 'merchant_' + new Date().getTime(),  
	    name : 'ポイントチャージ',  
	    amount : amount  
	}, function(rsp) {  
	    if ( rsp.success ) {  
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기  
	    	jQuery.ajax({  
	    		url: "pg_result", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송  
	    		type: 'POST',  
	    		dataType: 'json',  
	    		data: {  
 	    		imp_uid : rsp.imp_uid,  
 	    		buyer_ID: '구매ID',  
 	    		amount: '1000',  
 	    		merchant_uid : 'merchant_' + new Date().getTime() //구매고유 ID  
    		//기타 필요한 데이터가 있으면 추가 전달  
    		//pg_test 컨트롤러를 보면 data값을 어떻게 받는지 알 수 있음.  
     		}
 	    /* ajax로 충전한 포인트 추가하기 */
     	});  
 	    /* 	alert("여기서 사기쳐서 페이지 이동 걸면 될듯함."); */  
 	    
     	location.href='pointShop';  
 	    } else {  
         var msg = '결제에 실패하였습니다.';  
         msg += '에러내용 : ' + rsp.error_msg;  
         alert(msg);  
         location.href='pointShop';  
 	    }  
 	});  
 }  
 </script>  
 </head>  
 <body>  
 </body>  
 </html>
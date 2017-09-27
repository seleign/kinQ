addEventListener("message", function(e) {
	var request  = new XMLHttpRequest();
	request.open('GET', '/imgToBase64?imgSrc=' + e.data, true);
	request.send();
	request.onreadystatechange = function(event) {
		if(request.readyState == 4) {
			if(request.status == 200	) {
				var result = request.responseText.replace("base64", e.data);
				result = JSON.parse(result)
				postMessage(result)
			}
		}
	}
});

//
//addEventListener("message", function(e) {
//	//e는 {a, b}
//	//console.log(e.data)
//	//console.log(Object.keys(e.data))
//	//console.log(Object.values(e.data))
//	
//	for (var key in Object.keys(e.data)) {
//		console.log(Object.keys(e.data)[key])
//		//console.log( Object.values(e.data)[key] )  <-- 이렇게하면 밸류값만 나옴
//		//e.data[Object.keys(e.data)[key]] = "asdasq"  <-- 이렇게 해야 수정됨
//
//		var request  = new XMLHttpRequest();
//		request.open('GET', '/imgToBase64?imgSrc='+ Object.keys(e.data)[key], true);
//		request.send();
//		request.onreadystatechange = function(event) {
//			if(request.readyState == 4) {
//				if(request.status == 200	) {
//					console.log("제대로 나오나?")
//					var result = request.responseText.replace("base64", Object.keys(e.data)[key]);
//					result = JSON.parse(result)
//					postMessage(result)
//				}
//			}
//		}
//	}	
//});


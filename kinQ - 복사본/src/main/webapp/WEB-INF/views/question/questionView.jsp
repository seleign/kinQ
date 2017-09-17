<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/js/jquery.min.js"></script>
<script type="text/javascript">
	var replyHtml = '';
	var userId = <%=(String)session.getAttribute("userId")%>
	$.ajax({
		url: "questionReplyList",
		type: "get",
		data: { questionNum: ${ question.questionNum }},
		success: function (replyList) {
			alert(replyList);
			replyHtml += "<table >";
			for (var i = 0; i < replyList.length; i++) {
				replyHtml += "<tr><td>";
				replyHtml += "제목 : " + replyList[i].replyTitle;
				replyHtml += "</td></tr>";
				replyHtml += "<tr><td>";
				replyHtml += "내용 : " + replyList[i].replyContent;
				replyHtml += "</td></tr>";
				replyHtml += "<tr><td align=\"right\">";
				replyHtml += "작성자 : " + replyList[i].id;
				replyHtml += "</td></tr>";
				if (userId == replyList[i].id) {
					replyHtml += "<tr><td>"
					replyHtml += "<button onclick = \"deleteReply(" + replyList[i].replyNum + ")\">삭제</button>"
					replyHtml += "</td></tr><br>"
				}else {
					replyHtml += "<br>"
				}
			}
			replyHtml += "</table>";
			$("#replyTable").html(replyHtml);
		}
	})
</script>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<table>
					<tbody>
						<tr>
							<td class="board_Num" colspan="2" align="left"><h1>${ question.questionNum }</h1></td>
							<td class="board_title" colspan="2" align="center" ><h1>${ question.title }</h1></td>
						</tr>
						<tr>
							<td style="width:50%; height:32px"><h1>ID : ${ user.id }</h1></td>
							<td style="width:50%; height:32px" align="right"><h1>작성일자 : ${ question.regDate }&nbsp; &nbsp; HIT : ${ question.hit }</h1></td>
						</tr>
						<tr>
							<td style="width:50%; height:32px"><h1>대분류 : ${ major.majorName }</h1></td>
							<td style="width:50%; height:32px"><h1>소분류 : ${ minor.minorName }</h1></td>
						</tr>
						<tr>
							<td style="width:50%; height:32px"><h1>태그 : 
								<c:forEach var="tag" items="${ tagList }">
									${ tag.tag }&nbsp; &nbsp;
								</c:forEach>
							</h1></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
			</tr>
			<tr>
				<div class="board_contents"><h1>내용 : ${ question.questionContent }</h1></div>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<div id = "replyTable"></div>
</body>
</html>
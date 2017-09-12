<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
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
							<td style="width:50%; height:32px"><h1>이름 : ${ question.urgent }</h1></td>
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
	
=======

>>>>>>> branch 'master' of https://github.com/seleign/kinq
</body>
</html>
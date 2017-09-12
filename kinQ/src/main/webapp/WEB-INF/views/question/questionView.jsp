<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Question View</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<table>
					<tbody>
						<tr>
							<td class="board_Num" colspan="2" align="left">${ question.questionNum }</td>
							<td class="board_title" colspan="2" align="center">${ question.title }</td>
						</tr>
						<tr>
							<td style="width:50%; height:32px">이름 : ${ question.id }</td>
							<td style="width:50%" height="32" align="right">작성일자 : ${ question.regDate }&nbsp; &nbsp; HIT : ${ question.hit }</td>
						</tr>
						<tr>
							<td style="width:50%; height:32px">대분류 : ${ major.majorName }</td>
							<td style="width:50%; height:32px">소분류 : ${ minor.minorName }</td>
						</tr>
						<tr>
							<td style="width:50%; height:32px">태그 : ${ minor.minorName }</td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</tbody>
				</table>
			</tr>
			<tr>
				<div class="board_contents">${ question.questionContent }</div>
			</tr>
		</tbody>
	</table>
	
</body>
</html>
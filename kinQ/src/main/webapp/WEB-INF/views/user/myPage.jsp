<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>緊Q</title>
</head>
<body>
<h1>マイページ</h1>

<label for="id">ID:</label>${sessionScope.userId }<br>
<label for="rank">ランキング:</label>___位<br>
<label for="point">ポイント:</label>___ポイント　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="ポイントショップ"><br>
<label for="myFollower">私のフォロワー:</label>___人<br>
<label for="myTeacher">私の先生:</label>___人<br>

<input type="button" onclick="location.href='updateUserInfo'" value="個人情報修正">
</body>
</html>
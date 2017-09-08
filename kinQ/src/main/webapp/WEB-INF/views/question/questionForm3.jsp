<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="/resources/ckeditor/adapters/jquery.js"></script>

<script type="text/javascript">
window.onload = function() {
	CKEDITOR.replace('editor',{
        filebrowserUploadUrl: 'cKEditorFileUpload'
    });
}
</script>
</head>
<body>
<textarea name="editor"></textarea>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
B.jsp 내용
<script type="text/javascript">
	function move(){
		location.href="./a2.jsp?mode=update";
	}
</script>
<button onClick="move()">a페이지</button>
</body>
</html>
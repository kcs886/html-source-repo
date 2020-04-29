<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../day5/JEasyUiComon.jsp" %>
</head>
<body>
<table id="dg" class="easyui-datagrid" data-options="url:'member.json'" title="데이터출력방법 종류" style="width:600px">
	<thead>
		<tr><th data-options="field:'name'">이름</th></tr>
	</thead>
	<tbody>
		<tr><td width="150"><%out.print("이성계"); %></td></tr>
	</tbody>
</table>

<table border=1 style="width:600px">
	<thead>
		<tr><th>이름</th><th>주소</th></tr>
	</thead>
	<tbody>
		<tr>
		<th width="150"><%out.print("이성계"); %></th>
		<td>주소</td>
		</tr>
	</tbody>
</table>


</body>
</html>
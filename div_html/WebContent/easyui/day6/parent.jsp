<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> mList = new ArrayList<>();    
	Map<String,Object> rmap = new HashMap<>();
	rmap.put("name","이성계");
	mList.add(rmap);
	rmap = new HashMap<>();
	rmap.put("name","유재석");
	mList.add(rmap);
	rmap = new HashMap<>();
	rmap.put("name","강호동");
	mList.add(rmap);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../day5/JEasyUiComon.jsp" %>
<script type="text/javascript" src="../../js/comons.js"></script>
<script type="text/javascript">
	function test(p_url,p_width,p_height,p_name){
		cmm_window_popup(p_url,p_width,p_height,p_name);
	}
	function fun() {
		$("#dg").datagrid({
			url:"../day5/jsonEmpList.jsp"
			,onLoadSuccess:function(date){
				alert("emp목록 로딩 성공");
			}
		});
	}

</script>
</head>
<body>
<table id="dg" class="easyui-datagrid" title="데이터출력방법 종류" style="width:600px">
	<thead> 
		<tr><th data-options="field:'ENAME'">이름</th></tr>
	</thead>
	<tbody>
<%
	for(int i=0; i<mList.size();i++){
		rmap = mList.get(i);
%>
		<tr><td width="150"><% out.print(rmap.get("name")); %></td></tr>
<%
	}
%>	
	</tbody>
</table>

<table border=1 style="width:600px">
	<thead>
		<tr><th>이름</th><th>주소</th></tr>
	</thead>
	<tbody>
<%
	for(int i=0; i<mList.size();i++){
		rmap = mList.get(i);
%>	
		<tr>
		<th width="150"><%out.print(rmap.get("name")); %></th>
		<td>주소</td>
		</tr>
<%
	}
%>
	</tbody>
</table>

<button onClick="test('child.jsp','700','450','child')">등록</button>
</body>
</html>
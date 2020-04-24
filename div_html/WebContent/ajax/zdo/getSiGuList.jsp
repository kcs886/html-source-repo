<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapZdoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String zdo = request.getParameter("zdo");
	SqlMapZdoDao bDao = new SqlMapZdoDao();
	List<Map<String,Object>> bList = null;
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("zdo",zdo);
	bList=bDao.getSiGuList(pMap);
%>

<select id="i_sigu" style="width:120px">
<option value="선택">선택</option>
<% 
	for(int i=0;i<bList.size();i++){
		Map<String,Object> rmap = bList.get(i);
%>
<option value=<%=rmap.get("SIGU")%>><%=rmap.get("SIGU")%></option>
  <%
	}
%>
</select>

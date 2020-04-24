<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="orm.dao.SqlMapZdoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlMapZdoDao bDao = new SqlMapZdoDao();
	List<Map<String,Object>> bList = null;
	bList=bDao.getZdoList();
%>
<option value="선택">선택</option>

<%
	for(int i=0;i<bList.size();i++){
		Map<String,Object> rmap = bList.get(i);
%>
  <option value=<%=rmap.get("ZDO")%>><%=rmap.get("ZDO")%></option>
  <%
	}
%>

<%@page import="orm.dao.SqlMapZdoDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="orm.dao.SqlMapDeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List" %>
<%
	String addr = request.getParameter("addr");	
	SqlMapZdoDao dDao = new SqlMapZdoDao();
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("address", addr);
	List<Map<String,Object>> dlist =dDao.getZipcodeList(pMap);
	Gson g = new Gson();
	String imsi = g.toJson(dlist);
	out.print(imsi);
%>

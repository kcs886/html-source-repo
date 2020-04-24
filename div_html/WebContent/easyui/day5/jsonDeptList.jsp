<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="orm.dao.SqlMapDeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List" %>
<%
	SqlMapDeptDao dDao = new SqlMapDeptDao();
	List<Map<String,Object>> dlist =dDao.deptList();
	Gson g = new Gson();
	String imsi = g.toJson(dlist);
	out.print(imsi);
%>
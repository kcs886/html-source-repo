<%@page import="div_html.JsonDeptList"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    JsonDeptList jdl = new JsonDeptList();
	java.util.List<Map<String,Object>> deptList =
	jdl.getDeptList();
	Gson g = new Gson();
	String temp = g.toJson(deptList);
	out.print(temp);
%>
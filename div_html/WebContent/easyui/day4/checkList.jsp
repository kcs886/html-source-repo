<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.DBConnetionMgr"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
DBConnetionMgr dbMgr = DBConnetionMgr.getInstance();
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

List<Map<String,Object>> deptList = new ArrayList<>();
Map<String,Object> rMap = null;
StringBuilder sb = new StringBuilder();
sb.append("select 0 as ck, empno, ename from emp");
try{
	con= dbMgr.getConnection();
	pstmt=con.prepareStatement(sb.toString());
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		rMap = new HashMap<>();
		
		rMap.put("ck",rs.getInt("ck"));
		rMap.put("empno",rs.getInt("empno"));
		rMap.put("ename",rs.getString("ename"));
		deptList.add(rMap);
	}

	
}catch(Exception e){
	e.printStackTrace();
}

Gson g = new Gson();
String temp = g.toJson(deptList);
out.print(temp);
%>

<%@page import="orm.dao.HashMapBilder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="com.util.DBMyBatisMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,String[]> pMap = request.getParameterMap();
	HashMapBilder hmb= new HashMapBilder();
	Map<String,Object> rMap = hmb.hashMapBilder(pMap);
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	int result = eDao.empUPD(rMap);
	out.print(result);
	if(result ==1){
	response.sendRedirect("EmpManager4Ver3.jsp?mode=update"); //페이지 이동
	}
	else{
		out.print(result);
	}
%>
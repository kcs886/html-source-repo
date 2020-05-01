<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="com.util.DBMyBatisMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String empnoArr = request.getParameter("empno"); //7899,9011,9013
	String empnos[] = null;
	if(empnoArr!=null){
		empnos = empnoArr.split(",");
	}
	int result = 0;
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	result = eDao.empDEL(empnos);
	
	
	if(result>0){
	   response.sendRedirect("EmpManager4Ver3.jsp?mode=delete");//페이지 열기전 db경유함.
	}
	//등록 실패 했을 때
	else{ 
	   response.sendRedirect("empInsertFail.jsp");//실패 페이지
	}
%>
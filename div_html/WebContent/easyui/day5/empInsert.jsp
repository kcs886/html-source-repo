<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@page import="com.util.DBMyBatisMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 이런식으로 처리해야함.  
	if(request.getParameter("empno") != null){
		int empno = Integer.parseInt(request.getParameter("empno"));
	}
*/
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	String hiredate = request.getParameter("hiredate");
	Double sal = Double.parseDouble(request.getParameter("sal"));
	Double comm = Double.parseDouble(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	Map<String,Object> pMap = new HashMap<>();
	pMap.put("empno",empno);
	pMap.put("ename",ename);
	pMap.put("job",job);
	pMap.put("mgr",mgr);
	pMap.put("hiredate",hiredate);
	pMap.put("sal",sal);
	pMap.put("comm",comm);
	pMap.put("deptno",deptno);
	SqlMapEmpDao eDao = new SqlMapEmpDao();
	int result = eDao.empINS(pMap);
	//response.sendRedirect("EmpManager4Ver2.jsp"); //페이지 이동
	if(result==1){
	   response.sendRedirect("EmpManager4Ver2.jsp");//페이지 열기전 db경유함.
	}
	//등록 실패 했을 때
	else{ 
	   response.sendRedirect("empInsertFail.jsp");//실패 페이지
	}
%>
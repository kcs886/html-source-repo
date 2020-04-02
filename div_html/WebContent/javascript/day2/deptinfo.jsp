<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//JSON포맷을 JavaScript코드에서 활용하기 연습
	out.print("[{\"DEPTNO\":10,\"DNAME\":\"영업부\",\"LOC\":\"대전\"},{\"DEPTNO\":20,\"DNAME\":\"회계부\",\"LOC\":\"서울\"},{\"DEPTNO\":30,\"DNAME\":\"개발부\",\"LOC\":\"부산\"}]");
%>

package com.dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.google.gson.Gson;
import com.util.DBConnetionMgr;

public class JsonDeptList {
	DBConnetionMgr dbmgr = DBConnetionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<Map<String, Object>> getDeptList() {
		List<Map<String, Object>> deptList = new ArrayList<>();

		StringBuilder sb = new StringBuilder();
		sb.append("select deptno, dname, loc from dept");

		try {
			con = dbmgr.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> rmap = new HashMap<>(); // 1EA
				rmap.put("deptno", rs.getInt("deptno"));
				rmap.put("dname", rs.getString("dname"));
				rmap.put("loc", rs.getString("loc"));
				deptList.add(rmap);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return deptList;
	}


	 public List<DeptVO> getDeptVO(){
		 	List<DeptVO> list_dept = new ArrayList<>();
	 
			 DeptVO dVO= null; StringBuilder sb = new StringBuilder();
			 sb.append("select deptno, dname, loc from dept");
			 
			 try {
				 con = dbmgr.getConnection(); 
				 pstmt = con.prepareStatement(sb.toString());
				 rs=pstmt.executeQuery();
				 while(rs.next()) {
					 dVO= new DeptVO();
					 dVO.setDeptno(rs.getInt("deptno"));
					 dVO.setDname(rs.getString("dname"));
					 dVO.setLoc(rs.getString("loc"));
					 list_dept.add(dVO);
					 }
				 }
			 catch (Exception e) {
			 System.out.println(e.toString());
			 }finally {
				 try {
					 rs.close();
					 pstmt.close();
					 con.close();
			 } catch (Exception e2) { // TODO: handle exception } } return
				 }
			 }
			 return list_dept;
	 }

	public static void main(String[] args) {
		JsonDeptList jdl = new JsonDeptList();
		List<Map<String, Object>> deptList = jdl.getDeptList();
		// List<DeptVO> list_dept = jdl.getDeptVO();
		Gson g = new Gson();
		String temp = g.toJson(deptList);
		// String tempVO = g.toJson(list_dept);
		System.out.println(temp);
		// System.out.println(tempVO);
	}

}

package com.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnetionMgr;

public class RestaurantDao {
	DBConnetionMgr dbMgr = DBConnetionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public List<Map<String,Object>> restList() {
	      List<Map<String,Object>> rList = null;
	      StringBuilder sql = new StringBuilder();
	      sql.append("SELECT res_num, res_name, res_tel, res_addr, res_hate");
	      sql.append("       res_like,res_photo,res_info,res_time,");
	      sql.append("       lat,lng");
	      sql.append(" FROM restaurant");
	      try {
	         con = dbMgr.getConnection();
	         pstmt = con.prepareStatement(sql.toString());
	         rs = pstmt.executeQuery();
	         Map<String,Object> rmap = null;
	         while(rs.next()) {
	        	 rmap = new HashMap<>();
	        	 rmap.put("res_num", rs.getInt("res_num"));
	        	 rmap.put("res_name", rs.getString("res_name"));
	        	 rmap.put("res_tel", rs.getString("res_tel"));
	        	 rmap.put("res_addr", rs.getString("res_addr"));
	        	 rmap.put("res_hate", rs.getInt("res_hate"));
	        	 rmap.put("res_like", rs.getInt("res_like"));
	        	 rmap.put("res_photo", rs.getString("res_photo"));
	        	 rmap.put("res_info", rs.getString("res_info"));
	        	 rmap.put("res_time", rs.getString("res_time"));
	        	 rmap.put("lat", rs.getDouble("lat"));
	        	 rmap.put("lng", rs.getDouble("lng"));
	        	 rList.add(rmap);
	         }
	      } catch (SQLException se) {
	         System.out.println("[[query]]"+ sql.toString());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return rList;
	   }
	
	public List<Map<String,Object>> mapRestList() {
		List<Map<String,Object>> mrList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select res_name,res_photo,lat,lng from resturant");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			  rs = pstmt.executeQuery();
		         Map<String,Object> rmap = null;
		         while(rs.next()) {
		        	 rmap = new HashMap<>();
		        	 rmap.put("res_name", rs.getString("res_name"));
		        	 rmap.put("res_photo", rs.getString("res_photo"));
		        	 rmap.put("lat", rs.getDouble("lat"));
		        	 rmap.put("lng", rs.getDouble("lng"));
		        	 mrList.add(rmap);
		         }
		      } catch (SQLException se) {
		         System.out.println("[[query]]"+ sql.toString());
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return mrList;
		}
	
	
	public int restINS(Map<String,Object> pMap) {
		int result =0;
		StringBuilder sql = new StringBuilder();
			sql.append("insert into resturant(res_num, res_name, res_tel, res_addr");
			sql.append(",res_hate,res_like,res_photo");
			sql.append(",res_info,res_time,lat,lng)");
			sql.append(" values(seq_restaurant_num.nextval");
			sql.append(",?,?,?,0,0,?,?,?,?,?)");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int i= 0;
			pstmt.setString(++i, pMap.get("res_name").toString());
			pstmt.setString(++i, pMap.get("res_tel").toString());
			pstmt.setString(++i, pMap.get("res_addr").toString());
			pstmt.setString(++i, pMap.get("res_photo").toString());
			pstmt.setString(++i, pMap.get("res_info").toString());
			pstmt.setString(++i, pMap.get("res_time").toString());
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(++i, Double.parseDouble(pMap.get("lng").toString()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[query]:"+sql.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static void main(String[] args) {
		/*
		 * Map<String,Object> pMap = new HashMap<>(); pMap.put("res_name", "안녕");
		 * pMap.put("res_tel", "전번"); pMap.put("res_addr", "주소"); pMap.put("res_photo",
		 * "사진"); pMap.put("res_info", "후기"); pMap.put("res_time", "영업시간");
		 * pMap.put("lat", 3.123); pMap.put("lng", 3.123); RestaurantDao rd = new
		 * RestaurantDao(); int result =rd.restINS(pMap); System.out.println(result);
		 */
		
		 RestaurantDao rd = new RestaurantDao();
		 List<Map<String,Object>> mrList= rd.mapRestList();
		 System.out.println(mrList.size());
	}
}

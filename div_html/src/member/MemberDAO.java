package member;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnetionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.oracore.OracleType;

/*
 * DML(기본) - 프로시저 - MyBatis[ORM솔루션-30%이상 줄어둚-반복되는 코드 줄어듦-일괄수정처리]
 * 
 */
public class MemberDAO {
	DBConnetionMgr dbMgr = DBConnetionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null; //SQL 처리
	CallableStatement cstmt = null; //프로시저 전담
	OracleCallableStatement ocstmt = null; //REFCURSOR조작
	ResultSet rs = null;  //rs.next(), rs.previous(), rs.absolute(3)

	//회원목록 조회 실습 1 - SELECT문
	public List<Map<String,Object>> memberList(){
		List<Map<String,Object>> memberList = new ArrayList<>();
		Map<String, Object> rMap = null;
		
		
		StringBuilder sb = new StringBuilder();
		sb.append("select mem_no,mem_id,mem_pw,mem_name,zipcode,mem_addr,mem_email from member_t");
		try {
			con=dbMgr.getConnection();
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			rMap = new HashMap<>();
			while(rs.next()) {
				rMap.put("mem_no", rs.getInt("mem_no"));
				rMap.put("mem_id", rs.getString("mem_id"));
				rMap.put("mem_pw", rs.getString("mem_pw"));
				rMap.put("mem_name", rs.getString("mem_name"));
				rMap.put("zipcode", rs.getString("zipcode"));
				rMap.put("mem_addr", rs.getString("mem_addr"));
				rMap.put("mem_email", rs.getString("mem_email"));
				memberList.add(rMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return memberList;
	}
	
	//회원목록 조회 실습2 - 프로시저
	public List<Map<String,Object>> procMemberList(){
		List<Map<String,Object>> memberList = new ArrayList<>();
		Map<String, Object> rMap = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("select mem_no,mem_id,mem_pw,mem_name,zipcode,mem_addr,mem_email from member_t");
		try {
			//DBCoonectionMgr 공통코드를 작성했으므로 드라이버명,계정정보, orcl11[SID]생략
			con=dbMgr.getConnection();
			cstmt = con.prepareCall("{ call proc_memberList(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);  //1 = 첫번째 물음표
			cstmt.execute(); //프로시저 처리 요청 메소드 호출
			//오라클에서만 제공되는 REFCURSOR이므로 오라클에서 제공하는 인터페이스로 형전환하기
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			rMap = new HashMap<>();
			while(rs.next()) { //커서의 위치에 데이터가 있는거야? 응
				rMap.put("mem_no", rs.getInt("mem_no"));
				rMap.put("mem_id", rs.getString("mem_id"));
				rMap.put("mem_pw", rs.getString("mem_pw"));
				rMap.put("mem_name", rs.getString("mem_name"));
				rMap.put("zipcode", rs.getString("zipcode"));
				rMap.put("mem_addr", rs.getString("mem_addr"));
				rMap.put("mem_email", rs.getString("mem_email"));
				memberList.add(rMap);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return memberList;
	}
	
	
	public static void main(String[] args) {
		MemberDAO mdao = new MemberDAO();
		List<Map<String,Object>> mList = null;
		mList =mdao.procMemberList();
		if(mList != null) {
			System.out.println("mList.size() ===>"+mList.size());
		}
	}

}

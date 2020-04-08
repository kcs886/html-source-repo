package webcrawling2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class DbInsert {
	
	  public static void main(String[] args) { 
		  
			Connection			con		= null; 
			PreparedStatement	psmt	= null;
			
	    Map<String, String> crawlingMap = new HashMap<String, String>();
	    
	    crawlingMap.put("이름", "유관순");
	    crawlingMap.put("나이", "18");
	    crawlingMap.put("생년월일", "1902년 12월 16일");
	    crawlingMap.put("출생지", "천안");
	    crawlingMap.put("업적", "일제 강점기의 독립운동가");
	     
	    try {
	      //DB연결
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      String url = "jdbc:oracle:thin:@192.168.0.252:1521:orcl11";
	      String userid="scott";
	      String userpw="tiger";
	      /*① 위 접속정보 이용하여 DB연결 및 Connection객체 생성 */
			con = DriverManager.getConnection(url,userid,userpw);
			 //DB연결 성공시...
		      if(con!=null){      
		    	  /*② insert 쿼리문 작성 */
		    	  StringBuilder sb = new StringBuilder();
		    	  sb.append("insert into test0407(name,age,birth,contury,history)  ");
		    	  sb.append("values(?,?,?,?,?)                                     ");
		    	 
		  	        /*③ PreparedStatement 객체 생성 및 인파라미터 설정 */  
		    	      psmt=con.prepareStatement(sb.toString());
		    		  psmt.setString(1,crawlingMap.get("이름"));
		    		  psmt.setString(2,crawlingMap.get("나이"));
		    		  psmt.setString(3,crawlingMap.get("생년월일"));
		    		  psmt.setString(4,crawlingMap.get("출생지"));
		    		  psmt.setString(5,crawlingMap.get("업적"));
		    		  int resultNum = psmt.executeUpdate();
		    		//쿼리문실행 및 반환값 확인
		  	        System.out.println(resultNum +"행이 입력성공");
		      }
	    }
			 catch (ClassNotFoundException e) {
				System.out.println("드라이버 클래스 이름을 찾을 수 없어요.");
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("예외가 발생했음. 정상적으로 처리가 안됨.");
			}
	      }
	    }
	  
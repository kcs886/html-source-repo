package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapEmpDao {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class); 
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	//화면설계할때 쿼리문까지 넣어놓기
	//insert into emp values(?,?,?,?,?,?,?,?)
	/***************************************************************
	 * 사원등록 구현하기
	 * SQL문 INSERT INTO emp VALUES(?,?,?,?,?,?,?,?)
	 * @param pMap(사원번호,사원명,job,그룹코드,입사일자,급여,인센티브,부서번호)
	 * @return int 
	 ***************************************************************/
	public int empINS(Map<String,Object> pMap) {
		logger.info("empINS 호출");
		int result =0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			result=sqlSes.insert("empINS",pMap);
			logger.info("result:"+result); //executeUpdate() : int
		} catch (Exception e) {
			e.printStackTrace();//메모리에 들어있는 에러를 뽑아줌.
		}
		return result;
	}
	
	public List<Map<String,Object>> empList(Map<String,Object> pMap){
		logger.info("empList 호출 성공");
		List<Map<String,Object>> elist = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSec = sqlMapper.openSession();
			elist = sqlSec.selectList("empList",pMap);
			System.out.println("조회한 로우 수 : "+elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return elist;
		}
	public static void main(String[] args) {
		SqlMapEmpDao eDao = new SqlMapEmpDao();
		List<Map<String,Object>> empList =eDao.empList(null);
	}
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//디클리레이션 - 전역변수이다.
//싱글톤으로 관리(서블릿-newsData_jsp.java => HttpServlet- 이 객체는 계속 유지됨-새로고침 당해도)
	int x = 1; //전역변수이다.
	public String newsList(String news[]){
		//자바성능튜닝팀 지적사항 - 삼성 SD5 - 지방공개정보시스템
		StringBuilder sb = new StringBuilder();
		sb.append("<table width='500px' border='1'>");
		sb.append("<tr><td>"+news[0]+" > "+news[1]+"</td></tr>");
		sb.append("</table>");
		return sb.toString();
	}
%>

<%
//스크립틀릿 - 메소드 선언불가
	//int x = 1; //지역변수이다.
	String news1[] = {"연합뉴스","상승률 상위 50선"};
	String news2[] = {"연합뉴스","미국 코로나19 누적 사망자 4만명 넘어"};
	String news3[] = {"연합뉴스","한국산 코로나19 진단키트, 잘 나가는 이유는"};
	String news4[] = {"연합뉴스","마스크는 흰색만…'오체불만족' 저자 한탄"};
	String news5[] = {"연합뉴스","재난기본소득 자녀에게 줄건가요? 맘카페서 '와글와글'"};
	//화면에 내보내 질 코드 담기
	String datas = "";
	switch(x){
	case 1:
		datas= newsList(news1);
		x++;
		break;
	case 2:
		datas= newsList(news2);
		x++;
		break;
	case 3:
		datas= newsList(news3);
		x++;
		break;
	case 4:
		datas= newsList(news4);
		x++;
		break;
	case 5:
		datas= newsList(news5);
		x=1;
		break;
	}
	out.print(datas);
%>
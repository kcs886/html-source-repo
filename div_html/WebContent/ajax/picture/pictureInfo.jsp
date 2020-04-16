<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//화면이없어도 단위테스트가 가능해야 함.
//디자이너가 내 페이지를 아직 못 만들었다고 해도 나는 코딩할 수 있다.
//클래스 쪼개기

//192.168.0.252:8000/div_html/ajax/picture/pitureInfo.jsp?id=123
	String img = request.getParameter("id");
	//out.print("img:"+img);
	String imgs[] = {"picture1.jpg","picture2.jpg"
				     ,"picture3.jpg","picture4.jpg"};
	String cimg = null;
	for(int i=0; i<imgs.length;i++){
		if(img.equals(imgs[i])){
			cimg = imgs[i];
		}
		
	}
%>
<img src="./<% out.print(cimg); %>" width='400px' height='270px' border="1">










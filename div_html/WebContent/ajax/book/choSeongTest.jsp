<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
<!-- 
가 - 44032
 -->
<div id="d_msg"></div>
<script type="text/javascript">
   function choSeongAccount(str){
      var cho = [
    	  		"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ"
               ,"ㄹ","ㅁ","ㅂ","ㅃ","ㅅ"
               ,"ㅆ","ㅇ","ㅈ","ㅉ","ㅊ"
               ,"ㅋ","ㅌ","ㅍ","ㅎ"
               ];
      //alert(str.charCodeAt());
      var code;
      var result='';//ㅈㅂ을 반환하는 변수
      for(i=0;i<str.length;i++) {
    	  code = str.charCodeAt(i)-44032;
    	 if(code > -1 && code < 11172) result += cho[Math.floor(code/588)]; //11172 한글글자수(표현)가 11172자라서 범위를 말하는것임.
   }   
   }
      
      return result;
      
   }
 
   var a = choSeongAccount("ㅍ");
	alert("a:"+a);
   </script>
</body>
</html>
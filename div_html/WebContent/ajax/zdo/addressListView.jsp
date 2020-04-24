<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax실전연습-[1:ajax,2:html,html+js,js,3:myBatis]</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
 <style type="text/css">
 	table{
 		border: 3px solid #CCAAFF;
 	}
 	td{
 		border: 3px solid #CCAAFF;
 		text-align: center;
 		height: 45px;
 	}
 </style>
	<script type="text/javascript">
		function siguIN(zdo) {
			alert(zdo);
			$("#i_sigu").change(function(){
				$("#i_sigu option:selected").each(function(){
					alert("tq");
					$("#sigu").val($(this).text()); //this-> i_sigu
				});
			});
		}
	</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function (){
		$.ajax({
			method:"post"
		    ,url:'getZdoList.jsp'
		    ,success:function(result){
		    	$("#i_zdo").html(result);
		    }
		});
		$("#i_zdo").change(function(){
			$("#i_zdo option:selected").each(function(){
				 var zdo = $(this).text();
				 var param ="zdo="+zdo;
		  		 document.getElementById("zdo").value = zdo;
		  		 
		  		$.ajax({
					method:"post"
					,data: param
				    ,url:'getSiGuList.jsp'
				    ,success:function(result){
				    	$("#d_sigu").html(result);
				    	siguIN(zdo);
				    }
				});
			});
		});//////end of change
	});///////end of ready
</script>
<table border=1 width="700" height="60" cellpadding="0" cellspacing="0">
	<tr>
		<td width="50px"><p>시</p><p>도</td> <td width="130px"><select id="i_zdo" style="width:130px"></select></td>
		<td width="50px"><p>구</td> <td width="130px"><div id="d_sigu"></div></td>
		<td width="50px"><p>동</td> <td width="130px"><div id="d_dong"></div></td>
	</tr>
	<tr>
		<td width="50px"><p>시</p><p>도</td> <td width="130px"><input type="text" id="zdo"/></td>
		<td width="50px"><p>구</td> <td width="130px"><input type="text" id="sigu"/></td>
		<td width="50px"><p>동</td> <td width="130px"><input type="text" id="dong"/></td>
	</tr>
</table>
</body>
</html>
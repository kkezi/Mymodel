<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<div class = 'sign-up'>
	<form action = "<%=request.getContextPath() %>/myView/myBoard/myWritePro.jsp" method ="post" enctype = "multipart/form-data" 
	name ="myf">
	
	<div class ="sign-up">
		<h2>게시글 입력</h2>
		 
			<label class= "header">작성자:</label>
			<input type ='text' name="mywriter" id= "user" size ='20'><br>
			<label class ="header">비밀번호:</label>
			<input type = 'password' name="mypass" id ="pass" size ='20'><br>
		
			<label class ="header">제목:</label>
			<input type = 'text' name="mysubject" id = "user" size ='10'><br>
		
			<label class = "header">내용:</label>
			<textarea rows = "10" cols ="50" name = "mycontent" id="user"></textarea>
		
		<label class ="header">파일저장</label>
		<input type='file' name = "myfile1" id="user">
		
		</div>
		<button type = 'submit'>입 력</button>
		
	</form>
</div>


</body>
</html>
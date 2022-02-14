<%@page import="myModel.MyMember"%>
<%@page import="myService.MyMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String curlog = (String)session.getAttribute("mymemberId");;

if(curlog == null || curlog.trim().equals("")) {
	%>
<script>
alert("로그인이 필요합니다!")
location.href = "<%=request.getContextPath()%>/myView/myMember/myLoginForm.jsp";

</script>	
<% } else { %>

<%
MyMemberDao mmd = new MyMemberDao();
MyMember mm = mmd.selectMyOne(curlog);

%>
<hr>
<div class = 'sign-up'>
	<form action = "<%=request.getContextPath() %>/myView/myMember/myMemberUpdatePro.jsp" >
	<table>
		<caption>회원정보수정</caption>
		<tr>
			<td rowspan = '4'>
			<img id="user_image" src="dog.jpg" alt="기본 프로필 이미지" style="width:200px; height:150px;">
 			<br>
 			<label class="input_image_text" for="input_img">사진추가</label>
 			<input type="file" id="input_img" accept=".jpg" onchange="PreviewImage()" style="display:none;"/>
			</td>
			
			<td class= 'header'>아이디</td>
			<td><input type ='text' id ='user' name="myid" readonly="readonly" size ='20' value = "<%=mm.getMyid()%>"></td>
		</tr>
		<tr>
			<td class= 'header'>비밀번호</td>
			<td><input type = 'password' id ='user' name="mypasswd" size ='20'></td>
		</tr>
		<tr>
			<td class= 'header'>이름</td>
			<td><input type = 'text' id = 'user' name="myname" readonly="readonly" size ='10' value ="<%=mm.getMyname()%>"></td>
		</tr>
		<tr>
			<td class= 'header'>성별</td>
			<td>
			<label><input type="radio" name="mygender" <%=mm.getMygender()==1 ? "checked":"" %> value="1" disabled="disabled">남 </label>
			<label><input type="radio" name="mygender" <%=mm.getMygender()==2 ? "checked":"" %> value="2" disabled="disabled">여 </label>
			</td>
		</tr>
		<tr>
			<td class= 'header'>전화번호</td>
			<td colspan ='2'><input type = 'tel' id = 'user' name = "mytel" value ="<%=mm.getMytel()%>"size = '11'></td>
		</tr>
		<tr>
		<td class= 'header'>이메일</td>
		<td colspan ='2'><input type='email' id= 'user' name = "myemail" value = "<%=mm.getMyemail()%>" size = '60'></td>
		</tr>
		<tr>
		<td colspan = '3'><input type = 'submit' value = '회원정보수정' onclick="complete_sign()"></td>
		</tr>
	</table>
	</form>
	
</div>
<% } %>
</body>
</html>
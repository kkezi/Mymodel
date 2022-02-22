<%@page import="myModel.MyBoard"%>
<%@page import="myService.MyBoardDao"%>
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
int mynum = Integer.parseInt(request.getParameter("mynum"));
MyBoardDao mbd = new MyBoardDao();
MyBoard mb = mbd.boardMyOne(mynum);
%>

<hr>
<div class="mymargin">
			<h2 id = "center">게시판보기 상세보기</h2>
			<table >
			<tr>
			<th>작성자: </th><td><%=mb.getMywriter() %></td>
			</tr>
			<tr>
			<th>제목: </th><td><%=mb.getMysubject() %></td>
			</tr>
			<tr>
			<th height ="250px">내용: </th><td><%=mb.getMycontent() %></td>
			</tr>
			<tr>
			<th>파일: </th><td><img src = "<%=request.getContextPath() %>/myboardupload/<%=mb.getMyfile1() %>"></td>
			</tr>
			<tr><td colspan='2'><button class="btn btn-dark" onclick ="location.href ='<%%>'">답 변</button>
			<button class="btn btn-dark" onclick ="location.href ='myBoardUpdateForm.jsp?mynum=<%=mb.getMynum()%>'">수 정</button>
			<button class="btn btn-dark" onclick ="location.href ='<%%>'">삭 제</button></td></tr>
			
			</table>
			
			
					
			
			
			
</div>

</body>
</html>
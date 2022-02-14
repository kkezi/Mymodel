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
MyMemberDao mmd = new MyMemberDao();
String myname = request.getParameter("myname");
int num1 = mmd.insertmyMember1(request);
String msg = "";
String url = "";

if (num1 > 0) {
	msg = myname+"님의 가입이 완료되었습니다 :) ";
	url = request.getContextPath()+"/myView/myMember/myLoginForm.jsp";
} else {
	msg = "회원가입이 실패하였습니다 ㅠㅠ";
	url = request.getContextPath()+"/myView/myMain.jsp";
}

%>
<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>
</body>
</html>
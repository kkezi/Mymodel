
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
request.setCharacterEncoding("utf-8");
String myid = request.getParameter("myid");
String mypasswd = request.getParameter("mypasswd");

MyMemberDao mmd = new MyMemberDao();

MyMember mm = mmd.selectMyOne(myid);

String msg = "아이디를 확인하세요";
String url = request.getContextPath()+"/myView/myMember/myLoginForm.jsp";

if(mm != null) {
	if(mypasswd.equals(mm.getMypasswd())) {
		session.setAttribute("mymemberId", myid);
		msg = mm.getMyname()+"님 로그인되었습니다";
		url = request.getContextPath() +"/myView/myMain.jsp";
		 
	} else {
		msg ="비밀번호가 다릅니다.";
	}
}


%>

<script>
alert("<%=msg%>");
location.href ="<%=url%>";

</script> 



</body>
</html>
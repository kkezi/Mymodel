
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String myid = request.getParameter("myid");
if(myid == null) {
	myid = " ";
			}
System.out.print(myid);
String line ="12345678,89123456";

boolean mychk = line.contains(myid);
%><%=mychk %>

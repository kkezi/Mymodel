<%@page import="myModel.MyBoard"%>
<%@page import="java.util.List"%>
<%@page import="myService.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.disabledPage {
	color: gray;
	}

</style>

</head>
<body>
<%
String myboardid = "1";
int mypageInt = 1;
int mylimit = 5;

try {
mypageInt = Integer.parseInt(request.getParameter("mypageNum"));
} catch (Exception e) {
	mypageInt = 1;
}


MyBoardDao mbd = new MyBoardDao();
int countmyboard = mbd.countMyBoard(myboardid);

List<MyBoard> list1 = mbd.listMyBoard(mypageInt,mylimit,countmyboard,myboardid);

int myboardnum = countmyboard - mylimit*(mypageInt-1); 
/*
1p -- 1 ~ 5
2p -- 6 ~ 10
3p -- 11 ~ 15 
*/
int mybottomLine = 5;
int mystartPage = (mypageInt-1)/mybottomLine * mybottomLine + 1 ; //1,6,11
int myendPage = mystartPage + mybottomLine -1; //5,10,15
int mymaxPage = (countmyboard/mylimit) + (countmyboard % mylimit ==0? 0:1);
if(myendPage > mymaxPage) myendPage = mymaxPage;


%>
  <div class='mymargin'>
	<h2 align="center" >자유게시판<%=mypageInt %></h2>
	<p align="right"><a href ="<%=request.getContextPath() %>/myView/myBoard/myWriteForm.jsp">게시판입력</a></p>
	<table>
		
		<thead>
 		<tr>
 			<th>번호</th>
    		<th>제목</th>
    		<th>작성자</th>
    		<th>등록일</th>
    		<th>파일</th>
    		<th>조회수</th>
 		</tr>
 		</thead>
 		<tbody>
 		<%
 			for(MyBoard mb : list1) {
 				
 		%>
  		<tr>
   			<td><%=myboardnum-- %></td>
    		<td class ="title"><a href = "myBoardInfo.jsp?mynum=<%=mb.getMynum()%>"><%=mb.getMysubject() %></a></td>
    		<td><%=mb.getMywriter() %></td>
    		<td><%=mb.getMyregdate() %></td>
    		<td><%=mb.getMyfile1() %></td>
   			<td><%=mb.getMyreadcnt() %></td>
  		</tr>
  		<% } %>
  		</tbody>

	</table>
    <p align = "left">
	<%if(countmyboard > 0) { %>글 개수 : <%=countmyboard %>
	<%} else { %> 등록된 게시물이 없습니다
	 	<% } %>
	</p>
	</div>
	
	
	<div class="w3-center">
		<div class="w3-bar">
  			<a <%if(mystartPage <= mybottomLine){ %> class= "disabledPage" <%} else { %> href="myList.jsp?mypageNum=<%=mystartPage-mybottomLine %>" class="w3-bar-item w3-button"<%}%> >◀</a>
  			<% for(int i = mystartPage; i <= myendPage; i++) { %>
  		     
  		   	  <a href="myList.jsp?mypageNum=<%=i %>" <%if(i==mypageInt) {%> class = "w3-button w3-gray"<% } else {%> class="w3-button" <%} %> > <%=i %></a>

  		     
  			<%}  %>
  			<a <%if(myendPage>=mymaxPage){ %> class = "disabledPage" <%} else { %> href="myList.jsp?mypageNum=<%=mystartPage+mybottomLine %>" class="w3-button"<%}%> >▶</a>
		</div>
	</div>
	


</body>
</html>
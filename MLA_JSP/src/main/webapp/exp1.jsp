<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tags</title>
</head>
<body>
<%!
int x=10;
int y=20;
public int add()
{
	return x+y;
}
%>
<%=add() %>
<br><br>
<%
out.println(add());
//out.println(new Date());
%>
</body>
</html>
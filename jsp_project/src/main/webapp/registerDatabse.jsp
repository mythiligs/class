<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successfully Registered</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/xyz","root","root@39");
String sql="insert into user_mla(mla_fname,mla_user,mla_pass)values(?,?,?)";
PreparedStatement pst=con.prepareStatement(sql);
String fname=request.getParameter("fname");
String usr=request.getParameter("user");
String pass=request.getParameter("pwd");
pst.setString(1,fname);
pst.setString(2,usr);
pst.setString(3,pass);
pst.execute();
ResultSet rs = pst.executeQuery();
while (rs.next()) 
{
	if (rs.getString(1).equals(fname)) 
	{
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
	}
	break;
}
if (true) 
{
	out.println("<center><h3><font color='black'> Login failed.</font> </h3></center>");
	RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
	rd.include(request, response);
}

} 
catch (Exception e)
{
e.printStackTrace();
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vasavi","root","root");
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
if(name!=null&&pwd!=null){
String query="insert into register(name,pwd) values(?,?)";
PreparedStatement st=con.prepareStatement(query);
st.setString(1,name);
st.setString(2,pwd);
if(st.executeUpdate()>0){
  out.println("<center>Registered Successfully<br>Click on login</center>");	
}
else{
	out.println("NOt Registered ");	
}
}
%>
<center>
<form action="login.jsp"><input type=submit value="Login"><br><br></form>

<fieldset style="width:50%">
<legend >Registration</legend>
<form action="">
Name     <input type="text" name="name"><br><br>
PassWord <input type="password" name="pwd"><br><br>
<input type=submit value="Register">
</form></center>

</fieldset>
</body>
</html>
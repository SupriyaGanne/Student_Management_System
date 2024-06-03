<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vasavi","root","root");
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
if(name!=null&&pwd!=null){
String query="select * from register where name=? and pwd=?";
PreparedStatement st=con.prepareStatement(query);
st.setString(1,name);
st.setString(2,pwd);
ResultSet rs=st.executeQuery();
if(rs.next()){
	out.println("Welcome "+rs.getString(1));
}

else{
	out.println("Invalid credentials");
}
}

%>
</body>
</html>
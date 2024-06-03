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
<center>
<form action="" >
Name:<input type="text" name="name" required><br><br>
Id:<input type="text" name="Id" required><br><br>
Age:<input type="text" name="age" required><br><br>
Grade:<input type="text" name="grade" required><br><br>
<button value="Add" >Submit</button>
</form>
</center>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vasavi","root","root");
String Name=request.getParameter("name");
String Id=request.getParameter("Id");
String age=request.getParameter("age");
String grade=request.getParameter("grade");

if(Name!=null && Id!=null&&age!=null&&grade!=null){
	
	String query="insert into student(id,name,age,grade) values (?,?,?,?);";
	PreparedStatement st=con.prepareStatement(query);
	 
     st.setInt(1, Integer.parseInt(Id));
     st.setString(2, Name);
     st.setInt(3, Integer.parseInt(age)); 
     st.setString(4, grade);
	st.executeUpdate();
	response.sendRedirect("student.jsp");

}
%>
</body>
</html>
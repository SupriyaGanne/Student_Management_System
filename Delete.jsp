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
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vasavi","root","root");

String idstr=request.getParameter("id");
if (idstr != null && !idstr.isEmpty()) {
int id=Integer.parseInt(idstr);
String query="Delete  from student where id=?";
PreparedStatement st=con.prepareStatement(query);
st.setInt(1,id);
st.executeUpdate();
response.sendRedirect("student.jsp");
}
%>
</body>
</html>
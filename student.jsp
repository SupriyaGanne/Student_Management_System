<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
</head>
<body>
   <style>
      table{
      margin-top:20px;
        border: 1px solid black;
        width:50%;
      }

        th, td {
            border: 1px solid black;
            padding: 8px;
            
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
<center>
<form action="AddStudent.jsp">
<button>Add Student</button>
</form>

 <table >
<tr>
<th>Id</th>
<th>Name</th>
<th>Age</th>
<th>Grade</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	
	e.printStackTrace();
}
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/vasavi","root","root");
String query="select * from student;";
PreparedStatement st=con.prepareStatement(query);
ResultSet rs=st.executeQuery();
while(rs.next()){%>
<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getInt("age")%></td>
<td><%=rs.getString("grade")%></td>
<td><a href="Edit.jsp?id=<%=rs.getInt("id") %>" >edit</a>
<td><a href="Delete.jsp?id=<%=rs.getInt("id")%>" >delete</a>
</tr>
<%}
%>
</table>
</center>
</body>
</html>
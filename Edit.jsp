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
//Fetch existing data based on id
String idStr = request.getParameter("id");
if (idStr != null && !idStr.isEmpty()) {
 int id = Integer.parseInt(idStr);
 String query = "SELECT * FROM student WHERE id=?";
 PreparedStatement st = con.prepareStatement(query);
 st.setInt(1, id);
 ResultSet rs = st.executeQuery();
 if (rs.next()) {
     String existingName = rs.getString("name");
     int existingAge = rs.getInt("age");
     String existingGrade = rs.getString("grade");
%>
 <center>
     <form action="" method="post">
         Name: <input type="text" name="name" value="<%= existingName %>" required><br><br>
         Id: <input type="text" name="Id" value="<%= id %>" readonly><br><br>
         Age: <input type="text" name="age" value="<%= existingAge %>" required><br><br>
         Grade: <input type="text" name="grade" value="<%= existingGrade %>" required><br><br>
         <button type="submit" value="Update">Submit</button>
     </form>
 </center>
<%
 }
}

String updatedName = request.getParameter("name");
String updatedAgeStr = request.getParameter("age");
String updatedGrade = request.getParameter("grade");

if (updatedName != null && updatedAgeStr != null && updatedGrade != null) {
 int updatedAge = Integer.parseInt(updatedAgeStr);

 // Update the data in the database
 String updateQuery = "UPDATE student SET name=?, age=?, grade=? WHERE id=?";
 PreparedStatement updateStatement = con.prepareStatement(updateQuery);
 updateStatement.setString(1, updatedName);
 updateStatement.setInt(2, updatedAge);
 updateStatement.setString(3, updatedGrade);
 updateStatement.setInt(4, Integer.parseInt(idStr));
 updateStatement.executeUpdate();
 response.sendRedirect("student.jsp");
}
%>
</body>
</html>
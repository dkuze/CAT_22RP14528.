<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="logo">
		<img src="image/logo.png" width="200px">
	</div>
<div class="cantainer">
	<h1>EMPLOYEE MANAGEMENT SYSTEM</h1><br>
<div class="image">
		<img src="image/image.jpg">
	</div>

	<div class="contents">
   <form method="POST">
   	<h2></h2>
		  <hr>
	username:<input type="text" name="name" placeholder=""><br><br>
	weight:<input type="text" name="quantity" placeholder=""><br><br>
	salary:<input type="text" name="price" placeholder=""><br><br>
   	<button  name="submit">Send</button>
   </form>
   </div>
    <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                
                String url = "jdbc:mysql://localhost:3306/employee_22rp14528";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO employee (employeecod,weight,saraly) VALUES (?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, weight);
                    pstmt.setString(3, saraly);
                   
                    pstmt.executeUpdate();

                    out.println("<h3>New employee Recorded Successful!</h3>");
                    out.println("<p>Name: " + name + "</p>");
                    response.sendRedirect("dashboard.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
        
</body>
</html>
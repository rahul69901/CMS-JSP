<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
</head>
<body>
    <h2>Student Records</h2>
    <table border="1">
        <tr>
            <th>Name</th>
        </tr>
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university-management-system", "root", "");
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM registration")) {

                while (rs.next()) {
                    String name = rs.getString("name");
        %>
        <tr>
            <td><%= name %></td>
        </tr>
        <% 
                }
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='2'>Error retrieving data</td></tr>");
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>

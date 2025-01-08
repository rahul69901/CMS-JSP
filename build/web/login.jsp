<%-- 
    Document   : login
    Created on : 22 Sep, 2024, 2:07:44 PM
    Author     : sgaha
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
        String password = request.getParameter("password");
        
        try {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university-management-system", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from registration where name=? and password=? ");
            ps.setString(1, name);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
//                out.println("login successful");
                response.sendRedirect("dashboard.html");
            } else {
                out.println("log in failed");
            }

        } 
        catch (Exception e) {
            System.out.println(e);
        }
        
    
            
        %>
    </body>
</html>

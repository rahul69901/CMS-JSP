<%-- 
    Document   : create
    Created on : 22 Sep, 2024, 4:22:15 PM
    Author     : sgaha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
response.setContentType("text/html;charset=UTF-8");
        String s=request.getParameter("student-id");
        String p=request.getParameter("password");
        String n=request.getParameter("name");
        long m=Long.parseLong(request.getParameter("mobile"));
        String a=request.getParameter("address");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
            PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,p);
            ps.setString(3,n);
            ps.setLong(4,m);
            ps.setString(5,a);
            int x=ps.executeUpdate();
            if (x > 0) {
                out.println("Registration successful");
//                response.sendRedirect("payment.html");
            } else {
                out.println("Registration failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            
             }
        %>
    </body>
</html>

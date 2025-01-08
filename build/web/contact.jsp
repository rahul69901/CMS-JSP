<%-- 
    Document   : contact
    Created on : 22 Sep, 2024, 4:18:09 PM
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
String s=request.getParameter("name");
        String p=request.getParameter("email");
        String n=request.getParameter("subject");
        String a=request.getParameter("message");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/university-management-system","root","");
            PreparedStatement ps=con.prepareStatement("insert into contact values(?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,p);
            ps.setString(3,n);
            ps.setString(4,a);
            int x=ps.executeUpdate();
            if (x > 0) {
//                out.println("Yor Message has been Recorded successfully ");
                response.sendRedirect("payment.html");
            } else {
                out.println("FAiled due to some ERROR!!! ");
            }
        } catch (Exception e) {
            e.printStackTrace();
            
             }

        
        %>
    </body>
</html>

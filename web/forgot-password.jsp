<%-- 
    Document   : forgot-password
    Created on : 22 Sep, 2024, 4:25:31 PM
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
           String name = request.getParameter("name");
        String password = request.getParameter("password");
        
        try {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
            PreparedStatement ps = con.prepareStatement("UPDATE registration set password=? where name=? ");
            ps.setString(1, password);
            ps.setString(2, name);
            int i=ps.executeUpdate();
            if (i>0) {
                response.sendRedirect("payment.html");
//                out.println("password update successful");
            } else {
                out.println("password update failed");
            }

        } 
        catch (Exception e) {
            System.out.println(e);
        }
        out.close();
    
    
        %>
    </body>
</html>

<%-- 
    Document   : borrar
    Created on : Feb 13, 2021, 9:56:27 PM
    Author     : allis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        try{
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
st=con.createStatement();
st.executeUpdate("delete from empledos where id='"+request.getParameter("id")+"';");
request.getRequestDispatcher("consulta.jsp").forward(request,response);
        }catch(Exception e){
out.print("Error: "+e);
}

        %>
        
        
    </body>
</html>

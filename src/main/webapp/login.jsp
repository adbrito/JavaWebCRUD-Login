<%-- 
    Document   : login
    Created on : Feb 13, 2021, 10:08:36 PM
    Author     : allis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Login</title>
    </head>
    <body>
        <form></form><div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form  action="login.jsp" method="POST">
                        <div class="form-group">
                            <label for="usuario" class="form-label">Usuario</label>
                            <input type="text" id="usuario" class="form-control" name="usuario" placeholder="Usuario" required="required">
                        </div>
                        <div class="form-group">
                            <label for="passwd" class="form-label">Contraseña</label>
                            <input type="password" id="passwd" class="form-control" name="passwd" placeholder="Contraseña" required="required">
                        </div>


                        <button type="submit" name="login" class="btn btn-primary">Login <i class="fa fa-save"></i>
                        </button>
                    </form>
                    <%
Connection con = null;
        Statement st=null;
        ResultSet rs=null;


if(request.getParameter("login")!=null){
        String user= request.getParameter("usuario");
        String passwd= request.getParameter("passwd");
        HttpSession sesion = request.getSession();


try{
Class.forName("com.mysql.jdbc.Driver");
                             con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                             st=con.createStatement();
                             rs=st.executeQuery("SELECT * FROM `user` where user='"+user +"' and password='"+passwd+"';");
                             while(rs.next()){
sesion.setAttribute("logueado","1");
sesion.setAttribute("user",rs.getString("user"));
sesion.setAttribute("id",rs.getString("id"));
response.sendRedirect("consulta.jsp");
}
out.print("<div class='alert alert-danger' role='alert'>Usuario no válido!</div>");
}catch(Exception e){
out.print("error: "+ e);
}





}

    %>
                </div>
            </div>
        </div> 
    </body>
    
</html>

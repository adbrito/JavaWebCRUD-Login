<%-- 
    Document   : datosUsuario
    Created on : Feb 14, 2021, 5:51:48 PM
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
        <title>Usuario</title>
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("logueado")==null || sesion.getAttribute("logueado").equals("0")){
            response.sendRedirect("login.jsp");
        }
        Connection con = null;
        Statement st=null;
        
        
        
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="datosUsuario.jsp" method="POST">
                        <div class="mb-3">
                            <label for="usuario" class="form-label">User</label>
                            <input type="text" class="form-control" id="usuario" name="usuario" value="<%= sesion.getAttribute("user")%>">
                        </div>
                        <div class="mb-3">
                            <label for="passwd" class="form-label">Password</label>
                            <input type="password" class="form-control" id="passwd" name="passwd">
                        </div>
                        <div class="mb-3">
                            <label for="passwdR" class="form-label">Repita contraseña</label>
                            <input type="password" class="form-control" id="passwdR" name="passwdR">
                        </div>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        <a href="consulta.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>
        <%
            if(request.getParameter("guardar")!=null){
                String user= request.getParameter("usuario");
                String passwd= request.getParameter("passwd");
                String passwd1=request.getParameter("passwdR");
                if(passwd.equals(passwd1)){
                    try{
                        
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                        st=con.createStatement();
                        st.executeUpdate("update user set user='"+user+"', password='"+passwd+ "' where id='"+sesion.getAttribute("id")+"';");
                        sesion.setAttribute("usuario",user);
                        response.sendRedirect("consulta.jsp");
                        //request.getRequestDispatcher("consulta.jsp").forward(request,response);
                        }catch(Exception e){
                        out.print("Error: "+ e);
                        }
                }else{
                    out.print("Password no coincide!");
                }
            }
        %>
    </body>
</html>

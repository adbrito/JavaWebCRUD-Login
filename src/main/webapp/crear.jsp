<%-- 
    Document   : crear
    Created on : Feb 13, 2021, 8:58:08 PM
    Author     : allis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Empleado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="crear.jsp" method="POST">
                        <div class="form-group">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" class="form-control" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" id="direccion" class="form-control" name="direccion" placeholder="Dirección" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="text" id="nombre" class="form-control" name="telefono" placeholder="Telefono" required="required">
                        </div>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-save"></i>

                        </button>
                    </form>
                </div>
            </div>
        </div> 
        <%
        if(request.getParameter("enviar")!=null){
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

try{
Connection con=null;
Statement st=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
st=con.createStatement();
st.executeUpdate("INSERT INTO empledos(nombre,direccion,telefono) values('"+nombre+"','"+direccion+"','"+telefono+"');");
request.getRequestDispatcher("consulta.jsp").forward(request,response);
}catch(Exception e){
out.print("Error: "+ e);
}

        }
        %>
    </body>
</html>

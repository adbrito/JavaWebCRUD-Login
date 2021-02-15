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
        <title>Editar empleado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <%
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="GET">
                        <div class="form-group">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" id="nombre" class="form-control" value="<%= nombre%>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        <div class="form-group">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" id="direccion" class="form-control" value="<%= direccion%>" name="direccion" placeholder="Dirección" required="required">
                        </div>
                        <div class="form-group">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="text" id="nombre" class="form-control" name="telefono" value="<%= telefono%>"  placeholder="Telefono" required="required">
                        </div>
                        <a href="consulta.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban"></i></a>
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-save"></i>
                            <input type="hidden"  name="id" value="<%= id%>">
                        </button>
                    </form>
                </div>
            </div>
        </div> 
        <%
        if(request.getParameter("enviar")!=null){
        

try{
Connection con=null;
Statement st=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
st=con.createStatement();
st.executeUpdate("update empledos set nombre='"+nombre+"',direccion='"+direccion+"',telefono='"+telefono+"'where id='"+id+"';");
//request.getRequestDispatcher("consulta.jsp").forward(request,response);
}catch(Exception e){
out.print("Error: "+ e);
}

        }
        %>
    </body>
</html>

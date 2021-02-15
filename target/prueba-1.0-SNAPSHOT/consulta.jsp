<%-- 
    Document   : consulta
    Created on : Feb 13, 2021, 5:38:26 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <%
        HttpSession sesion = request.getSession();
        if( sesion.getAttribute("logueado")==null || sesion.getAttribute("logueado").equals("0")){
            response.sendRedirect("login.jsp");
        }
        Connection con = null;
        Statement st=null;
        ResultSet rs=null;
        
        %>
        <div class="container mt-2">
            <nav class="navbar navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">Empleados</a>
                    <form class="d-flex" action="logout.jsp">
                        <a href="datosUsuario.jsp"><i class="fa fa-user"></i></a>
                        <%= sesion.getAttribute("user") %>
                        <button class="btn btn-outline-danger ml-2" type="submit">Log out</button>
                    </form>
                </div>
            </nav>
            <div class="row">
                <div class="col-sm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center">Empleados</th>
                                <th scope="col">
                                    <a href="crear.jsp"> <i class="fa fa-user-plus"></i></a>


                                </th>
                            </tr>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Telefóno</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                         try{
                             Class.forName("com.mysql.jdbc.Driver");
                             con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=root&password=");
                             st=con.createStatement();
                             rs=st.executeQuery("SELECT * FROM `empledos`;");
                             while(rs.next()){
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1) %></th>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getString(4) %></td>
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1) %>&nombre=<%= rs.getString(2) %>&direccion=<%= rs.getString(3) %>&telefono=<%= rs.getString(4) %>"> <i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrar.jsp?id=<%= rs.getString(1) %>" class="ml-5"><i class="fa fa-trash"></i></a>



                                </td>

                            </tr>


                            <%
                                }
                            }catch(Exception e){
                                out.print("Error: "+e);
                            }
                            %>





                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

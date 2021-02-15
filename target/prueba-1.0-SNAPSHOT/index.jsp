<%-- 
    Document   : index
    Created on : Feb 12, 2021, 4:47:57 PM
    Author     : allis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="index.jsp" method="POST">
                        <div class="form-group">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" >
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="form-group">
                            <label for="edad" class="form-label">Edad</label>
                            <input type="number" class="form-control" name="edad">
                        </div>

                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <% 
                            String nombre = request.getParameter("nombre");
                            String edad = request.getParameter("edad");
                            
                            if(nombre!=null && edad!=null){
                              int age = Integer.parseInt(edad);
                                if(age <18 && age>=1){
                                    out.print("Es menor de edad");
                                }
                                else{
                                String saludo = "Hola, " + nombre + " . Tienes " + edad + " añosm.";
                                                                    out.print(saludo);
                                }
                            }
                            else{
                                out.print("Debe ingresar nombre y edad");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

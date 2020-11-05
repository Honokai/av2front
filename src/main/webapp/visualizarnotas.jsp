<%-- 
    Document   : visualizarnotas
    Created on : 29 de out de 2020, 19:56:28
    Author     : eff
--%>
<%@page import="com.av2front.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluno - Visualizar notas</title>
        <%@include file="../scripts.html" %>
        <script type="text/javascript" src="js/visualizar.js"></script>
       <% 
            if(session.getAttribute("usuario") != null) {
                Usuario usuario = (Usuario) session.getAttribute("usuario");
        %>
    </head>
    <body>
        <%@include file="../navbar.jsp" %>
        <div class="container-fluid black" style="padding: 10px;">
            <div class="row">
                <% 
                    if(session.getAttribute("usuario") != null) {
                        if( usuario.getAcesso() == 777) { 
                %>
                        <div class="col-9"> 
                            <div id="notas" style="color: #000;">

                            </div>
                        </div>
                        <div class="card col-3 centro">
                            <form action="" method="POST" id="formulario" style="color: #000">
                                <h5>Selecione o aluno</h5>
                                <div class="form-group">
                                <select class="form-control custom-select" name="selectaluno" id="selectaluno">
                                    <option value=""></option>
                                </select>
                                </div>
                                <button type="submit" id="submit" class="btn btn-primary">Buscar</button>
                            </form>
                        </div>
                <%  } else {
                            
                %>
                
              <% } 
                    } 
              } else {
                response.sendRedirect("login.jsp");
              }
              %>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : aluno
    Created on : 8 de nov de 2020, 16:30:10
    Author     : eff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Aluno</title>
        <link href="/av2front/css/login.css" rel="stylesheet" type="text/css">
        <link href="/av2front/css/style.css" rel="stylesheet" type="text/css">
        <link href="/av2front/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="/av2front/js/jquery-3.5.1.slim.min.js"></script>
        <script type="text/javascript" src="/av2front/js/popper.min.js"></script>
        <script type="text/javascript" src="/av2front/js/bootstrap.min.js"></script>
        <% if(session.getAttribute("usuario") != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if( usuario.getAcesso() != 777) {
                response.sendRedirect("visualizarnotas.jsp");
             } else {}
        } else {
            response.sendRedirect("login.jsp");
        }
        %>
    </head>
    <body>
        <%@ include file= "../navbar.jsp" %>
        <div class="container-fluid black" style="padding: 10px;">
            <div class="row">
                <div class="col centro">
                    <form action="" method="POST" id="formulario">
                        <% if(request.getParameter("mensagem") != null) {%>
                        <% if( request.getParameter("mensagem").equals("0")) { %>
                                <script>
                                    Swal.fire({
                                        title: 'Legal!',
                                        html: "Dados inseridos",
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    })
                                </script>
                            <% } else { %>
                                    <%  if (request.getParameter("mensagem").equals("3")) { %>
                                       <script>
                                           Swal.fire({
                                               title: 'Exclusão!',
                                               html: "Registro excluído com sucesso.",
                                               icon: 'success',
                                               confirmButtonText: 'OK'
                                           })
                                        </script>
                                     <% } else { %>
                                            <script>
                                           Swal.fire({
                                               title: 'Eita!',
                                               html: "Parece que ocorreu um erro.",
                                               icon: 'error',
                                               confirmButtonText: 'OK'
                                           })
                                        </script>
                                      <% }%>
                            <% }%>
                        <% }%>
                        <div class="form-group" style="text-align: center">
                          <label for="aluno_nome">Nome do aluno</label>
                          <input class="form-control" type="text" id="aluno_nome" name="aluno_nome">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <input class="form-control" type="email" id="email" name="email" >
                        </div>
                        <div class="form-group" style="text-align: center">
                          <label for="aluno_cpf">CPF</label>
                          <input class="form-control" type="text" id="aluno_cpf" name="aluno_cpf">
                        </div>
                        <div class="form-group" style="text-align: center">
                            <label for="curso_nome">Curso</label>
                            <select class="form-control custom-select" name="curso_nome" id="curso_nome">
                                <option value=""></option>
                            </select>
                        </div>
                        <button type="submit" id="submit" class="btn btn-primary">Adicionar/Atualizar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

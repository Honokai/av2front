<%-- 
    Document   : gerenciarnotas
    Created on : 27 de out de 2020, 09:26:31
    Author     : eff
--%>

<%@page import="com.av2front.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de nota</title>
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/notas.js"></script>
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
<%@ include file= "./navbar.jsp" %>
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
                  <label for="acao">Tipo de ação</label>
                  <select class="form-control custom-select" name="acao" id="acao">
                      <option value=""></option>
                      <option value="adicionar">Adicionar nota</option>
                      <option value="atualizar">Atualizar nota</option>
                  </select>
                </div>
                <div class="form-group" style="text-align: center">
                  <label for="selectaluno">Aluno</label>
                  <select class="form-control custom-select" name="selectaluno" id="selectaluno">
                      <option value=""></option>
                  </select>
                </div>
                <div class="form-group" style="text-align: center">
                    <select class="form-control custom-select" name="id_disciplina" id="id_disciplina" hidden>
                        <option value=""></option>
                    </select>
                    <label for="disciplina">Disciplina</label>
                    <select class="form-control custom-select" name="disciplina" id="disciplina">
                        <option value=""></option>
                    </select>
                </div>
                <div class="form-group" style="text-align: center">
                    <label for="professor">Professor</label>
                    <select class="form-control custom-select" name="professor" id="professor">
                        <option value=""></option>
                    </select>
                </div>
                <div class="row">
                    <div class="col form-group">
                        <div style="text-align: center">(utilize "." para casas decimais)</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col form-group">
                        <label for="av1">Av1</label>
                        <input class="form-control" id="av1" name="av1" placeholder="0.00" type="number" pattern="[0-1]?[0-8][.][0-9][0-9]"/>
                    </div>
                    <div class="col form-group">
                        <label for="av2">Av2</label>
                        <input class="form-control" id="av2" name="av2" placeholder="0.00" type="number" pattern="[0-1]?[0-8][.][0-9][0-9]"/>
                    </div>
                    <div class="col form-group">
                        <label for="av3">Av3</label>
                        <input class="form-control" id="av3" name="av3" placeholder="0.00" type="number" pattern="[0-1]?[0-8][.][0-9][0-9]"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col form-group">
                        <label for="aps1">Aps1</label>
                        <input class="form-control" id="aps1" name="aps1" placeholder="0.00" type="number" pattern="[0-1]?[0-8][.][0-9][0-9]"/>
                    </div>
                    <div class="col form-group">
                        <label for="acao">Aps2</label>
                        <input class="form-control" id="aps2" name="aps2" placeholder="0.00" type="number" pattern="[0-1]?[0-8][.][0-9][0-9]"/>
                    </div>
                </div>
                <button type="submit" id="submit" class="btn btn-primary">Criar/Atualizar registro</button>
                <button type="submit" id="apagar" class="btn btn-danger">Apagar registro</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
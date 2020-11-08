<%-- 
    Document   : index.jsp
    Created on : 26 de out de 2020, 13:18:55
    Author     : eff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
        <%@include file="./scripts.html" %>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="container-fluid" style="padding: 10px">
            <div class="row">
                <div class="col-4" style="margin-top: 10%">
                    <div class="card">
                        <div class="card-header">
                             <h5>Cadastro de alunos</h5>
                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                Crie registros de seus clientes na base de dados e providencia um meio de registro para o mesmo visualizar suas informações.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4" style="margin-top: 10%">
                    <div class="card">
                        <div class="card-header">
                             <h5>Gerenciamento de notas</h5>
                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                Gerenciamento de notas dos alunos com auto carregamento das disciplinas que o mesmo está matriculado.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4" style="margin-top: 10%">
                    <div class="card">
                        <div class="card-header">
                             <h5>Gerenciamento de notas</h5>
                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                Gerenciamento de notas dos alunos com auto carregamento das disciplinas que o mesmo está matriculado.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : login
    Created on : 26 de out de 2020, 13:33:23
    Author     : eff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entrar</title>
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="./navbar.jsp" %>
<div id="root">
    <div class="container-fluid altura centro login">
        <div class="camada">
            <div class="card margin-top-15%">
                <div class="card-body">
                    <h5 class="card-title">Entrar</h5>
                    <form action="ver/validacao.jsp" method="post">
                    <div class="a-esquerda" id="nome">
                        <label>E-mail</label>
                        <input class="form-control" id="email" name="email" type="text" placeholder="Usuário"> 
                    </div>
                    <div class="a-esquerda" id="pass">
                        <label for="senha">Senha</label>
                        <input class="form-control" id="senha" name="senha" type="password" placeholder="Senha">
                    </div>
                        ${message}
                        <% 
                            if(session.getAttribute("message") != null){
                                session.removeAttribute("message");
                            }
                        %>
                    <div class="links">
                        <a href="registrar.jsp">Não tem conta? Crie uma aqui</a>
                    </div>
                    <button class="btn btn-primary margin-top-10" type="submit">Entrar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

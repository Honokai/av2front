<%-- 
    Document   : registrar
    Created on : 26 de out de 2020, 14:03:46
    Author     : eff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar-se</title>
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
<body>

<div id="root">
    <div class="container-fluid altura centro login">
        <div class="camada">
            <div class="card margin-top-15%">
                <div class="card-body">
                    <h5 class="card-title">Registro</h5>
                    <form action="ver/registro.jsp" method="get">
                        <div class="a-esquerda" id="nomediv">
                            <label>Nome</label>
                            <input class="form-control" id="nome" name="nome" type="text" placeholder="nome" required> 
                        </div>
                        <div class="a-esquerda" id="nomeemail">
                            <label>E-mail</label>
                            <input class="form-control" id="email" name="email" type="email" placeholder="E-mail" required> 
                        </div>
                        <div class="a-esquerda" id="nomeemailconfirmacao">
                            <label>Confirme o E-mail</label>
                            <input class="form-control" id="emailconf" name="emailconf" type="email" placeholder="Usuário" required> 
                        </div>
                        <div class="a-esquerda" id="passdiv">
                            <label for="senha">Senha</label>
                            <input class="form-control" id="senha"  name="senha" type="password" placeholder="Senha" required> 
                        </div>
                        <div class="a-esquerda" id="passdivconf">
                            <label for="senha">Confirmar senha</label>
                            <input class="form-control" id="senhaconf"  name="senhaconf" type="password" placeholder="Senha" required> 
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

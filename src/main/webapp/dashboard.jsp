<%-- 
    Document   : dashboard
    Created on : 26 de out de 2020, 13:38:48
    Author     : eff
--%>

<%@page import="com.av2front.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visão Geral</title> 
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <%   
        if(session.getAttribute("usuario") != null) {
                Usuario user = (Usuario) session.getAttribute("usuario");
                if( user.getAcesso() != 777) {
                    response.sendRedirect("visualizarnotas.jsp");
                }
        } else {
            response.sendRedirect("login.jsp");
        }
    %>

</head>
<body>
<%@ include file="./navbar.jsp" %>
<div class="container-fluid black" id="dash" style="padding: 10px;">
    <div class="row">
        <div class="col-4"><canvas id="myChart"></canvas></div>
        <div class="col-4"><canvas id="myChart2"></canvas></div>
        <div class="col-4"><canvas id="myChart3"></canvas></div>
    </div>
    <div class="row">
        <div class="col-12 centro">
            <h3>Médias gerais</h3>
            <span class="pequeno">(os valores mostrados aqui contabilizam a nota de todas as disciplinas somadas e divididas)</span>
        </div>
    </div>
    <div class="row" id="average" style="justify-content: center;">
        <div class="card col-1 av" id="av1"></div>
        <div class="card col-1 av" id="av2"></div>
        <div class="card col-1 av" id="av3"></div>
        <div class="card col-1 desvio" id="desvioav1"></div>
        <div class="card col-1 desvio" id="desvioav2"></div>
        <div class="card col-1 desvio" id="desvioav3"></div>
        <div class="card col-1 avs" id="maiorav1"></div>
        <div class="card col-1 avs" id="menorav1"></div>
        <div class="card col-1 avs" id="maiorav2"></div>
        <div class="card col-1 avs" id="menorav2"></div>
        <div class="card col-1 avs" id="maiorav3"></div>
        <div class="card col-1 avs" id="menorav3"></div>
    </div>
    <div class="notas-area">
        <p>
            <a class="btn btn-primary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Mostras notas individuais</a>
        </p>
        <div class="row">
            <div class="col">
                <div class="collapse multi-collapse" id="collapse">
                    <div class="card card-body" id="notas" style="color: #000;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
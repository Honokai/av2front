<%-- 
    Document   : navbar
    Created on : 26 de out de 2020, 13:32:30
    Author     : eff
--%>

<%@page import="com.av2front.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/av2front/index.jsp">Universidade</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto"> 
            <% 
            HttpSession sessao = request.getSession(true);
            if(sessao.getAttribute("logado") != "1") {%>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
             <% } else { %>
                <li class="nav-item">
                    <strong class="nav-link">Bem-vindo, <span id="nomeUsuario">${usuario.nome}</span></strong>
                </li>
             <% } %>
            <%  if(session.getAttribute("usuario") != null) {
                        Usuario user = (Usuario) session.getAttribute("usuario");
                        if( user.getAcesso() == 777) {
             %>
                <li class="nav-item dropdown">
                   <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Mais ações
                   </a>
                   <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <a class="dropdown-item" href="gerenciarnotas.jsp">Gerenciar notas</a>
                       <a class="dropdown-item" href="visualizarnotas.jsp">Visualizar nota</a>
                   </div>
               </li>
               <li class="nav-item">
                   <a class="nav-link" href="dashboard.jsp">Dashboard</a>
               </li>
             <%   
                 } else {  %>
                 <li class="nav-item">
                   <a class="nav-link" href="visualizarnotas.jsp">Visualizar nota</a>
               </li>
               <% }  } %>
                <% 
                    sessao = request.getSession(true);
                    if(sessao.getAttribute("logado") == "1") {%>
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/av2front/ver/sair.jsp">Sair</a>
                        </li>
               <% } %>
            
        </ul>
    </div>
</nav>

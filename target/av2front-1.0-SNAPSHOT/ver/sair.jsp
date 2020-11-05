<%-- 
    Document   : sair
    Created on : 3 de nov de 2020, 17:02:29
    Author     : eff
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saindo ...</title>
    </head>
    <body>
        <%
            if (session != null) {
            session.removeAttribute("usuario");
            session.removeAttribute("logado");
            response.sendRedirect("../login.jsp");
        }
        %>
    </body>
</html>

<%-- 
    Document   : registro
    Created on : 3 de nov de 2020, 17:26:30
    Author     : eff
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.av2front.UsuarioDAO"%>
<%@page import="com.av2front.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrando ...</title>
    </head>
    <body>
        <% 
            try {
                Usuario user = new UsuarioDAO().registrar(request.getParameter("email"), 
                request.getParameter("nome"), request.getParameter("senha"), 0);
                
                String destPage = "../login.jsp";

                if (user != null) {
                    session.setAttribute("usuario", user);
                    session.setAttribute("logado", "1");
                    destPage = "../dashboard.jsp";
                } else {
                    String message = "Não foi possível efetuar o cadastro.";
                    session.setAttribute("message", message);
                }
                response.sendRedirect(destPage);

            } catch (SQLException | ClassNotFoundException ex) {
                throw new ServletException(ex);
            }
        %>
    </body>
</html>

<%-- 
    Document   : validacao
    Created on : 3 de nov de 2020, 16:15:38
    Author     : eff
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.av2front.Usuario"%>
<%@page import="com.av2front.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             try {
                Usuario user = new UsuarioDAO().checkLogin(request.getParameter("email"), request.getParameter("senha"));
                String destPage = "../login.jsp";

                if (user != null) {
                    session.setAttribute("usuario", user);
                    session.setAttribute("logado", "1");
                    destPage = "../dashboard.jsp";
                } else {
                    String message = "E-mail ou senha inválido.";
                    session.setAttribute("message", message);
                }
                response.sendRedirect(destPage);
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
        %>
    </body>
</html>

<%-- 
    Document   : excluir
    Created on : 31 de out de 2020, 13:02:56
    Author     : eff
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page language="java" import="com.av2front.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar</title>
    </head>
    <body>
        <% 
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/universidade?serverTimezone=America/Fortaleza",
                "root","865358");
            String query = "Delete from disciplina where id=? and aluno_id=? and professor_id=?";
            
            PreparedStatement consulta = (PreparedStatement) conexao.prepareStatement(query);
            consulta.setString(1, request.getParameter("id_disciplina")); 
            consulta.setFloat(2, Float.parseFloat(request.getParameter("selectaluno"))); 
            consulta.setFloat(3, Float.parseFloat(request.getParameter("professor")));
            
            consulta.executeUpdate();
            conexao.close();
            response.sendRedirect("../gerenciarnotas.jsp?mensagem=3");
        } catch (SQLException sql){
            out.print(sql.toString());
            //response.sendRedirect("../gerenciarnotas.jsp?mensagem=1");
        }
        
        %>
    </body>
</html>


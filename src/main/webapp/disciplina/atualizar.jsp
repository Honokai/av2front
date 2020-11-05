<%-- 
    Document   : atualizar
    Created on : 26 de out de 2020, 14:08:26
    Author     : eff
--%>

<%@page import="com.av2front.BancoConexao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.ArrayList"%>
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
            Connection conexao = new BancoConexao().conexao();
            String query = "Update disciplina set disciplina=?, av1=?, av2=?, av3=?, aps1=?, aps2=? where aluno_id=? and professor_id=? and id=?";
            
            PreparedStatement consulta = (PreparedStatement) conexao.prepareStatement(query);
            consulta.setString(1, request.getParameter("disciplina")); 
            consulta.setFloat(2, Float.parseFloat(request.getParameter("av1"))); 
            consulta.setFloat(3, Float.parseFloat(request.getParameter("av2")));  
            consulta.setFloat(4, Float.parseFloat(request.getParameter("av3")));
            consulta.setFloat(5, Float.parseFloat(request.getParameter("aps1")));
            consulta.setFloat(6, Float.parseFloat(request.getParameter("aps2")));
            consulta.setInt(7, Integer.parseInt(request.getParameter("selectaluno")));
            consulta.setInt(8, Integer.parseInt(request.getParameter("professor")));
            consulta.setInt(9, Integer.parseInt(request.getParameter("id_disciplina")));
            consulta.execute();
            response.sendRedirect("../gerenciarnotas.jsp?mensagem=0");
            conexao.close();
        } catch (SQLException sql){
            out.print(sql.toString());
            //response.sendRedirect("../gerenciarnotas.jsp?mensagem=1");
        }
        
        %>
    </body>
</html>

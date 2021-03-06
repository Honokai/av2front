<%-- 
    Document   : todas
    Created on : 26 de out de 2020, 14:08:26
    Author     : eff
--%>

<%@page import="com.av2front.BancoConexao"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        try{
           Connection conexao = new BancoConexao().conexao();
            Statement consulta = (Statement) conexao.createStatement();
            List<Map<String, Object>> linhas = new ArrayList<>();
            ResultSet resultado = consulta.executeQuery("select materia as nome from materias");
            ResultSetMetaData meta = resultado.getMetaData();
            Integer contColuna = meta.getColumnCount();
            while(resultado.next()){
                Map<String, Object> linha = new HashMap<>();
                for(Integer i=1; i<= contColuna; i++){
                    String nomeColuna = meta.getColumnLabel(i);
                    Object valorColuna = resultado.getObject(i);
                    linha.put(nomeColuna, valorColuna);
                }
                linhas.add(linha);
            }
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(response.getOutputStream(), linhas);
        } catch (SQLException sql){
            out.print(sql.toString());
        }
        
        %>
    </body>
</html>

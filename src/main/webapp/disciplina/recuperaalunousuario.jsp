<%-- 
    Document   : recuperaalunousuario
    Created on : 20/11/2020, 15:20:26
    Author     : moises.ximenes
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
            ResultSet resultado = consulta.executeQuery("SELECT d.disciplina,d.av1,d.av2,d.av3,d.aps1,d.aps2,a.nome"
            +" as aluno,p.professor as professor"
            + " FROM disciplina d INNER JOIN aluno a on d.aluno_id = a.id "
            + "INNER JOIN professor p on d.professor_id = p.id"
            + " where a.usuario_id="+request.getParameter("usuario"));
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
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(response.getOutputStream(), sql.toString());
        }
        
        %>
    </body>
</html>

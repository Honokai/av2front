/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.av2front;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author eff
 */
public class UsuarioDAO {
    public Usuario checkLogin(String email, String senha) throws SQLException, ClassNotFoundException {
        Connection conexao = new BancoConexao().conexao();
        String sql = "SELECT * FROM usuarios WHERE email = ? and senha = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, senha);
 
        ResultSet result = statement.executeQuery();
 
        Usuario usuario = null;
 
        if (result.next()) {
            usuario = new Usuario();
            usuario.setId(Integer.parseInt(result.getString("id")));
            usuario.setNome(result.getString("nome"));
            usuario.setAcesso(result.getInt("papel"));
        }
 
        conexao.close();
 
        return usuario;
    }
    
    /**
     * Função responsável por efetuar o registro do aluno no banco de dados
     * @param email
     * @param nome
     * @param senha
     * @param papel padrão é 0
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public Usuario registrar(String email, String nome, String senha, Integer papel) throws SQLException, ClassNotFoundException {
        Connection conexao = new BancoConexao().conexao();
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        PreparedStatement statement = conexao.prepareStatement(sql);
        statement.setString(1, email);
         ResultSet result = statement.executeQuery();
         Usuario usuario = new Usuario();
         if(result.next()) {
             return usuario;
         } else {
             
             String insert = "INSERT INTO usuarios(nome, email, senha, papel) VALUES (?,?,?,?)";
             statement = conexao.prepareStatement(insert);
             statement.setString(1, nome);
             statement.setString(2, email);
             statement.setString(3, senha);
             statement.setInt(4, papel);
             if(statement.executeUpdate() > 0){
                usuario.setNome(nome);
                usuario.setAcesso(papel);
                return usuario;
             } else {
                 return usuario;
             }
         }
    }
    
}

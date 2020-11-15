/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.av2front;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author eff
 */
public class BancoConexao {
    
    private String servidor, porta, banco, login, senha;
    
    public BancoConexao() {
        this.servidor = "127.0.0.1";
        this.porta = "3306";
        this.banco = "universidade";
        this.login = "root";
        this.senha = "865358";
    }
    
    public Connection conexao() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return (Connection) DriverManager.getConnection("jdbc:mysql://"+getServidor()
                +":"+ getPorta()+"/"+getBanco()+"?serverTimezone=America/Fortaleza", getLogin(), getSenha());
    }

    public String getServidor() {
        return servidor;
    }

    public void setServidor(String servidor) {
        this.servidor = servidor;
    }

    public String getPorta() {
        return porta;
    }

    public void setPorta(String porta) {
        this.porta = porta;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
}
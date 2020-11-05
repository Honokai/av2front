/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.av2front;

/**
 *
 * @author eff
 */
public class Disciplina {
    
    public Disciplina(){}
    
    private Integer id;
    private Integer professor_id;
    private Integer aluno_id;
    private String nome;
    private Float av1;
    private Float av2;
    private Float av3;
    private Float aps1;
    private Float aps2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Float getAv1() {
        return av1;
    }

    public void setAv1(Float av1) {
        this.av1 = av1;
    }
    
    public Float getAv2() {
        return av2;
    }

    public void setAv2(Float av2) {
        this.av2 = av2;
    }

    public Float getAv3() {
        return av3;
    }

    public void setAv3(Float av3) {
        this.av3 = av3;
    }

    public Float getAps1() {
        return aps1;
    }

    public void setAps1(Float aps1) {
        this.aps1 = aps1;
    }

    public Float getAps2() {
        return aps2;
    }

    public void setAps2(Float aps2) {
        this.aps2 = aps2;
    }

    public Integer getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(Integer professor_id) {
        this.professor_id = professor_id;
    }

    public Integer getAluno_id() {
        return aluno_id;
    }

    public void setAluno_id(Integer aluno_id) {
        this.aluno_id = aluno_id;
    }
    
}

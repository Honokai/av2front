CREATE DATABASE IF NOT EXISTS universidade CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

USE universidade;

CREATE TABLE IF NOT EXISTS universidade.curso
(
    id    int auto_increment
        primary key,
    curso varchar(120) not null
);

CREATE TABLE IF NOT EXISTS usuarios
(
    id    int auto_increment
        primary key,
    email varchar(45) not null,
    senha varchar(200) not null,
    nome  varchar(45) not null,
    papel int(11)         not null
);


CREATE TABLE IF NOT EXISTS universidade.aluno
(
    id       int auto_increment
        primary key,
    nome     varchar(120) not null,
    curso_id int          not null,
    usuario_id int not null,
    constraint aluno_ibfk_1 foreign key (curso_id) references curso (id),
    constraint usuario_ibfk_1 foreign key (usuario_id) references usuarios (id)
);

CREATE TABLE IF NOT EXISTS universidade.materias
(
    id int auto_increment primary key,
    materia varchar(150) null,
    constraint materia
        unique (materia)
);

CREATE TABLE IF NOT EXISTS universidade.professor
(
    id        int auto_increment
        primary key,
    professor varchar(120) not null,
    usuario_id int not null,
    constraint usuario_fk_1 foreign key (usuario_id) references usuarios (id)
);

CREATE TABLE IF NOT EXISTS universidade.disciplina
(
    id           int auto_increment
        primary key,
    disciplina   varchar(120)     not null,
    av1          double default 0 null,
    av2          double default 0 null,
    av3          double default 0 null,
    aps1         double default 0 null,
    aps2         double default 0 null,
    aluno_id     int              null,
    professor_id int              null,
    constraint disciplina_ibfk_1
        foreign key (aluno_id) references aluno (id)
            on delete set null,
    constraint disciplina_ibfk_2
        foreign key (professor_id) references professor (id)
            on delete set null
);

create index alunoId
    on disciplina (aluno_id);

create index professorId
    on disciplina (professor_id);

create trigger valor_maximo_insert
    before insert
    on disciplina
    for each row
BEGIN
    if NEW.av1 > 7 or NEW.av2 > 8 or NEW.av3 > 10 or NEW.aps1 > 3 or NEW.aps2 > 2 then
        signal sqlstate '41200' set message_text = 'Erro: Valores informados acima do permitido.';
    end if;
    if NEW.av1 < 0 or NEW.av2 < 0 or NEW.av3 < 0 or NEW.aps1 < 0 or NEW.aps2 < 0 then
        signal sqlstate '41200' set message_text = 'Erro: Valores informados abaixo do permitido.';
    end if;
end;

create trigger valor_maximo_update
    before update
    on disciplina
    for each row
BEGIN
    if NEW.av1 > 7 or NEW.av2 > 8 or NEW.av3 > 10 or NEW.aps1 > 3 or NEW.aps2 > 2 then
        signal sqlstate '41200' set message_text = 'Erro: Valores informados acima do permitido.';
    end if;
    if NEW.av1 < 0 or NEW.av2 < 0 or NEW.av3 < 0 or NEW.aps1 < 0 or NEW.aps2 < 0 then
        signal sqlstate '41200' set message_text = 'Erro: Valores informados abaixo do permitido.';
    end if;
end;

# Inserções

INSERT INTO universidade.materias (materia) VALUES ('Helio');
INSERT INTO universidade.materias (materia) VALUES ('Internet');
INSERT INTO universidade.materias (materia) VALUES ('Neomica');
INSERT INTO universidade.materias (materia) VALUES ('Terrmanh');

INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('admin@com', '123456', 'Administrador', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('erick@com', '123456', 'Erica', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('alica@com', '123456', 'Alica', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('lion@com', '123456', 'Lion', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('renoma@com', '123456', 'Renoma', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('triturador@com', '123456', 'Triturador', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('terma@com', '123456', 'Terma', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('focado@com', '123456', 'Focado', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('perdido@com', '123456', 'Perdido', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('caiu@com', '123456', 'Caiu', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('torcedor@com', '123456', 'Torcedor', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('trintes@com', '123456', 'Trintes', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('lounher@com', '123456', 'Lounher', 0);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('kiro@com', '123456', 'Kiro', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('tetso@com', '123456', 'Tetso', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('chroma@com', '123456', 'Chroma', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('kronhas@com', '123456', 'Kronhas', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('leskmi@com', '123456', 'Leskmi', 777);
INSERT INTO universidade.usuarios (email, senha, nome, papel) VALUES ('koenrmt@com', '123456', 'Koenrmt', 777);

INSERT INTO universidade.curso (curso) VALUES ('Engenharia da comunica');
INSERT INTO universidade.curso (curso) VALUES ('Jornalismo');
INSERT INTO universidade.curso (curso) VALUES ('Informatica');
INSERT INTO universidade.curso (curso) VALUES ('Terraria');
INSERT INTO universidade.curso (curso) VALUES ('Tormentess');
INSERT INTO universidade.curso (curso) VALUES ('Engenharia Elétrica');


INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (1, 'ERICK NOMADA', 1, 2);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (2, 'Alica Mento', 2, 3);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (3, 'Lion', 2, 4);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (4, 'Renoma', 3, 5);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (5, 'Triturador', 2, 6);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (6, 'Terma Testao', 3, 7);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (7, 'Focado', 2, 8);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (8, 'Perdido no ceu', 3, 9);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (9, 'Caiu passou', 1, 10);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (10, 'Torcedor', 2, 11);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (11, 'Trintes', 2, 12);
INSERT INTO universidade.aluno (id, nome, curso_id, usuario_id) VALUES (12, 'Lounher', 3, 13);

INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (1, 'Kiro', 14);
INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (2, 'Tetso', 15);
INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (3, 'Chroma', 16);
INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (4, 'Kronhas', 17);
INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (5, 'Leskmi', 18);
INSERT INTO universidade.professor (id, professor, usuario_id) VALUES (6, 'Koenrmt', 19);

INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Internet', 6.89, 7, 8.95, 2.1, 2, 1, 1);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Terrmanh', 6, 7, 8.95, 2.1, 2, 8, 2);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Helio', 4.7, 3.9, 8, 3, 2, 9, 2);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Neomica', 5.78, 4.99, 7.67, 2.1, 2, 2, 1);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Terrmanh', 6, 7, 8.95, 2.1, 2, 3, 2);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Helio', 7, 5.6, 5, 2.1, 2, 5, 3);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Helio', 5.7, 3.9, 6.7, 2.1, 2, 9, 1);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Helio', 5.99, 0, 4.55, 3, 0, 7, 4);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Helio', 5, 0, 0, 3, 0, 8, 5);
INSERT INTO universidade.disciplina (disciplina, av1, av2, av3, aps1, aps2, aluno_id, professor_id) VALUES ('Terrmanh', 5, 5.77, 7.67, 2.1, 2, 10, 3);

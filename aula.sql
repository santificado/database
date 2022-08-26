CREATE TABLE tb_experiencia (
    id_experiencia                NUMBER NOT NULL,
    cargo                         VARCHAR2(100),
    data_inicio                   DATE,
    data_fim                      DATE,
    descricao                     VARCHAR2(200),
    tb_instituicao_id_instituicao NUMBER NOT NULL
);

ALTER TABLE tb_experiencia ADD CONSTRAINT tb_experiencia_pk PRIMARY KEY ( id_experiencia );

CREATE TABLE tb_formacao (
    id_formacao                   NUMBER,
    data_inicio                   DATE,
    data_fim                      DATE,
    tb_instituicao_id_instituicao NUMBER NOT NULL,
    tb_usuario_id_usuario         NUMBER NOT NULL
);

CREATE TABLE tb_instituicao (
    id_instituicao   NUMBER NOT NULL,
    nome_instituicao VARCHAR2(100)
);

ALTER TABLE tb_instituicao ADD CONSTRAINT tb_instituicao_pk PRIMARY KEY ( id_instituicao );

CREATE TABLE tb_usuario (
    id_usuario   NUMBER NOT NULL,
    nome_usuario VARCHAR2 (100),
    cpf_usuario  NUMBER,
    telefone     NUMBER,
    email        VARCHAR2(100)
);

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE tb_experiencia
    ADD CONSTRAINT tb_experiencia_tb_instituicao_fk FOREIGN KEY ( tb_instituicao_id_instituicao )
        REFERENCES tb_instituicao ( id_instituicao );

ALTER TABLE tb_formacao
    ADD CONSTRAINT tb_formacao_tb_instituicao_fk FOREIGN KEY ( tb_instituicao_id_instituicao )
        REFERENCES tb_instituicao ( id_instituicao );

ALTER TABLE tb_formacao
    ADD CONSTRAINT tb_formacao_tb_usuario_fk FOREIGN KEY ( tb_usuario_id_usuario )
        REFERENCES tb_usuario ( id_usuario );

CREATE TABLE tb_empresa (
    id_empresa   NUMBER NOT NULL,
    nome_empresa VARCHAR2(200)
);

ALTER TABLE tb_empresa ADD CONSTRAINT tb_empresa_pk PRIMARY KEY ( id_empresa );


SELECT * 
FROM tb_experiencia e INNER JOIN tb_usuario u
    ON e.tb_usuario_id_usuario = u.id_usuario
INNER JOIN tb_empresa e 
    ON e.tb_empresa_id_empresa = e.id_empresa
    
CREATE TABLE tb_candidaturas (
    id_candidatura        NUMBER NOT NULL,
    data_candidatura      DATE,
    data_fim              DATE,
    data_inicio           DATE,
    tb_vaga_id_vaga       NUMBER NOT NULL,
    tb_usuario_id_usuario NUMBER NOT NULL
);

ALTER TABLE tb_candidaturas ADD CONSTRAINT tb_candidaturas_pk PRIMARY KEY ( id_candidatura );

CREATE TABLE tb_vaga (
    id_vaga               NUMBER NOT NULL,
    cargo_vaga            VARCHAR2(200),
    descricao_vaga        VARCHAR2(4000),
    remuneracao           NUMBER(10, 2),
    data_registro         Date ,
    tb_empresa_id_empresa NUMBER NOT NULL
);

ALTER TABLE tb_vaga ADD CONSTRAINT tb_vaga_pk PRIMARY KEY ( id_vaga );

INSERT INTO tb_vaga values (1,'analist de ti', 'fazer muitas coisas', 5000, '26-AUG-2022',2);

SELECT  * u.nome_usuario, v.cargo_vaga, v.descricao_vaga, v.remuneracao, e.nome_empresa
FROM tb_vaga v INNER JOING tb_usuario u 
    ON v.tb_usuario_ud_usuario = u.id_usuario
INNER JOIN tb_empresa e 
    ON v.tb_empresa_id_empresa = e.id_empresa
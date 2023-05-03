-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-09-14 19:32:41 GMT-03:00
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sgv_atentd_ch (
    cd_atendimento_chamado NUMBER(6) NOT NULL,
    dt_atendimento         DATE,
    tp_termino_chamada     DATE NOT NULL,
    ds_chamado_funcionario VARCHAR2(1000) NOT NULL,
    t_sgv_ch_cd_ch         NUMBER(6) NOT NULL,
    t_sgv_func_cd_func     NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_sgv_atentd_ch.dt_atendimento IS
    'data opcional RN13';

COMMENT ON COLUMN t_sgv_atentd_ch.ds_chamado_funcionario IS
    'informacao opcional ';

COMMENT ON COLUMN t_sgv_atentd_ch.t_sgv_func_cd_func IS
    'cd func obrigatorio RN14';

CREATE UNIQUE INDEX t_sgv_atentd_ch__idx ON
    t_sgv_atentd_ch (
        t_sgv_ch_cd_ch
    ASC );

ALTER TABLE t_sgv_atentd_ch ADD CONSTRAINT t_sgv_atentd_ch_pk PRIMARY KEY ( cd_atendimento_chamado );

CREATE TABLE t_sgv_categ (
    cd_categ                   NUMBER(2) NOT NULL,
    nm_categ                   VARCHAR2(30) NOT NULL,
    ds_categ                   VARCHAR2(1000) NOT NULL,
    dt_inicio                  DATE NOT NULL,
    dt_fim                     DATE,
    t_sgv_st_categ_cd_st_categ VARCHAR2(1) NOT NULL
);

COMMENT ON COLUMN t_sgv_categ.cd_categ IS
    'numero sequencial para ser utilizado como sequence crescente ';

COMMENT ON COLUMN t_sgv_categ.ds_categ IS
    'descricao obrigatoria "A" Ativo se a dt_ fim estive em branco, e"I" inativo se a dt_fim estever preenchida RN06';

COMMENT ON COLUMN t_sgv_categ.dt_inicio IS
    'data obrigatoria ';

COMMENT ON COLUMN t_sgv_categ.dt_fim IS
    'data opcional ( estando em branco categoria "A" ativo e operante. se estiver preenchido deve estar "I" Inativo "R06"';

COMMENT ON COLUMN t_sgv_categ.t_sgv_st_categ_cd_st_categ IS
    'status obrigatorio ';

ALTER TABLE t_sgv_categ ADD CONSTRAINT t_sgv_categ_pk PRIMARY KEY ( cd_categ );

CREATE TABLE t_sgv_categ_vd (
    cd_categ_vd NUMBER(2) NOT NULL,
    nm_categ_vd VARCHAR2(50) NOT NULL
);

ALTER TABLE t_sgv_categ_vd ADD CONSTRAINT t_sgv_categ_vd_pk PRIMARY KEY ( cd_categ_vd );

CREATE TABLE t_sgv_ch (
    cd_ch                         NUMBER(6) NOT NULL,
    ds_comentario_cliente         VARCHAR2(1000) NOT NULL,
    dt_ch                         DATE NOT NULL,
    tp_atendimento_total          NUMBER(5, 2) NOT NULL,
    t_sgv_pessoa_cd_pessoa        NUMBER(6),
    t_sgv_prod_cd_prod            NUMBER(4) NOT NULL,
    t_sgv_st_ch_cd_st_ch          VARCHAR2(1) DEFAULT 'A' NOT NULL,
    t_sgv_ind_satisf_cd_satisf    VARCHAR2(1),
    t_sgv_clas_ch_cd_clas_chamado NUMBER(1) NOT NULL
);

COMMENT ON COLUMN t_sgv_ch.ds_comentario_cliente IS
    'informação obrigatoria RN20';

COMMENT ON COLUMN t_sgv_ch.tp_atendimento_total IS
    'data do chamdo obrigatorio RN13/RN16';

COMMENT ON COLUMN t_sgv_ch.t_sgv_clas_ch_cd_clas_chamado IS
    'Informação obrigatoria  tipo "1" sugestao tipo "2" reclamacao RN18';

ALTER TABLE t_sgv_ch ADD CONSTRAINT t_sgv_ch_pk PRIMARY KEY ( cd_ch );

CREATE TABLE t_sgv_clas_ch (
    cd_clas_chamado NUMBER(1) NOT NULL,
    nm_clas_chamado VARCHAR2(10) NOT NULL
);

ALTER TABLE t_sgv_clas_ch
    ADD CHECK ( nm_clas_chamado IN ( 'reclamacao', 'sugestao' ) );

ALTER TABLE t_sgv_clas_ch ADD CONSTRAINT t_sgv_clas_ch_pk PRIMARY KEY ( cd_clas_chamado );

CREATE TABLE t_sgv_endereco (
    cd_endereco            NUMBER(6) NOT NULL,
    tp_enderco             VARCHAR2(10),
    ds_logradouro          VARCHAR2(50),
    nr_endereco            VARCHAR2(5),
    ds_complemento         VARCHAR2(30),
    st_status              CHAR(1) NOT NULL,
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL,
    nr_cep                 VARCHAR2(7) NOT NULL
);

COMMENT ON COLUMN t_sgv_endereco.st_status IS
    'endereço A = ativo e I = inativo';

ALTER TABLE t_sgv_endereco ADD CONSTRAINT t_sgv_endereco_pk PRIMARY KEY ( cd_endereco );

CREATE TABLE t_sgv_fisica (
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL,
    nm_fisica              VARCHAR2(50) NOT NULL,
    nr_rg                  VARCHAR2(9) NOT NULL,
    nr_cpf                 VARCHAR2(11) NOT NULL,
    dt_nascimento          DATE NOT NULL,
    ds_sexo                CHAR(1) NOT NULL,
    ds_email               VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_sgv_fisica.ds_email IS
    'informacao obrigatoria RN23';

ALTER TABLE t_sgv_fisica ADD CONSTRAINT t_sgv_fisica_pk PRIMARY KEY ( t_sgv_pessoa_cd_pessoa );

CREATE TABLE t_sgv_func (
    cd_func          NUMBER(3) NOT NULL,
    nm_func          VARCHAR2(50) NOT NULL,
    dt_nasc_func     DATE NOT NULL,
    nr_telefone_func NUMBER(13) NOT NULL,
    ds_email_func    VARCHAR2(50) NOT NULL,
    ds_cargo         VARCHAR2(50) NOT NULL,
    ds_dpto          VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_sgv_func.cd_func IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.nm_func IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.dt_nasc_func IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.nr_telefone_func IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.ds_email_func IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.ds_cargo IS
    'informacao obrigatoria RN22';

COMMENT ON COLUMN t_sgv_func.ds_dpto IS
    'informacao obrigatoria RN22';

ALTER TABLE t_sgv_func ADD CONSTRAINT t_sgv_func_pk PRIMARY KEY ( cd_func );

CREATE TABLE t_sgv_ind_satisf (
    cd_satisf VARCHAR2(1) NOT NULL,
    ds_satisf VARCHAR2(2) DEFAULT 'nr' NOT NULL
);

ALTER TABLE t_sgv_ind_satisf
    ADD CHECK ( ds_satisf IN ( '1', '10', '2', '3', '4',
                               '5', '6', '7', '8', '9',
                               'nr' ) );

COMMENT ON COLUMN t_sgv_ind_satisf.cd_satisf IS
    'indice de satisfação de "1" para menos satisfeito e ruim e "10" paramuito satisfeito RN17';

ALTER TABLE t_sgv_ind_satisf ADD CONSTRAINT t_sgv_ind_satisf_pk PRIMARY KEY ( cd_satisf );

CREATE TABLE t_sgv_juridica (
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL,
    nm_razao_sosial        VARCHAR2(50) NOT NULL,
    nm_fantasia            VARCHAR2(50) NOT NULL,
    nr_cnpj                VARCHAR2(14) NOT NULL,
    nr_insc_estad          VARCHAR2(9),
    ds_ramo                VARCHAR2(50) NOT NULL,
    ds_email               VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN t_sgv_juridica.ds_email IS
    'informacao obrigatoria RN23';

ALTER TABLE t_sgv_juridica ADD CONSTRAINT t_sgv_juridica_pk PRIMARY KEY ( t_sgv_pessoa_cd_pessoa );

CREATE TABLE t_sgv_nota (
    cd_nota              NUMBER(6) NOT NULL,
    dt_vencimento        DATE NOT NULL,
    dt_pagamento         DATE NOT NULL,
    t_sgv_venda_cd_venda NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_nota.cd_nota IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_nota.dt_vencimento IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_nota.dt_pagamento IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_nota.t_sgv_venda_cd_venda IS
    'regra obrigatoria  criada da RN 24 ';

CREATE UNIQUE INDEX t_sgv_nota__idx ON
    t_sgv_nota (
        t_sgv_venda_cd_venda
    ASC );

ALTER TABLE t_sgv_nota ADD CONSTRAINT t_sgv_nota_pk PRIMARY KEY ( cd_nota );

CREATE TABLE t_sgv_pessoa (
    cd_pessoa NUMBER(6) NOT NULL,
    nm_pessoa VARCHAR2(50) NOT NULL,
    ds_login  VARCHAR2(8)
);

ALTER TABLE t_sgv_pessoa
    ADD CHECK ( ds_login IN ( 'offline', 'online' ) );

ALTER TABLE t_sgv_pessoa ADD CONSTRAINT t_sgv_pessoa_pk PRIMARY KEY ( cd_pessoa );

CREATE TABLE t_sgv_prod (
    cd_prod                  NUMBER(4) NOT NULL,
    nm_prod                  VARCHAR2(30) NOT NULL,
    ds_prod                  VARCHAR2(1000) NOT NULL,
    cd_ean13                 NUMBER(13),
    t_sgv_categ_cd_categ     NUMBER(2) NOT NULL,
    t_sgv_st_prod_cd_st_prod VARCHAR2(1) NOT NULL,
    vl_unitario              NUMBER(11, 2) NOT NULL
);

COMMENT ON COLUMN t_sgv_prod.cd_prod IS
    'numero sequencial e crescente';

COMMENT ON COLUMN t_sgv_prod.ds_prod IS
    'descrição obrigatoria ';

COMMENT ON COLUMN t_sgv_prod.cd_ean13 IS
    'codgo opcional';

COMMENT ON COLUMN t_sgv_prod.vl_unitario IS
    'valor obrigatorio ';

ALTER TABLE t_sgv_prod ADD CONSTRAINT t_sgv_prod_pk PRIMARY KEY ( cd_prod );

CREATE TABLE t_sgv_prod_vend (
    nr_qtd               NUMBER(6) NOT NULL,
    vl_prod_vend         NUMBER(11, 2) NOT NULL,
    t_sgv_prod_cd_prod   NUMBER(4) NOT NULL,
    t_sgv_venda_cd_venda NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_prod_vend.nr_qtd IS
    'regra obrigatoria  criada da RN 24 ';

ALTER TABLE t_sgv_prod_vend ADD CONSTRAINT t_sgv_prod_vend_pk PRIMARY KEY ( t_sgv_prod_cd_prod,
                                                                            t_sgv_venda_cd_venda );

CREATE TABLE t_sgv_st_categ (
    cd_st_categ         VARCHAR2(1) NOT NULL,
    nm_status_categoria VARCHAR2(30) NOT NULL
);

ALTER TABLE t_sgv_st_categ ADD CONSTRAINT t_sgv_st_categ_pk PRIMARY KEY ( cd_st_categ );

CREATE TABLE t_sgv_st_ch (
    cd_st_ch          VARCHAR2(1) NOT NULL,
    nm_status_chamado VARCHAR2(50) DEFAULT 'A' NOT NULL
);

ALTER TABLE t_sgv_st_ch
    ADD CHECK ( nm_status_chamado IN ( 'A', 'C', 'E', 'F', 'X' ) );

COMMENT ON COLUMN t_sgv_st_ch.cd_st_ch IS
    'utilização como sequence RN12                                                                                      status chamos "A" Aberto "L" em atendimento "C" Cnacelado "F" Fechado "X" fechado com insatisfação RN 15 '
    ;

ALTER TABLE t_sgv_st_ch ADD CONSTRAINT t_sgv_st_ch_pk PRIMARY KEY ( cd_st_ch );

CREATE TABLE t_sgv_st_prod (
    cd_st_prod VARCHAR2(1) NOT NULL,
    nm_st_prod VARCHAR2(50) NOT NULL
);

ALTER TABLE t_sgv_st_prod
    ADD CHECK ( cd_st_prod IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_sgv_st_prod.cd_st_prod IS
    'Nome dos Status A = Ativo e I = Inativo';

COMMENT ON COLUMN t_sgv_st_prod.nm_st_prod IS
    'Nome dos Status A = Ativo e I = Inativo';

ALTER TABLE t_sgv_st_prod ADD CONSTRAINT t_sgv_st_prod_pk PRIMARY KEY ( cd_st_prod );

CREATE TABLE t_sgv_st_vd (
    cd_st_vd    VARCHAR2(1) NOT NULL,
    nm_st_video VARCHAR2(30) NOT NULL
);

ALTER TABLE t_sgv_st_vd
    ADD CHECK ( cd_st_vd IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_sgv_st_vd.cd_st_vd IS
    '"A" Aativo e "I" Inativo videos inativos não podem ser visualisados. RN07';

ALTER TABLE t_sgv_st_vd ADD CONSTRAINT t_sgv_st_vd_pk PRIMARY KEY ( cd_st_vd );

CREATE TABLE t_sgv_telefone (
    cd_telefone            NUMBER(6) NOT NULL,
    nr_ddi                 VARCHAR2(4) NOT NULL,
    nr_ddd                 VARCHAR2(2),
    tp_telefone            VARCHAR2(10) NOT NULL,
    nr_telefone            VARCHAR2(10),
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_telefone.nr_telefone IS
    'informacao obrigatoria RN23';

ALTER TABLE t_sgv_telefone ADD CONSTRAINT t_sgv_telefone_pk PRIMARY KEY ( cd_telefone );

CREATE TABLE t_sgv_vd (
    cd_vd                      NUMBER(4) NOT NULL,
    ds_vd                      VARCHAR2(1000) NOT NULL,
    t_sgv_prod_cd_prod         NUMBER(4) NOT NULL,
    t_sgv_st_vd_cd_st_vd       VARCHAR2(1) NOT NULL,
    t_sgv_categ_vd_cd_categ_vd NUMBER(2) NOT NULL
);

COMMENT ON COLUMN t_sgv_vd.t_sgv_categ_vd_cd_categ_vd IS
    'Obrigatorio ter categoria RN 10';

ALTER TABLE t_sgv_vd ADD CONSTRAINT t_sgv_vd_pk PRIMARY KEY ( cd_vd );

CREATE TABLE t_sgv_venda (
    cd_venda               NUMBER(6) NOT NULL,
    qt_venda               NUMBER(5) NOT NULL,
    vl_venda               NUMBER(11, 2) NOT NULL,
    dt_venda               DATE NOT NULL,
    pc_desconto            NUMBER(4, 2) NOT NULL,
    t_sgv_nota_cd_nota     NUMBER(6) NOT NULL,
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_venda.cd_venda IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.qt_venda IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.vl_venda IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.dt_venda IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.pc_desconto IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.t_sgv_nota_cd_nota IS
    'regra obrigatoria  criada da RN 24 ';

COMMENT ON COLUMN t_sgv_venda.t_sgv_pessoa_cd_pessoa IS
    'regra obrigatoria  criada da RN 24 ';

CREATE UNIQUE INDEX t_sgv_venda__idx ON
    t_sgv_venda (
        t_sgv_nota_cd_nota
    ASC );

ALTER TABLE t_sgv_venda ADD CONSTRAINT t_sgv_venda_pk PRIMARY KEY ( cd_venda );

CREATE TABLE t_sgv_visu (
    cd_visu                NUMBER(6),
    dt_visu                DATE NOT NULL,
    t_sgv_vd_cd_vd         NUMBER(4) NOT NULL,
    t_sgv_pessoa_cd_pessoa NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_visu.dt_visu IS
    'Informação obrigatoria RN09';

ALTER TABLE t_sgv_atentd_ch
    ADD CONSTRAINT t_sgv_atentd_ch_t_sgv_ch_fk FOREIGN KEY ( t_sgv_ch_cd_ch )
        REFERENCES t_sgv_ch ( cd_ch );

ALTER TABLE t_sgv_atentd_ch
    ADD CONSTRAINT t_sgv_atentd_ch_t_sgv_func_fk FOREIGN KEY ( t_sgv_func_cd_func )
        REFERENCES t_sgv_func ( cd_func );

ALTER TABLE t_sgv_categ
    ADD CONSTRAINT t_sgv_categ_t_sgv_st_categ_fk FOREIGN KEY ( t_sgv_st_categ_cd_st_categ )
        REFERENCES t_sgv_st_categ ( cd_st_categ );

ALTER TABLE t_sgv_ch
    ADD CONSTRAINT t_sgv_ch_t_sgv_clas_ch_fk FOREIGN KEY ( t_sgv_clas_ch_cd_clas_chamado )
        REFERENCES t_sgv_clas_ch ( cd_clas_chamado );

ALTER TABLE t_sgv_ch
    ADD CONSTRAINT t_sgv_ch_t_sgv_ind_satisf_fk FOREIGN KEY ( t_sgv_ind_satisf_cd_satisf )
        REFERENCES t_sgv_ind_satisf ( cd_satisf );

ALTER TABLE t_sgv_ch
    ADD CONSTRAINT t_sgv_ch_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_ch
    ADD CONSTRAINT t_sgv_ch_t_sgv_prod_fk FOREIGN KEY ( t_sgv_prod_cd_prod )
        REFERENCES t_sgv_prod ( cd_prod );

ALTER TABLE t_sgv_ch
    ADD CONSTRAINT t_sgv_ch_t_sgv_st_ch_fk FOREIGN KEY ( t_sgv_st_ch_cd_st_ch )
        REFERENCES t_sgv_st_ch ( cd_st_ch );

ALTER TABLE t_sgv_endereco
    ADD CONSTRAINT t_sgv_endereco_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_fisica
    ADD CONSTRAINT t_sgv_fisica_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_juridica
    ADD CONSTRAINT t_sgv_juridica_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_prod
    ADD CONSTRAINT t_sgv_prod_t_sgv_categ_fk FOREIGN KEY ( t_sgv_categ_cd_categ )
        REFERENCES t_sgv_categ ( cd_categ );

ALTER TABLE t_sgv_prod
    ADD CONSTRAINT t_sgv_prod_t_sgv_st_prod_fk FOREIGN KEY ( t_sgv_st_prod_cd_st_prod )
        REFERENCES t_sgv_st_prod ( cd_st_prod );

ALTER TABLE t_sgv_prod_vend
    ADD CONSTRAINT t_sgv_prod_vend_t_sgv_prod_fk FOREIGN KEY ( t_sgv_prod_cd_prod )
        REFERENCES t_sgv_prod ( cd_prod );

ALTER TABLE t_sgv_prod_vend
    ADD CONSTRAINT t_sgv_prod_vend_t_sgv_venda_fk FOREIGN KEY ( t_sgv_venda_cd_venda )
        REFERENCES t_sgv_venda ( cd_venda );

ALTER TABLE t_sgv_telefone
    ADD CONSTRAINT t_sgv_telefone_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_vd
    ADD CONSTRAINT t_sgv_vd_t_sgv_categ_vd_fk FOREIGN KEY ( t_sgv_categ_vd_cd_categ_vd )
        REFERENCES t_sgv_categ_vd ( cd_categ_vd );

ALTER TABLE t_sgv_vd
    ADD CONSTRAINT t_sgv_vd_t_sgv_prod_fk FOREIGN KEY ( t_sgv_prod_cd_prod )
        REFERENCES t_sgv_prod ( cd_prod );

ALTER TABLE t_sgv_vd
    ADD CONSTRAINT t_sgv_vd_t_sgv_st_vd_fk FOREIGN KEY ( t_sgv_st_vd_cd_st_vd )
        REFERENCES t_sgv_st_vd ( cd_st_vd );

ALTER TABLE t_sgv_venda
    ADD CONSTRAINT t_sgv_venda_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_visu
    ADD CONSTRAINT t_sgv_visu_t_sgv_pessoa_fk FOREIGN KEY ( t_sgv_pessoa_cd_pessoa )
        REFERENCES t_sgv_pessoa ( cd_pessoa );

ALTER TABLE t_sgv_visu
    ADD CONSTRAINT t_sgv_visu_t_sgv_vd_fk FOREIGN KEY ( t_sgv_vd_cd_vd )
        REFERENCES t_sgv_vd ( cd_vd );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            22
-- CREATE INDEX                             3
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0


--- SEQUENCES

CREATE SEQUENCE seq_cd_prod
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999;

CREATE SEQUENCE seq_cd_categ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99;
   
CREATE SEQUENCE seq_cd_ch
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
CREATE SEQUENCE seq_cd_atendimento_chamado
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
        
 CREATE SEQUENCE seq_cd_categ_vd
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99;
    
CREATE SEQUENCE seq_cd_clas_chamado
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9;
    
CREATE SEQUENCE seq_cd_endereco
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
CREATE SEQUENCE seq_t_sgv_pessoa_cd_pessoa
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
CREATE SEQUENCE seq_cd_func
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999;
    
CREATE SEQUENCE seq_cd_satisf
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9;
       
CREATE SEQUENCE seq_cd_pessoa
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
CREATE SEQUENCE seq_cd_st_prod
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9;
    
CREATE SEQUENCE seq_cd_st_vd 
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9;
    
CREATE SEQUENCE seq_cd_telefone
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;    
    
CREATE SEQUENCE seq_cd_vd
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999;
    
CREATE SEQUENCE seq_cd_visu
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
CREATE SEQUENCE seq_cd_venda  
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;
    
 CREATE SEQUENCE seq_cd_nota
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 999999;




/*
--- DROP SEQUENCES
DROP SEQUENCE seq_cd_prod;
DROP SEQUENCE seq_cd_ch;
DROP SEQUENCE seq_cd_categ;
DROP SEQUENCE seq_cd_atendimento_chamado;
DROP SEQUENCE seq_cd_categ_vd;
DROP SEQUENCE seq_cd_clas_chamado;
DROP SEQUENCE seq_cd_endereco;
DROP SEQUENCE seq_t_sgv_pessoa_cd_pessoa;
DROP SEQUENCE seq_cd_func;
DROP SEQUENCE seq_cd_satisf;
DROP SEQUENCE seq_cd_pessoa;
DROP SEQUENCE seq_cd_st_prod;
DROP SEQUENCE seq_cd_st_vd;
DROP SEQUENCE seq_cd_telefone;
DROP SEQUENCE seq_cd_vd;
DROP SEQUENCE seq_cd_visu;
DROP SEQUENCE seq_cd_venda;
DROP SEQUENCE seq_cd_nota;
*/
/* 
--PROJETO DE DROP 
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

DROP TABLE "T_SGV_ATENTD_CH" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_CATEG" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_CATEG_VD" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_CH" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_CLAS_CH" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_ENDERECO" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_FISICA" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_FUNC" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_IND_SATISF" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_JURIDICA" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_NOTA" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_PESSOA" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_PROD" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_PROD_VEND" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_ST_CATEG" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_ST_CH" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_ST_PROD" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_ST_VD" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_TELEFONE" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_VD" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_VENDA" CASCADE CONSTRAINTS;
DROP TABLE "T_SGV_VISU" CASCADE CONSTRAINTS;
*/
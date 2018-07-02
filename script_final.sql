CREATE ROLE "geral"
NOSUPERUSER NOINHERIT NOCREATEDB NOCREATEROLE;

CREATE ROLE "admin"
SUPERUSER INHERIT CREATEDB CREATEROLE;

CREATE ROLE adm_trans_madeira LOGIN
PASSWORD 'admintransmadeira'
GRANT "admin" TO adm_trans_madeira

CREATE ROLE trans_madeira LOGIN
PASSWORD 'transmadeira'
GRANT "geral" TO trans_madeira

GRANT USAGE ON SCHEMA s_trans_madeira TO geral;

GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA s_trans_madeira TO geral;

GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA s_trans_madeira TO geral;


CREATE DATABASE db_trans_madeira owner admin

CREATE SCHEMA s_trans_madeira
  AUTHORIZATION admin;

CREATE SCHEMA s_trans_madeira;

CREATE SEQUENCE s_trans_madeira.tb_dae_numero_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_empreendimento_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_estado_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_gtf_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_log_empreendimento_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_log_proprietario_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_log_usuario_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_madeira_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_municipio_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_pais_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_perfil_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_proprietario_empreendimento_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_proprietario_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_rota_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_rota_veiculo_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_tipo_alteracao_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_tipo_gtf_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_tipo_veiculo_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_usuario_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_veiculo_ferroviario_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_veiculo_fluvial_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_veiculo_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_veiculo_maritmo_id_seq START WITH 1;

CREATE SEQUENCE s_trans_madeira.tb_veiculo_rodoviario_id_seq START WITH 1;

CREATE TABLE s_trans_madeira.tb_empreendimento ( 
	id                   serial  NOT NULL,
	razao_social         varchar(100)  NOT NULL,
	nome_fantasia        varchar(100)  NOT NULL,
	cnpj                 char(14)  NOT NULL,
	endereco             varchar(100)  NOT NULL,
	bairro               varchar(100)  NOT NULL,
	cep                  char(14)  NOT NULL,
	telefone             char(10)  NOT NULL,
	email                varchar(50)  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	status               bool DEFAULT true ,
	CONSTRAINT tb_empreendimento_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_madeira ( 
	id                   serial  NOT NULL,
	nome_especie         varchar(50)  NOT NULL,
	nome_cientifico      varchar(50)  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	status               bool DEFAULT true ,
	CONSTRAINT tb_madeira_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_pais ( 
	id                   serial  NOT NULL,
	nome                 varchar(20)  ,
	CONSTRAINT tb_pais_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_perfil ( 
	id                   serial  NOT NULL,
	nome                 varchar(30)  ,
	CONSTRAINT tb_perfil_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_tipo_alteracao ( 
	id                   serial  NOT NULL,
	nome                 varchar(20)  ,
	CONSTRAINT tb_tipo_alteracao_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_tipo_gtf ( 
	id                   serial  NOT NULL,
	tipo                 varchar(50)  NOT NULL,
	CONSTRAINT tb_tipo_gtf_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_tipo_veiculo ( 
	id                   serial  NOT NULL,
	nome                 varchar(30)  ,
	CONSTRAINT tb_tipo_veiculo_pkey PRIMARY KEY ( id )
 );

CREATE TABLE s_trans_madeira.tb_usuario ( 
	id                   serial  NOT NULL,
	login                varchar(30)  NOT NULL,
	senha                varchar(8)  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	status               bool DEFAULT true ,
	data_validade_cadastro timestamptz  NOT NULL,
	perfil               integer  NOT NULL,
	CONSTRAINT tb_usuario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_usuario_perfil_fkey FOREIGN KEY ( perfil ) REFERENCES s_trans_madeira.tb_perfil( id )  
 );

CREATE TABLE s_trans_madeira.tb_veiculo ( 
	id                   serial  NOT NULL,
	nome                 varchar(100)  NOT NULL,
	ano_fabricacao       smallint  NOT NULL,
	capacidade_m3        numeric(10,2)  ,
	altura               numeric(10,2)  NOT NULL,
	comprimento          numeric(10,2)  NOT NULL,
	largura              numeric(10,2)  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	status               bool DEFAULT true ,
	tipo_veiculo         integer  ,
	id_empreendimento    integer  ,
	CONSTRAINT tb_veiculo_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_veiculo_id_empreendimento_fkey FOREIGN KEY ( id_empreendimento ) REFERENCES s_trans_madeira.tb_empreendimento( id )  ,
	CONSTRAINT tb_veiculo_tipo_veiculo_fkey FOREIGN KEY ( tipo_veiculo ) REFERENCES s_trans_madeira.tb_tipo_veiculo( id )  
 );

ALTER TABLE s_trans_madeira.tb_veiculo ADD CONSTRAINT tb_veiculo_largura_check CHECK ( largura > (0)::numeric );

ALTER TABLE s_trans_madeira.tb_veiculo ADD CONSTRAINT tb_veiculo_comprimento_check CHECK ( comprimento > (0)::numeric );

ALTER TABLE s_trans_madeira.tb_veiculo ADD CONSTRAINT tb_veiculo_altura_check CHECK ( altura > (0)::numeric );

CREATE TABLE s_trans_madeira.tb_veiculo_ferroviario ( 
	id                   serial  NOT NULL,
	numero               smallint  NOT NULL,
	linha                varchar(20)  NOT NULL,
	vagoes               smallint  NOT NULL,
	id_veiculo           integer  NOT NULL,
	CONSTRAINT tb_veiculo_ferroviario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_veiculo_ferroviario_id_veiculo_fkey FOREIGN KEY ( id_veiculo ) REFERENCES s_trans_madeira.tb_veiculo( id )  
 );

ALTER TABLE s_trans_madeira.tb_veiculo_ferroviario ADD CONSTRAINT tb_veiculo_ferroviario_vagoes_check CHECK ( vagoes > 0 );

CREATE TABLE s_trans_madeira.tb_veiculo_fluvial ( 
	id                   serial  NOT NULL,
	tipo_embarcacao      varchar(30)  NOT NULL,
	nome_hidrovia        varchar(30)  NOT NULL,
	id_veiculo           integer  NOT NULL,
	CONSTRAINT tb_veiculo_fluvial_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_veiculo_fluvial_id_veiculo_fkey FOREIGN KEY ( id_veiculo ) REFERENCES s_trans_madeira.tb_veiculo( id )  
 );

CREATE TABLE s_trans_madeira.tb_veiculo_maritmo ( 
	id                   serial  NOT NULL,
	numero_inscricao     varchar(10)  NOT NULL,
	id_pais              integer  ,
	id_veiculo           integer  NOT NULL,
	CONSTRAINT tb_veiculo_maritmo_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_veiculo_maritmo_id_pais_fkey FOREIGN KEY ( id_pais ) REFERENCES s_trans_madeira.tb_pais( id )  ,
	CONSTRAINT tb_veiculo_maritmo_id_veiculo_fkey FOREIGN KEY ( id_veiculo ) REFERENCES s_trans_madeira.tb_veiculo( id )  
 );

CREATE TABLE s_trans_madeira.tb_estado ( 
	id                   serial  NOT NULL,
	nome                 varchar(20)  ,
	uf                   char(2)  ,
	id_pais              integer  NOT NULL,
	CONSTRAINT tb_estado_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_estado_id_pais_fkey FOREIGN KEY ( id_pais ) REFERENCES s_trans_madeira.tb_pais( id )  
 );

CREATE TABLE s_trans_madeira.tb_log_empreendimento ( 
	id                   serial  NOT NULL,
	id_usuario_alteracao integer  NOT NULL,
	razao_social_antes   varchar(100)  ,
	razao_social_depois  varchar(100)  ,
	nome_fantasia_antes  varchar(100)  ,
	nome_fantasia_depois varchar(100)  ,
	cnpj_antes           char(14)  ,
	cnpj_depois          char(14)  ,
	endereco_antes       varchar(100)  ,
	endereco_depois      varchar(100)  ,
	bairro_antes         varchar(100)  ,
	bairro_depois        varchar(100)  ,
	cep_antes            char(14)  ,
	cep_depois           char(14)  ,
	telefone_antes       char(10)  ,
	telefone_depois      char(10)  ,
	email_antes          varchar(50)  ,
	email_depois         varchar(50)  ,
	status_antes         bool  ,
	status_depois        bool  ,
	data_alteracao       timestamptz  NOT NULL,
	tipo_alteracao       integer  NOT NULL,
	CONSTRAINT tb_log_empreendimento_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_log_empreendimento_tipo_alteracao_fkey FOREIGN KEY ( tipo_alteracao ) REFERENCES s_trans_madeira.tb_tipo_alteracao( id )  ,
	CONSTRAINT tb_log_empreendimento_id_usuario_alteracao_fkey FOREIGN KEY ( id_usuario_alteracao ) REFERENCES s_trans_madeira.tb_usuario( id )  
 );

CREATE TABLE s_trans_madeira.tb_log_proprietario ( 
	id                   serial  NOT NULL,
	id_usuario_alteracao integer  NOT NULL,
	nome_antes           varchar(50)  ,
	nome_depois          varchar(50)  ,
	cpf_antes            char(11)  ,
	cpf_depois           char(11)  ,
	data_nascimento_antes date  ,
	data_nascimento_depois date  ,
	email_antes          varchar(50)  ,
	email_depois         varchar(50)  ,
	status_antes         bool  ,
	status_depois        bool  ,
	data_alteracao       timestamptz  NOT NULL,
	tipo_alteracao       integer  NOT NULL,
	CONSTRAINT tb_log_proprietario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_log_proprietario_tipo_alteracao_fkey FOREIGN KEY ( tipo_alteracao ) REFERENCES s_trans_madeira.tb_tipo_alteracao( id )  ,
	CONSTRAINT tb_log_proprietario_id_usuario_alteracao_fkey FOREIGN KEY ( id_usuario_alteracao ) REFERENCES s_trans_madeira.tb_usuario( id )  
 );

CREATE TABLE s_trans_madeira.tb_log_usuario ( 
	id                   serial  NOT NULL,
	id_usuario_alteracao integer  NOT NULL,
	login_antes          varchar(30)  ,
	login_depois         varchar(30)  ,
	senha_antes          varchar(8)  ,
	senha_depois         varchar(8)  ,
	data_alteracao       timestamptz  NOT NULL,
	perfil_antes         integer  ,
	perfil_depois        integer  ,
	status_antes         bool  ,
	status_depois        bool  ,
	tipo_alteracao       integer  NOT NULL,
	CONSTRAINT tb_log_usuario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_log_usuario_tipo_alteracao_fkey FOREIGN KEY ( tipo_alteracao ) REFERENCES s_trans_madeira.tb_tipo_alteracao( id )  ,
	CONSTRAINT tb_log_usuario_id_usuario_alteracao_fkey FOREIGN KEY ( id_usuario_alteracao ) REFERENCES s_trans_madeira.tb_usuario( id )  
 );

CREATE TABLE s_trans_madeira.tb_municipio ( 
	id                   serial  NOT NULL,
	nome                 varchar(20)  ,
	id_estado            integer  NOT NULL,
	CONSTRAINT tb_municipio_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_municipio_id_estados_fkey FOREIGN KEY ( id_estado ) REFERENCES s_trans_madeira.tb_estado( id )  
 );

CREATE TABLE s_trans_madeira.tb_proprietario ( 
	id                   serial  NOT NULL,
	nome                 varchar(50)  NOT NULL,
	cpf                  char(11)  NOT NULL,
	data_nascimento      date  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	email                varchar(50)  ,
	id_usuario           integer  NOT NULL,
	status               bool DEFAULT true ,
	CONSTRAINT tb_proprietario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_proprietario_id_usuario_fkey FOREIGN KEY ( id_usuario ) REFERENCES s_trans_madeira.tb_usuario( id )  
 );

CREATE TABLE s_trans_madeira.tb_proprietario_empreendimento ( 
	id                   serial  NOT NULL,
	id_proprietario      integer  NOT NULL,
	id_empreendimento    integer  NOT NULL,
	CONSTRAINT tb_proprietario_empreendimento_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_proprietario_empreendimento_id_empreendimento_fkey FOREIGN KEY ( id_empreendimento ) REFERENCES s_trans_madeira.tb_empreendimento( id )  ,
	CONSTRAINT tb_proprietario_empreendimento_id_proprietario_fkey FOREIGN KEY ( id_proprietario ) REFERENCES s_trans_madeira.tb_proprietario( id )  
 );

CREATE TABLE s_trans_madeira.tb_rota ( 
	id                   serial  NOT NULL,
	nome                 varchar(50)  NOT NULL,
	id_municipio_origem  integer  NOT NULL,
	id_municipio_destino integer  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	status               bool DEFAULT true ,
	CONSTRAINT tb_rota_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_rota_id_municipio_destino_fkey FOREIGN KEY ( id_municipio_destino ) REFERENCES s_trans_madeira.tb_municipio( id )  ,
	CONSTRAINT tb_rota_id_municipio_origem_fkey FOREIGN KEY ( id_municipio_origem ) REFERENCES s_trans_madeira.tb_municipio( id )  
 );

CREATE TABLE s_trans_madeira.tb_rota_veiculo ( 
	id                   serial  NOT NULL,
	id_veiculo           integer  NOT NULL,
	id_rota              integer  NOT NULL,
	CONSTRAINT tb_rota_veiculo_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_rota_veiculo_id_rota_fkey FOREIGN KEY ( id_rota ) REFERENCES s_trans_madeira.tb_rota( id )  ,
	CONSTRAINT tb_rota_veiculo_id_veiculo_fkey FOREIGN KEY ( id_veiculo ) REFERENCES s_trans_madeira.tb_veiculo( id )  
 );

CREATE TABLE s_trans_madeira.tb_veiculo_rodoviario ( 
	id                   serial  NOT NULL,
	placa                char(7)  NOT NULL,
	id_municipio         integer  ,
	renavam              char(11)  NOT NULL,
	marca                varchar(20)  NOT NULL,
	modelo               varchar(20)  NOT NULL,
	id_veiculo           integer  NOT NULL,
	CONSTRAINT tb_veiculo_rodoviario_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_veiculo_rodoviario_id_municipio_fkey FOREIGN KEY ( id_municipio ) REFERENCES s_trans_madeira.tb_municipio( id )  ,
	CONSTRAINT tb_veiculo_rodoviario_id_veiculo_fkey FOREIGN KEY ( id_veiculo ) REFERENCES s_trans_madeira.tb_veiculo( id )  
 );

CREATE TABLE s_trans_madeira.tb_gtf ( 
	id                   serial  NOT NULL,
	id_tipo              integer  NOT NULL,
	id_rota_veiculo      integer  NOT NULL,
	id_madeira           integer  NOT NULL,
	volume_transportado_m3 numeric(10,2)  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	data_validade        timestamptz  ,
	CONSTRAINT tb_gtf_pkey PRIMARY KEY ( id ),
	CONSTRAINT tb_gtf_id_madeira_fkey FOREIGN KEY ( id_madeira ) REFERENCES s_trans_madeira.tb_madeira( id )  ,
	CONSTRAINT tb_gtf_id_rota_veiculo_fkey FOREIGN KEY ( id_rota_veiculo ) REFERENCES s_trans_madeira.tb_rota_veiculo( id )  ,
	CONSTRAINT tb_gtf_id_tipo_fkey FOREIGN KEY ( id_tipo ) REFERENCES s_trans_madeira.tb_tipo_gtf( id )  
 );

ALTER TABLE s_trans_madeira.tb_gtf ADD CONSTRAINT tb_gtf_volume_transportado_m3_check CHECK ( volume_transportado_m3 > (0)::numeric );

CREATE TABLE s_trans_madeira.tb_dae ( 
	numero               serial  NOT NULL,
	id_gtf               integer  NOT NULL,
	data_cadastro        timestamptz  NOT NULL,
	data_validade        timestamptz  ,
	valor                numeric(10,2) DEFAULT 500.00 ,
	CONSTRAINT tb_dae_pkey PRIMARY KEY ( numero ),
	CONSTRAINT tb_dae_id_gtf_fkey FOREIGN KEY ( id_gtf ) REFERENCES s_trans_madeira.tb_gtf( id )  
 );

CREATE OR REPLACE FUNCTION s_trans_madeira.capacidade_veiculo_function()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
NEW.capacidade_m3 = (new.altura * new.comprimento * new.largura);
RETURN NEW;
END;
$function$

CREATE OR REPLACE FUNCTION s_trans_madeira.log_usuario_function()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
-- Aqui temos um bloco IF que confirmará o tipo de operação.
IF (TG_OP = 'INSERT') THEN
INSERT INTO s_trans_madeira.tb_log_usuario (id_usuario_alteracao, data_alteracao, tipo_alteracao, login_antes, senha_antes, perfil_antes, status_antes)
VALUES (new.id, current_timestamp, 1, new.login, new.senha, new.perfil, new.status);
RETURN NEW;
-- Aqui temos um bloco IF que confirmará o tipo de operação UPDATE
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO s_trans_madeira.tb_log_usuario (id_usuario_alteracao, data_alteracao, tipo_alteracao, login_antes, login_depois, senha_antes, senha_depois,
 perfil_antes, perfil_depois, status_antes, status_depois) 
VALUES (new.id, current_timestamp, 2, old.login, new.login, old.senha, new.senha, old.perfil, new.perfil, old.status, new.status);
RETURN NEW;
-- Aqui temos um bloco IF que confirmará o tipo de operação DELETE
ELSIF (TG_OP = 'DELETE') THEN
INSERT INTO s_trans_madeira.tb_log_usuario (id_usuario_alteracao, data_alteracao, tipo_alteracao, login_depois, senha_depois,
 perfil_depois, status_depois) 
VALUES (new.id, current_timestamp, 3, new.login, old.login, old.senha, old.perfil, old.status);
RETURN OLD;
END IF;
RETURN NULL;
END;
$function$

CREATE OR REPLACE FUNCTION s_trans_madeira.processa_dae_validade_function()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
NEW.data_validade = new.data_cadastro + interval '30 days' as timestamp;
RETURN NEW;
END;
$function$

CREATE OR REPLACE FUNCTION s_trans_madeira.processa_gtf_gera_dae_function()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
-- Aqui temos um bloco IF que confirmará o tipo de gtf é interestadual (3)
IF (NEW.id_tipo = 3) THEN
INSERT INTO s_trans_madeira.tb_dae (id_gtf, data_cadastro)
VALUES (new.id, current_timestamp);
RETURN NEW;
END IF;
RETURN NEW;
END;
$function$

CREATE OR REPLACE FUNCTION s_trans_madeira.processa_gtf_validade_function()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
NEW.data_validade = new.data_cadastro + interval '30 days' as timestamp;
RETURN NEW;
END;
$function$


-----------------views-------------------
CREATE VIEW s_trans_madeira.vw_volume_transportado AS
SELECT SUM(s_trans_madeira.tb_gtf.volume_transportado_m3), s_trans_madeira.tb_madeira.id, s_trans_madeira.tb_madeira.nome_especie
from s_trans_madeira.tb_gtf inner join s_trans_madeira.tb_madeira
on s_trans_madeira.tb_gtf.id_madeira = s_trans_madeira.tb_madeira.id
group by s_trans_madeira.tb_madeira.id, s_trans_madeira.tb_madeira.nome_especie;


create view s_trans_madeira.vw_report_completo as
select s_trans_madeira.tb_tipo_gtf.tipo as tipo_guia, 
s_trans_madeira.tb_gtf.data_cadastro as data_guia,
s_trans_madeira.tb_madeira.nome_especie as maderia, 
s_trans_madeira.tb_gtf.volume_transportado_m3 as volume_transp, 
mo.nome as origem,
eo.uf as uf_origem,
md.nome as destino, 
ed.uf as uf_destino,
s_trans_madeira.tb_veiculo.capacidade_m3 as capacidade,
s_trans_madeira.tb_empreendimento.razao_social as empreendimento
from s_trans_madeira.tb_gtf inner join s_trans_madeira.tb_tipo_gtf
on s_trans_madeira.tb_gtf.id_tipo = s_trans_madeira.tb_tipo_gtf.id
inner join s_trans_madeira.tb_madeira
on s_trans_madeira.tb_gtf.id_madeira = s_trans_madeira.tb_madeira.id
inner join s_trans_madeira.tb_rota_veiculo
on s_trans_madeira.tb_gtf.id_rota_veiculo = s_trans_madeira.tb_rota_veiculo.id
inner join s_trans_madeira.tb_rota 
on s_trans_madeira.tb_rota_veiculo.id_rota = s_trans_madeira.tb_rota.id
inner join s_trans_madeira.tb_municipio mo
on s_trans_madeira.tb_rota.id_municipio_origem = mo.id
inner join s_trans_madeira.tb_estado eo
on  mo.id_estado = eo.id
inner join s_trans_madeira.tb_municipio md
on s_trans_madeira.tb_rota.id_municipio_destino = md.id
inner join s_trans_madeira.tb_estado ed
on  md.id_estado = ed.id
inner join s_trans_madeira.tb_veiculo
on s_trans_madeira.tb_rota_veiculo.id_veiculo = s_trans_madeira.tb_veiculo.id
inner join s_trans_madeira.tb_empreendimento
on s_trans_madeira.tb_veiculo.id_empreendimento = s_trans_madeira.tb_empreendimento.id;



---------------indices-----------------
CREATE INDEX s_trans_madeira.ix_tb_gtf
   ON s_trans_madeira.tb_gtf USING btree (data_cadastro ASC NULLS LAST);
   

----------------triggers--------------------------

CREATE TRIGGER trigger_capacidade_veiculo 
BEFORE INSERT OR UPDATE ON s_trans_madeira.tb_veiculo 
FOR EACH ROW EXECUTE PROCEDURE s_trans_madeira.capacidade_veiculo_function()

CREATE TRIGGER trigger_dae_validade 
BEFORE INSERT OR UPDATE ON s_trans_madeira.tb_dae F
OR EACH ROW EXECUTE PROCEDURE s_trans_madeira.processa_dae_validade_function()

CREATE TRIGGER trigger_gtf_gera_dae 
AFTER INSERT ON s_trans_madeira.tb_gtf 
FOR EACH ROW EXECUTE PROCEDURE s_trans_madeira.processa_gtf_gera_dae_function()

CREATE TRIGGER trigger_gtf_validade 
BEFORE INSERT OR UPDATE ON s_trans_madeira.tb_gtf 
FOR EACH ROW EXECUTE PROCEDURE s_trans_madeira.processa_gtf_validade_function()

CREATE TRIGGER trigger_log_usuario_todas_operacoes 
AFTER INSERT OR DELETE OR UPDATE ON s_trans_madeira.tb_usuario 
FOR EACH ROW EXECUTE PROCEDURE s_trans_madeira.log_usuario_function()



   
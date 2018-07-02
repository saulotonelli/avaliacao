INSERT INTO s_trans_madeira.tb_empreendimento( id, razao_social, nome_fantasia, cnpj, endereco, bairro, cep, telefone, email, data_cadastro, status ) VALUES ( 1, 'madeireira sao jose', 'madeireira sao jose', '12345678910987', 'rua A', 'centro', '37250000      ', '3538611020', 'sj@sj.com.br', '2018-07-02 01:33:22.170765-03', 1 ); 
INSERT INTO s_trans_madeira.tb_empreendimento( id, razao_social, nome_fantasia, cnpj, endereco, bairro, cep, telefone, email, data_cadastro, status ) VALUES ( 2, 'Empreiteira JP', 'Empreiteira JP', '12345678910987', 'rua direita', 'centro', '37250000      ', '3538611020', 'jp@jp.com.br', '2018-07-02 01:34:48.648031-03', 1 ); 
INSERT INTO s_trans_madeira.tb_empreendimento( id, razao_social, nome_fantasia, cnpj, endereco, bairro, cep, telefone, email, data_cadastro, status ) VALUES ( 3, 'Maria S/A', 'Maria S/A', '12345678910987', 'avenida perimetral', 'lajeado', '37250000      ', '3538611020', 'maria@maria.com.br', '2018-07-02 01:36:28.393764-03', 1 ); 

INSERT INTO s_trans_madeira.tb_madeira( id, nome_especie, nome_cientifico, data_cadastro, status ) VALUES ( 1, 'Peroba do Norte', ' Goupia Glabra', '2018-07-02 08:30:54.622391-03', 1 ); 
INSERT INTO s_trans_madeira.tb_madeira( id, nome_especie, nome_cientifico, data_cadastro, status ) VALUES ( 2, 'Garapeira', 'Apuleia Ieiocarpa', '2018-07-02 08:31:26.209123-03', 1 ); 
INSERT INTO s_trans_madeira.tb_madeira( id, nome_especie, nome_cientifico, data_cadastro, status ) VALUES ( 3, 'Cedrinho', 'Erisma Uncinatum', '2018-07-02 08:31:52.329928-03', 1 ); 

INSERT INTO s_trans_madeira.tb_pais( id, nome ) VALUES ( 1, 'BRASIL' ); 

INSERT INTO s_trans_madeira.tb_perfil( id, nome ) VALUES ( 1, 'ADMIN' ); 
INSERT INTO s_trans_madeira.tb_perfil( id, nome ) VALUES ( 2, 'GERAL' ); 

INSERT INTO s_trans_madeira.tb_tipo_alteracao( id, nome ) VALUES ( 1, 'INSERT' ); 
INSERT INTO s_trans_madeira.tb_tipo_alteracao( id, nome ) VALUES ( 2, 'UPDATE' ); 
INSERT INTO s_trans_madeira.tb_tipo_alteracao( id, nome ) VALUES ( 3, 'DELETE' ); 

INSERT INTO s_trans_madeira.tb_tipo_gtf( id, tipo ) VALUES ( 1, 'GTF1: TRANSPORTE MUNICIPAL' ); 
INSERT INTO s_trans_madeira.tb_tipo_gtf( id, tipo ) VALUES ( 2, 'GTF2: TRANSPORTE INTERMUNICIPAL' ); 
INSERT INTO s_trans_madeira.tb_tipo_gtf( id, tipo ) VALUES ( 3, 'GTF3: TRANSPORTE INTERESTADUAL' ); 

INSERT INTO s_trans_madeira.tb_tipo_veiculo( id, nome ) VALUES ( 1, 'RODOVIARIO' ); 
INSERT INTO s_trans_madeira.tb_tipo_veiculo( id, nome ) VALUES ( 2, 'FERROVIARIO' ); 
INSERT INTO s_trans_madeira.tb_tipo_veiculo( id, nome ) VALUES ( 3, 'FLUVIAL' ); 
INSERT INTO s_trans_madeira.tb_tipo_veiculo( id, nome ) VALUES ( 4, 'MARITMO' ); 

INSERT INTO s_trans_madeira.tb_usuario( id, login, senha, data_cadastro, status, data_validade_cadastro, perfil ) VALUES ( 2, 'saulo', '12345', '2018-07-02 01:04:58.906107-03', 1, '2018-12-31 01:00:00-02', 2 ); 

INSERT INTO s_trans_madeira.tb_veiculo( id, nome, ano_fabricacao, capacidade_m3, altura, comprimento, largura, data_cadastro, status, tipo_veiculo, id_empreendimento ) VALUES ( 1, 'caminhao 1', 1983, 120.00, 3.00, 10.00, 4.00, '2018-07-02 08:03:40.196359-03', 1, 1, 1 ); 
INSERT INTO s_trans_madeira.tb_veiculo( id, nome, ano_fabricacao, capacidade_m3, altura, comprimento, largura, data_cadastro, status, tipo_veiculo, id_empreendimento ) VALUES ( 2, 'caminhao 2', 2010, 140.00, 3.50, 10.00, 4.00, '2018-07-02 08:10:20.741455-03', 1, 1, 1 ); 
INSERT INTO s_trans_madeira.tb_veiculo( id, nome, ano_fabricacao, capacidade_m3, altura, comprimento, largura, data_cadastro, status, tipo_veiculo, id_empreendimento ) VALUES ( 3, 'Composicao delta', 2015, 1200.00, 3.00, 100.00, 4.00, '2018-07-02 08:13:14.472386-03', 1, 2, 2 ); 
INSERT INTO s_trans_madeira.tb_veiculo( id, nome, ano_fabricacao, capacidade_m3, altura, comprimento, largura, data_cadastro, status, tipo_veiculo, id_empreendimento ) VALUES ( 4, 'Barco A', 2017, 3000.00, 5.00, 50.00, 12.00, '2018-07-02 08:19:58.984869-03', 1, 3, 3 ); 
INSERT INTO s_trans_madeira.tb_veiculo( id, nome, ano_fabricacao, capacidade_m3, altura, comprimento, largura, data_cadastro, status, tipo_veiculo, id_empreendimento ) VALUES ( 5, 'Navio 55', 1990, 30000.00, 10.00, 150.00, 20.00, '2018-07-02 08:22:58.738824-03', 1, 4, 3 ); 

INSERT INTO s_trans_madeira.tb_veiculo_ferroviario( id, numero, linha, vagoes, id_veiculo ) VALUES ( 1, 7725, 'linha 2', 40, 3 ); 

INSERT INTO s_trans_madeira.tb_veiculo_fluvial( id, tipo_embarcacao, nome_hidrovia, id_veiculo ) VALUES ( 1, 'Barcaça', 'Solimões', 4 ); 

INSERT INTO s_trans_madeira.tb_veiculo_maritmo( id, numero_inscricao, id_pais, id_veiculo ) VALUES ( 1, 'NV1572', 1, 5 ); 

INSERT INTO s_trans_madeira.tb_estado( id, nome, uf, id_pais ) VALUES ( 1, 'PARÁ', 'PA', 1 ); 
INSERT INTO s_trans_madeira.tb_estado( id, nome, uf, id_pais ) VALUES ( 2, 'AMAZONAS', 'AM', 1 ); 
INSERT INTO s_trans_madeira.tb_estado( id, nome, uf, id_pais ) VALUES ( 3, 'RORAIMA', 'RO', 1 ); 

INSERT INTO s_trans_madeira.tb_log_usuario( id, id_usuario_alteracao, login_antes, login_depois, senha_antes, senha_depois, data_alteracao, perfil_antes, perfil_depois, status_antes, status_depois, tipo_alteracao ) VALUES ( 1, 2, 'saulo', null, '12345', null, '2018-07-02 01:04:58.906107-03', 2, null, 1, null, 1 ); 

INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 1, 'ALTAMIRA', 1 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 2, 'PARAGOMINAS', 1 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 3, 'COARI', 2 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 4, 'TAPAUA', 2 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 5, 'IRACEMA', 3 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 6, 'ALTO ALEGRE', 3 ); 
INSERT INTO s_trans_madeira.tb_municipio( id, nome, id_estado ) VALUES ( 7, 'SÃO LUIS', 1 ); 

INSERT INTO s_trans_madeira.tb_proprietario( id, nome, cpf, data_nascimento, data_cadastro, email, id_usuario, status ) VALUES ( 1, 'saulo castro', '12345678900', '1982-01-05', '2018-07-02 01:25:42.184478-03', 'saulo.tonelli@gmail.com', 2, 1 ); 
INSERT INTO s_trans_madeira.tb_proprietario( id, nome, cpf, data_nascimento, data_cadastro, email, id_usuario, status ) VALUES ( 2, 'joao paulo', '12345678900', '1981-12-07', '2018-07-02 01:26:27.986499-03', 'joaopaulo@gmail.com', 2, 1 ); 
INSERT INTO s_trans_madeira.tb_proprietario( id, nome, cpf, data_nascimento, data_cadastro, email, id_usuario, status ) VALUES ( 3, 'maria paulo', '12345678900', '1985-08-25', '2018-07-02 01:27:21.637007-03', 'maria@gmail.com', 2, 1 ); 

INSERT INTO s_trans_madeira.tb_proprietario_empreendimento( id, id_proprietario, id_empreendimento ) VALUES ( 1, 1, 1 ); 
INSERT INTO s_trans_madeira.tb_proprietario_empreendimento( id, id_proprietario, id_empreendimento ) VALUES ( 2, 2, 2 ); 
INSERT INTO s_trans_madeira.tb_proprietario_empreendimento( id, id_proprietario, id_empreendimento ) VALUES ( 3, 3, 3 ); 
INSERT INTO s_trans_madeira.tb_proprietario_empreendimento( id, id_proprietario, id_empreendimento ) VALUES ( 4, 1, 3 ); 
INSERT INTO s_trans_madeira.tb_proprietario_empreendimento( id, id_proprietario, id_empreendimento ) VALUES ( 5, 2, 3 ); 

INSERT INTO s_trans_madeira.tb_rota( id, nome, id_municipio_origem, id_municipio_destino, data_cadastro, status ) VALUES ( 1, 'MUNICIPAL - COARI', 3, 3, '2018-07-02 08:37:49.612587-03', 1 ); 
INSERT INTO s_trans_madeira.tb_rota( id, nome, id_municipio_origem, id_municipio_destino, data_cadastro, status ) VALUES ( 2, 'INTERMUNICIPAL - COARI - TAPUA', 3, 4, '2018-07-02 08:38:56.30581-03', 1 ); 
INSERT INTO s_trans_madeira.tb_rota( id, nome, id_municipio_origem, id_municipio_destino, data_cadastro, status ) VALUES ( 3, 'INTERESTADUAL - IRACEMA - S.LUIZ', 5, 7, '2018-07-02 08:40:02.383666-03', 1 ); 
INSERT INTO s_trans_madeira.tb_rota( id, nome, id_municipio_origem, id_municipio_destino, data_cadastro, status ) VALUES ( 4, 'INTERESTADUAL - TAPAUA - S.LUIZ', 4, 7, '2018-07-02 08:41:54.44896-03', 1 ); 

INSERT INTO s_trans_madeira.tb_rota_veiculo( id, id_veiculo, id_rota ) VALUES ( 1, 1, 1 ); 
INSERT INTO s_trans_madeira.tb_rota_veiculo( id, id_veiculo, id_rota ) VALUES ( 2, 2, 2 ); 
INSERT INTO s_trans_madeira.tb_rota_veiculo( id, id_veiculo, id_rota ) VALUES ( 3, 3, 3 ); 
INSERT INTO s_trans_madeira.tb_rota_veiculo( id, id_veiculo, id_rota ) VALUES ( 4, 4, 4 ); 
INSERT INTO s_trans_madeira.tb_rota_veiculo( id, id_veiculo, id_rota ) VALUES ( 5, 5, 4 ); 

INSERT INTO s_trans_madeira.tb_veiculo_rodoviario( id, placa, id_municipio, renavam, marca, modelo, id_veiculo ) VALUES ( 1, 'ABC1234', 1, '12345678900', 'FORD', 'F5000', 1 ); 
INSERT INTO s_trans_madeira.tb_veiculo_rodoviario( id, placa, id_municipio, renavam, marca, modelo, id_veiculo ) VALUES ( 2, 'XPO9999', 1, '12345678900', 'VW', 'VW100', 2 ); 

INSERT INTO s_trans_madeira.tb_gtf( id, id_tipo, id_rota_veiculo, id_madeira, volume_transportado_m3, data_cadastro, data_validade ) VALUES ( 4, 1, 1, 1, 110.00, '2018-07-02 09:45:24.018616-03', '2018-08-01 09:45:24.018616-03' ); 
INSERT INTO s_trans_madeira.tb_gtf( id, id_tipo, id_rota_veiculo, id_madeira, volume_transportado_m3, data_cadastro, data_validade ) VALUES ( 5, 2, 2, 2, 140.00, '2018-07-02 09:47:09.033712-03', '2018-08-01 09:47:09.033712-03' ); 
INSERT INTO s_trans_madeira.tb_gtf( id, id_tipo, id_rota_veiculo, id_madeira, volume_transportado_m3, data_cadastro, data_validade ) VALUES ( 7, 3, 5, 3, 29000.00, '2018-07-02 09:54:05.649158-03', '2018-08-01 09:54:05.649158-03' ); 
INSERT INTO s_trans_madeira.tb_gtf( id, id_tipo, id_rota_veiculo, id_madeira, volume_transportado_m3, data_cadastro, data_validade ) VALUES ( 8, 3, 4, 3, 2500.00, '2018-07-02 09:55:05.62003-03', '2018-08-01 09:55:05.62003-03' ); 
INSERT INTO s_trans_madeira.tb_gtf( id, id_tipo, id_rota_veiculo, id_madeira, volume_transportado_m3, data_cadastro, data_validade ) VALUES ( 9, 3, 3, 2, 1000.00, '2018-07-02 10:46:58.295527-03', '2018-08-01 10:46:58.295527-03' ); 

INSERT INTO s_trans_madeira.tb_dae( numero, id_gtf, data_cadastro, data_validade, valor ) VALUES ( 2, 7, '2018-07-02 09:54:05.649158-03', '2018-08-01 09:54:05.649158-03', 500.00 ); 
INSERT INTO s_trans_madeira.tb_dae( numero, id_gtf, data_cadastro, data_validade, valor ) VALUES ( 3, 8, '2018-07-02 09:55:05.62003-03', '2018-08-01 09:55:05.62003-03', 500.00 ); 
INSERT INTO s_trans_madeira.tb_dae( numero, id_gtf, data_cadastro, data_validade, valor ) VALUES ( 4, 9, '2018-07-02 10:46:58.295527-03', '2018-08-01 10:46:58.295527-03', 500.00 ); 


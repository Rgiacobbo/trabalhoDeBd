CREATE TABLE CLIENTE (IdCliente INTEGER,
					nome CHAR(20),
                    CPF CHAR(10),
                    DataDeNacimento DATE,
                    email CHAR(20),
                    NomeDaEmpresa CHAR(20),
                    CartãoDeCredito CHAR(20),
                    PRIMARY KEY (IdCliente));
             
CREATE TABLE MOTORISTA (IdMotorista INTEGER,
						nome CHAR(20),
                        CPF CHAR(10),
                        DataDeNacimento DATE,
                        email CHAR(20),
                        PRIMARY KEY (IdMotorista));

CREATE TABLE INFOCARRO (IdMotoristaCar INTEGER,
						ModeloCarro CHAR(20),
                        Placa CHAR(10),
                        ano DATE,
                        Cor CHAR(20),
                        PRIMARY KEY (IdMororistaCar),
                        FOREIGN KEY (IdMotoristaCar) REFERENCES MOTORISTA (IdMotorista));
                        
CREATE TABLE TELEFONECLIENTE(IdCliente INTEGER,
							Telefone INTEGER,
                            PRIMARY KEY (IdCliente),
                            FOREIGN KEY (IdCliente) REFERENCES CLIENTE (IdCliente));

CREATE TABLE TELEFONEMOTORISTA(IdMotorista INTEGER,
							Telefone INTEGER,
                            PRIMARY KEY (IdMotorista),
                            FOREIGN KEY (IdMotorista) REFERENCES MOTORISTA (IdMotorista));
                            
CREATE TABLE ENDERECOCLIENTE (IdClienteEND INTEGER,
							cidade CHAR(20),
                            rua CHAR(20),
                            bairo CHAR(20),
                            numerodacasa INTEGER,
                            PRIMARY KEY (IdClienteEND),
                            FOREIGN KEY (IdClienteEND) REFERENCES CLIENTE (IdCliente));
                            
CREATE TABLE ENDERECOMOTORISTA (IdMotoristaEND INTEGER,
							cidade CHAR(20),
                            rua CHAR(20),
                            bairo CHAR(20),
                            numerodacasa INTEGER,
                            PRIMARY KEY (IdMotoristaEND),
                            FOREIGN KEY(IdMotoristaEND) REFERENCES CLIENTE (IdMotorista));
                            
CREATE TABLE PAGAMENTO(IdCliente INTEGER,
						IdMotorista INTEGER,
                        valor INTEGER,
                        PRIMARY KEY(IdCliente, IdMotorista),
						FOREIGN KEY (IdCliente) REFERENCES CLIENTE (IdCliente),
						FOREIGN KEY(IdMotorista) REFERENCES CLIENTE (IdMotorista));
                        
CREATE TABLE VIAGEM(IdCliente INTEGER,
						IdMotorista INTEGER,
                        ENDERECO CHAR(40),
                        TipoDeCarga CHAR(20),
                        IdViagem INTEGER,
                        PRIMARY KEY(IdCliente, IdMotorista, IdViagem),
						FOREIGN KEY (IdCliente) REFERENCES CLIENTE (IdCliente),
						FOREIGN KEY(IdMotorista) REFERENCES CLIENTE (IdMotorista));

CREATE TABLE HISTORICO(IdViagem INTEGER,
							Cliente CHAR(30),
                            Motorista CHAR(30),
                            DataDaViagem DATE,
                            TempoDaViagem TIME,
                            TipoDeCarga CHAR(30),
                            ValorPago INTEGER,
                            PRIMARY KEY (IdViagem),
                            FOREIGN KEY (IdViagem) REFERENCES VIAGEM (IdViagem));
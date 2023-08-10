CREATE TABLE estado (
                        codigo SERIAL PRIMARY KEY,
                        nome VARCHAR(50) NOT NULL
);

INSERT INTO estado (nome) VALUES
                              ('Acre'),
                              ('Alagoas'),
                              ('Amazonas'),
                              ('Amapá'),
                              ('Bahia'),
                              ('Ceará'),
                              ('Distrito Federal'),
                              ('Espírito Santo'),
                              ('Goiás'),
                              ('Maranhão'),
                              ('Minas Gerais'),
                              ('Mato Grosso do Sul'),
                              ('Mato Grosso'),
                              ('Pará'),
                              ('Paraíba'),
                              ('Pernambuco'),
                              ('Piauí'),
                              ('Paraná'),
                              ('Rio de Janeiro'),
                              ('Rio Grande do Norte'),
                              ('Rondônia'),
                              ('Roraima'),
                              ('Rio Grande do Sul'),
                              ('Santa Catarina'),
                              ('Sergipe'),
                              ('São Paulo'),
                              ('Tocantins');

CREATE TABLE cidade (
                        codigo SERIAL PRIMARY KEY,
                        nome VARCHAR(50) NOT NULL,
                        codigo_estado BIGINT REFERENCES estado(codigo)
);

INSERT INTO cidade (nome, codigo_estado) VALUES
                                             ('Belo Horizonte', 11),
                                             ('Uberlândia', 11),
                                             ('Uberaba', 11),
                                             ('São Paulo', 26),
                                             ('Campinas', 26),
                                             ('Rio de Janeiro', 19),
                                             ('Angra dos Reis', 19),
                                             ('Goiânia', 9),
                                             ('Caldas Novas', 9);

ALTER TABLE pessoa DROP COLUMN cidade;
ALTER TABLE pessoa DROP COLUMN estado;
ALTER TABLE pessoa ADD COLUMN codigo_cidade BIGINT;
ALTER TABLE pessoa ADD CONSTRAINT fk_pessoa_cidade FOREIGN KEY (codigo_cidade) REFERENCES cidade(codigo);

UPDATE pessoa SET codigo_cidade = 2;

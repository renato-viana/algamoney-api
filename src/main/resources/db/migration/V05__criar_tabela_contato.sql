CREATE TABLE contato (
                         codigo BIGSERIAL PRIMARY KEY,
                         codigo_pessoa BIGINT NOT NULL,
                         nome VARCHAR(50) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         telefone VARCHAR(20) NOT NULL,
                         FOREIGN KEY (codigo_pessoa) REFERENCES pessoa(codigo)
);

INSERT INTO contato (codigo, codigo_pessoa, nome, email, telefone) values (1, 1, 'Marcos Henrique', 'marcos@algamoney.com', '00 0000-0000');

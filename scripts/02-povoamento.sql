INSERT INTO usuario (nome, email, cpf, senha, genero) VALUES
('Carlos Proprietário', 'carlos@roomie.com', '07297022004', '$2a$10$N.zmdr9k7uOCQb376NoUnutj8iAt6aBECYnzhO99ZjYd5x7of5w0m', 'MASCULINO'),
('Ana Estudante', 'ana@ufape.edu.br', '21426363060', '$2a$10$N.zmdr9k7uOCQb376NoUnutj8iAt6aBECYnzhO99ZjYd5x7of5w0m', 'FEMININO'),
('Marcos Calouro', 'marcos@ufape.edu.br', '62132436070', '$2a$10$N.zmdr9k7uOCQb376NoUnutj8iAt6aBECYnzhO99ZjYd5x7of5w0m', 'MASCULINO');

INSERT INTO estudante (id_estudante, curso, instituicao) VALUES
(2, 'Ciência da Computação', 'UFAPE'),
(3, 'Agronomia', 'UFAPE');

INSERT INTO telefone (id_usuario, numero) VALUES
(1, '87999990001'),
(2, '87999990002'),
(3, '87999990003');

INSERT INTO habito (id_estudante, horario_estudo) VALUES
(2, 'NOITE'),
(3, 'MANHÃ');

INSERT INTO estilo_vida (id_habito, estilo) VALUES
(1, 'Calmo'),
(2, 'Agitado');

INSERT INTO preferencia_limpeza (id_habito, preferencia) VALUES
(1, 'Alta'),
(2, 'Média');

INSERT INTO hobby (id_habito, hobby) VALUES
(1, 'Programação'),
(1, 'Leitura'),
(2, 'Futebol'),
(2, 'Videogame');

INSERT INTO imovel (id_proprietario, titulo, descricao, tipo, preco, genero_moradores, aceita_animais) VALUES
(1, 'Suíte confortável próximo à UFAPE', 'Quarto com banheiro privativo, internet inclusa.', 'Quarto', 600.00, 'Feminino', TRUE),
(1, 'Casa inteira no Aluísio', 'Casa com 3 quartos, ideal para estudantes.', 'Casa', 1000.00, 'Indiferente', FALSE);

INSERT INTO endereco (id_imovel, rua, bairro, numero, cidade, estado, cep) VALUES
(1, 'Rua Deocleciano Soares da Rocha', 'Boa Vista', '123', 'Garanhuns', 'Pernambuco', '55292-760'),
(2, 'Rua Luís Gama', 'Aluísio', '32', 'Garanhuns', 'Pernambuco', '55292-045');

INSERT INTO imagem_imovel (id_imovel, caminho_imagem) VALUES
(1, '/imagens/quartos/suite_01.jpg'),
(1, '/imagens/quartos/suite_02.jpg'),
(2, '/imagens/casas/frente_casa.jpg');

INSERT INTO contrato_locacao (id_imovel, id_estudante, id_proprietario, data_inicio, data_fim, valor_aluguel, status_contrato) VALUES
(1, 2, 1, '2026-03-01', '2026-09-01', 600.00, 'ATIVO');

INSERT INTO avaliacao_imovel (id_imovel, id_estudante, nota, comentario) VALUES
(1, 2, 5, 'Excelente apartamento, muito confortável e bem localizado. Recomendo!');

INSERT INTO chat (id_estudante, id_proprietario, id_imovel) VALUES
(2, 1, 1);

INSERT INTO mensagem (id_chat, id_remetente, conteudo, lida) VALUES
(1, 2, 'Olá Carlos, estou interessada na suíte que você anunciou. Podemos conversar mais sobre ela?', TRUE),
(1, 1, 'Olá Ana! Claro, a suíte está disponível e é perfeita para estudantes. Você gostaria de agendar uma visita?', TRUE),
(1, 2, 'Sim, adoraria agendar uma visita. Quando seria um bom momento para você?', TRUE),
(1, 1, 'Que tal amanhã à tarde? Estou disponível a partir das 14h.', TRUE),
(1, 2, 'Perfeito! Nos vemos amanhã às 14h então. Obrigada!', TRUE),
(1, 1, 'Ótimo! Até amanhã, Ana.', TRUE);
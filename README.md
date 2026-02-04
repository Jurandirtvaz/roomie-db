# roomie-db
Banco de Dados do Projeto Roomie

# Dicionário de Dados

## TABELA: usuario
**Descrição:** Armazena os dados básicos de todos os usuários do sistema (estudantes e proprietários).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_usuario | SERIAL | PRIMARY KEY | Identificador único do usuário, gerado automaticamente |
| nome | VARCHAR(100) | NOT NULL | Nome completo do usuário |
| email | VARCHAR(100) | UNIQUE, NOT NULL | Email para login e comunicação, deve ser único no sistema |
| senha | VARCHAR(255) | NOT NULL | Senha criptografada do usuário |
| genero | tipo_genero | ENUM('Masculino', 'Feminino', 'Outro') | Gênero do usuário |

---

## TABELA: estudante
**Descrição:** Especialização de usuário, armazena informações específicas de estudantes que buscam moradia.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_estudante | INT | PRIMARY KEY, FOREIGN KEY → usuario(id_usuario), ON DELETE CASCADE | Referência ao usuário que é estudante |
| curso | VARCHAR(100) | NOT NULL | Curso que o estudante está cursando |
| instituicao | VARCHAR(100) | NOT NULL | Nome da instituição de ensino |

---

## TABELA: telefone
**Descrição:** Armazena os telefones de contato dos usuários (um usuário pode ter múltiplos telefones).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_telefone | SERIAL | PRIMARY KEY | Identificador único do telefone |
| id_usuario | INT | FOREIGN KEY → usuario(id_usuario), NOT NULL, ON DELETE CASCADE | Usuário dono do telefone |
| numero | VARCHAR(20) | NOT NULL | Número de telefone com DDD |

---

## TABELA: habito
**Descrição:** Armazena informações básicas sobre os hábitos de estudo do estudante.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_habito | SERIAL | PRIMARY KEY | Identificador único do registro de hábitos |
| id_estudante | INT | FOREIGN KEY → estudante(id_estudante), NOT NULL, ON DELETE CASCADE | Estudante ao qual os hábitos pertencem |
| horario_estudo | VARCHAR(100) | - | Período preferencial de estudo (ex: Manhã, Tarde, Noite, Madrugada) |

---

## TABELA: estilo_vida
**Descrição:** Armazena os estilos de vida do estudante (relacionamento 1:N com habito - um estudante pode ter múltiplos estilos).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_estilo | SERIAL | PRIMARY KEY | Identificador único do estilo de vida |
| id_habito | INT | FOREIGN KEY → habito(id_habito), NOT NULL, ON DELETE CASCADE | Hábito ao qual o estilo pertence |
| estilo | VARCHAR(100) | NOT NULL | Estilo de vida (ex: Caseiro, Sociável, Festeiro, Tranquilo, Estudioso) |

---

## TABELA: preferencia_limpeza
**Descrição:** Armazena as preferências de limpeza e organização do estudante (relacionamento 1:N com habito).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_preferencia | SERIAL | PRIMARY KEY | Identificador único da preferência |
| id_habito | INT | FOREIGN KEY → habito(id_habito), NOT NULL, ON DELETE CASCADE | Hábito ao qual a preferência pertence |
| preferencia | VARCHAR(100) | NOT NULL | Preferência de limpeza (ex: Muito organizado, Organizado, Relaxado, Gosta de ambiente limpo) |

---

## TABELA: hobby
**Descrição:** Armazena os hobbies e interesses do estudante (relacionamento 1:N com habito - um estudante pode ter múltiplos hobbies).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_hobby | SERIAL | PRIMARY KEY | Identificador único do hobby |
| id_habito | INT | FOREIGN KEY → habito(id_habito), NOT NULL, ON DELETE CASCADE | Hábito ao qual o hobby pertence |
| hobby | VARCHAR(100) | NOT NULL | Hobby ou interesse (ex: Leitura, Jogos, Programação, Esportes, Música) |

---

## TABELA: imovel
**Descrição:** Cadastro de imóveis disponíveis para locação por estudantes.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_imovel | SERIAL | PRIMARY KEY | Identificador único do imóvel |
| id_proprietario | INT | FOREIGN KEY → usuario(id_usuario), NOT NULL, ON DELETE CASCADE | Usuário que é proprietário do imóvel |
| titulo | VARCHAR(100) | NOT NULL | Título do anúncio do imóvel |
| descricao | TEXT | - | Descrição detalhada do imóvel e suas características |
| tipo | VARCHAR(50) | NOT NULL | Tipo do imóvel (ex: Quarto, Apartamento, Casa, República) |
| preco | DECIMAL(10,2) | NOT NULL | Valor mensal do aluguel em reais |
| genero_moradores | VARCHAR(20) | - | Gênero dos moradores aceitos (ex: Masculino, Feminino, Misto, Indiferente) |
| aceita_animais | BOOLEAN | DEFAULT FALSE | Indica se aceita animais de estimação |

---

## TABELA: endereco
**Descrição:** Localização completa do imóvel (relação 1:1 com imóvel).

| Atributo    | Tipo | Restrições | Descrição                                                              |
|-------------|------|------------|------------------------------------------------------------------------|
| id_endereco | SERIAL | PRIMARY KEY | Identificador único do endereço                                        |
| id_imovel   | INT | FOREIGN KEY → imovel(id_imovel), NOT NULL, UNIQUE, ON DELETE CASCADE | Imóvel ao qual o endereço pertence (cada imóvel tem um único endereço) |
| rua         | VARCHAR(100) | NOT NULL | Nome da rua                                                            |
| bairro      | VARCHAR(100) | NOT NULL | Nome do bairro                                                         |
| numero      | VARCHAR(10) | NOT NULL | Número do imóvel                                                       |
| cidade      | VARCHAR(50) | NOT NULL | Cidade onde o imóvel está localizado                                   |
| estado      | VARCHAR(50) | NOT NULL | Estado (UF)                                                            |
| cep         | VARCHAR(20) | NOT NULL | Código de Endereçamento Postal                                         |

---

## TABELA: foto_imovel
**Descrição:** Fotos do imóvel para visualização no anúncio (um imóvel pode ter várias fotos).

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_imagem | SERIAL | PRIMARY KEY | Identificador único da foto |
| id_imovel | INT | FOREIGN KEY → imovel(id_imovel), NOT NULL, ON DELETE CASCADE | Imóvel ao qual a foto pertence |
| caminho_imagem | VARCHAR(255) | NOT NULL | Caminho/URL da imagem no servidor |

---

## TABELA: contrato_locacao
**Descrição:** Registra os contratos de locação firmados entre estudantes e proprietários.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_contrato | SERIAL | PRIMARY KEY | Identificador único do contrato |
| id_imovel | INT | FOREIGN KEY → imovel(id_imovel), NOT NULL, ON DELETE CASCADE | Imóvel objeto do contrato |
| id_estudante | INT | FOREIGN KEY → estudante(id_estudante), NOT NULL, ON DELETE CASCADE | Estudante locatário |
| data_inicio | DATE | NOT NULL, CHECK (data_fim > data_inicio) | Data de início da locação |
| data_fim | DATE | NOT NULL | Data de término da locação |
| valor_aluguel | DECIMAL(10,2) | NOT NULL | Valor mensal acordado no contrato |

---

## TABELA: avaliacao_imovel
**Descrição:** Avaliações e comentários de estudantes sobre imóveis onde já moraram ou visitaram.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_avaliacao | SERIAL | PRIMARY KEY | Identificador único da avaliação |
| id_imovel | INT | FOREIGN KEY → imovel(id_imovel), NOT NULL, ON DELETE CASCADE | Imóvel sendo avaliado |
| id_estudante | INT | FOREIGN KEY → estudante(id_estudante), NOT NULL, ON DELETE CASCADE | Estudante que fez a avaliação |
| nota | INT | CHECK (nota >= 1 AND nota <= 5) | Nota de 1 a 5 estrelas |
| comentario | TEXT | - | Comentário detalhado sobre a experiência |
| data_avaliacao | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Data e hora em que a avaliação foi feita |

---

## TABELA: chat
**Descrição:** Conversas entre estudantes e proprietários sobre um imóvel específico.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_chat | SERIAL | PRIMARY KEY | Identificador único da conversa |
| id_estudante | INT | FOREIGN KEY → estudante(id_estudante), NOT NULL, ON DELETE CASCADE | Estudante participante da conversa |
| id_proprietario | INT | FOREIGN KEY → usuario(id_usuario), NOT NULL, ON DELETE CASCADE | Proprietário participante da conversa |
| id_imovel | INT | FOREIGN KEY → imovel(id_imovel), NOT NULL, ON DELETE CASCADE | Imóvel sobre o qual a conversa trata |
| data_criacao | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Data e hora de criação do chat |

---

## TABELA: mensagem
**Descrição:** Mensagens trocadas dentro de cada chat.

| Atributo | Tipo | Restrições | Descrição |
|----------|------|------------|-----------|
| id_mensagem | SERIAL | PRIMARY KEY | Identificador único da mensagem |
| id_chat | INT | FOREIGN KEY → chat(id_chat), NOT NULL, ON DELETE CASCADE | Chat ao qual a mensagem pertence |
| id_remetente | INT | FOREIGN KEY → usuario(id_usuario), NOT NULL, ON DELETE CASCADE | Usuário que enviou a mensagem |
| conteudo | TEXT | NOT NULL | Conteúdo textual da mensagem |
| timestamp_mensagem | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Data e hora de envio da mensagem |

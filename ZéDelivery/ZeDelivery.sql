CREATE TABLE [CLIENTE]
(
[COD_CLIENTE] NVARCHAR(160) NOT NULL,
[COD_USUARIO] NVARCHAR(160) NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[CPF] NVARCHAR(160) NOT NULL,
[ENDERECO] NVARCHAR(160) NOT NULL,
[TELEFONE] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_CLIENTE] PRIMARY KEY ([COD_CLIENTE])
CONSTRAINT [FK_USUARIO] FOREIGN KEY ([COD_USUARIO]) REFERENCES USUARIO(COD_USUARIO)
);
CREATE UNIQUE INDEX [IPK_CLIENTE] ON [CLIENTE]([COD_CLIENTE])

CREATE TABLE [USUARIO]
(
[COD_USUARIO] NVARCHAR(160) NOT NULL,
[LOGIN] NVARCHAR(160) NOT NULL,
[SENHA] NVARCHAR(160) NOT NULL,
[EMAIL] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_USUARIO] PRIMARY KEY ([COD_USUARIO])
);
CREATE UNIQUE INDEX [IPK_USUARIO] ON[USUARIO]([COD_USUARIO])

CREATE TABLE [PEDIDO]
(
[COD_PEDIDO] NVARCHAR(160) NOT NULL,
[COD_CLIENTE] NVARCHAR(160) NOT NULL,
[COD_VENDEDOR] NVARCHAR(160) NOT NULL,
[COD_LOJA] NVARCHAR(160) NOT NULL,
[STATUS] NVARCHAR(160) NOT NULL,
[TEMPO_ESPERA] TIME NOT NULL,
[VLR_PEDIDO] double(40) NOT NULL,
[DATA] DATETIME NOT NULL,
CONSTRAINT [PK_PEDIDO] PRIMARY KEY ([COD_PEDIDO])
CONSTRAINT [FK_CLIENTE] FOREIGN KEY ([COD_CLIENTE]) REFERENCES CLIENTE(COD_CLIENTE)
CONSTRAINT [FK_VENDEDOR] FOREIGN KEY ([COD_VENDEDOR]) REFERENCES VENDEDOR(COD_VENDEDOR)
CONSTRAINT [FK_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES VENDEDOR(COD_LOJA)
);
CREATE UNIQUE INDEX [IPK_PEDIDO] ON[PEDIDO]([COD_PEDIDO])

CREATE TABLE [VENDEDOR]
(
[COD_VENDEDOR] NVARCHAR(160) NOT NULL,
[COD_USUARIO] NVARCHAR(160) NOT NULL,
[COD_LOJA] NVARCHAR(160) NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[CPF] NVARCHAR(160) NOT NULL,
[ENDERECO] NVARCHAR(160) NOT NULL,
[TELEFONE] NVARCHAR(160) NOT NULL,
[ADMIN] BOOLEAN NOT NULL,
CONSTRAINT [PK_VENDEDOR] PRIMARY KEY ([COD_VENDEDOR])
CONSTRAINT [FK_USUARIO] FOREIGN KEY ([COD_USUARIO]) REFERENCES USUARIO(COD_USUARIO)
CONSTRAINT [FK_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES ESTOQUE(COD_LOJA)
);
CREATE UNIQUE INDEX [IPK_VENDEDOR] ON[VENDEDOR]([COD_VENDEDOR])]

CREATE TABLE [LOJA]
(
[COD_LOJA] NVARCHAR(160) NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[ENDERECO] NVARCHAR(160) NOT NULL,
[TELEFONE] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_LOJA] PRIMARY KEY ([COD_LOJA])
);
CREATE UNIQUE INDEX [IPK_LOJA] ON[LOJA] ([COD_LOJA])

CREATE TABLE [ESTOQUE]
(
[COD_ESTOQUE] NVARCHAR(160) NOT NULL,
[COD_PRODUTO] NVARCHAR(160) NOT NULL,
[COD_LOJA] NVARCHAR(160) NOT NULL,
[QTD_PRODUTO] INTEGER(96) NOT NULL,
CONSTRAINT [PK_ESTOQUE] PRIMARY KEY ([COD_ESTOQUE])
CONSTRAINT [FK_PRODUTO] FOREIGN KEY ([COD_PRODUTO]) REFERENCES PRODUTO(COD_PRODUTO)
CONSTRAINT [FK_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES VENDEDOR(COD_LOJA)
CONSTRAINT [FK_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES LOJA(COD_LOJA)
);
CREATE UNIQUE INDEX [IPK_ESTOQUE] ON [ESTOQUE]([COD_ESTOQUE])

CREATE TABLE [PRODUTO]
(
[COD_PRODUTO] NVARCHAR(160) NOT NULL,
[COD_FORNECEDOR] NVARCHAR(160) NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[VLR_PRODUTO] DOUBLE NOT NULL,
CONSTRAINT [PK_PRODUTO] PRIMARY KEY ([COD_PRODUTO])
CONSTRAINT [FK_FORNECEDOR] FOREIGN KEY ([COD_FORNECEDOR]) REFERENCES FORNECEDOR(COD_FORNECEDOR)
);
CREATE UNIQUE INDEX [IPK_PRODUTO] ON [PRODUTO]([COD_PRODUTO])

CREATE TABLE [FORNECEDOR]
(
[COD_FORNECEDOR] NVARCHAR(160) NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[EMAIL] NVARCHAR(160) NOT NULL,
[ENDERECO] NVARCHAR(160) NOT NULL,
[CNPJ] NVARCHAR(160) NOT NULL,
[TELEFONE] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY ([COD_FORNECEDOR])
);
CREATE UNIQUE INDEX [IPK_FORNECEDOR] ON[FORNECEDOR]([COD_FORNECEDOR)

CREATE TABLE ITENS_PEDIDO (
    [COD_ITENS_PEDIDO] NVARCHAR(160) NOT NULL,
    [COD_PEDIDO] NVARCHAR(160) NOT NULL,
    [COD_PRODUTO] NVARCHAR(160) NOT NULL,
    [QTD_PRODUTO] INTEGER NOT NULL,
    CONSTRAINT PK_ITENS_PEDIDO PRIMARY KEY (COD_ITENS_PEDIDO),
    CONSTRAINT FK_PEDIDO FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDO(COD_PEDIDO),
    CONSTRAINT FK_PRODUTO FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)
);
CREATE UNIQUE INDEX [IPK_ITENS_PEDIDO] ON [ITENS_PEDIDO]([COD_ITENS_PEDIDO])

CREATE TABLE [RELATORIO]
(
[COD_RELATORIO] NVARCHAR(160) NOT NULL,
[COD_LOJA] NVARCHAR(160) NOT NULL,
[VLR_TOTAL] DOUBLE NOT NULL,
[DATA_INICIO] DATETIME NOT NULL,
[DATA_FIM] DATETIME NOT NULL,
CONSTRAINT [PK_RELATORIO] PRIMARY KEY ([COD_RELATORIO])
CONSTRAINT [FK_LOJA] FOREIGN KEY ([COD_LOJA]) REFERENCES LOJA(COD_LOJA)
);
CREATE UNIQUE INDEX [IPK_RELATORIO] ON [RELATORIO]([COD_RELATORIO])




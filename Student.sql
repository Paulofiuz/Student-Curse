-- Criando tabela Aluno
CREATE Table [Student] (
    [Id] INT NOT NULL,
    [Name] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [BirthDate] DATETIME NULL,
    [Active] BIT NOT NULL DEFAULT(0),

    -- Nomeando a chave primária
    CONSTRAINT [PK_Student] PRIMARY KEY([Id]),
    CONSTRAINT [UQ_Student_Email] UNIQUE([Email])
)
GO

-- Adicionando coluna Document
ALTER TABLE [Student]
ADD [Document] NVARCHAR(11)
GO

-- Adicionando coluna Email com tamanho alterado e chave única
ALTER TABLE [Student]
ADD [Email] NVARCHAR(30) NOT NULL UNIQUE
GO

-- Removendo a coluna Document
ALTER TABLE [Student]
DROP COLUMN [Document]
GO

-- Alterando a coluna Document para CHAR(11)
ALTER TABLE [Student]
ADD [Document] CHAR(11)
GO

-- Deletando tabela Aluno
DROP Table [Student]
GO

-- Selecionando todos os dados da tabela Aluno
SELECT * FROM [Student]
GO

-- Criando tabela Curso
DROP TABLE [Course]
GO
CREATE Table [Course] (
    [Id] INT NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(80) NOT NULL,
    [CategoryId] INT NOT NULL,

    -- Nomeando a chave primária
    CONSTRAINT [PK_Course] PRIMARY KEY([Id]),

    -- Configurando chave estrangeira
    CONSTRAINT [FK_Course_Category] FOREIGN KEY([CategoryId])
    REFERENCES [Category]([Id])
)
GO

-- Criando tabela ProgressoCurso
DROP TABLE [CourseProgress]
GO
CREATE Table [CourseProgress] (
    [StudentId] INT NOT NULL,
    [CourseId] INT NOT NULL,
    [Progress] INT NOT NULL,
    [LastUpdate] DATETIME NOT NULL DEFAULT(GETDATE()),

    -- Nomeando a chave primária composta
    CONSTRAINT [PK_CourseProgress] PRIMARY KEY([StudentId], [CourseId])
)
GO

-- Criando tabela Categoria
CREATE TABLE [Category](
    [Id] INT NOT NULL,
    [Name] NVARCHAR(80) NOT NULL,

    -- Nomeando a chave primária
    CONSTRAINT [PK_Category] PRIMARY KEY([Id])
)
GO

-- Consulta 1: Selecionar ID do Usuário, ID do Aparelho e Status da Doação
SELECT 
    UsuarioID, 
    AparelhoID, 
    CASE 
        WHEN UsuarioID > 1 THEN 
            CASE 
                WHEN AparelhoID IS NOT NULL THEN AparelhoID 
                ELSE 'Este usuário não fez doação de nenhum aparelho' 
            END 
    END AS STATUS_DA_DOACAO
FROM 
    doacao;

-- Consulta 2: Contagem de Equipamentos de Comunicação por Tipo
SELECT 
    tipo_de_equipamento, 
    COUNT(*) AS quantidade 
FROM 
    equipamentos_de_comunicacao
GROUP BY 
    tipo_de_equipamento;

-- Consulta 3: Contagem Total de Equipamentos de Comunicação
SELECT 
    COUNT(*) AS QUANTIDADE_APARELHO 
FROM 
    equipamentos_de_comunicacao;

-- Consulta 4: Selecionar 10 Primeiras Linhas da Tabela Água Potável
SELECT 
    * 
FROM 
    agua_potavel 
LIMIT 10;

-- Consulta 5: Contagem de Materiais de Limpeza
SELECT 
    COUNT(*) AS quantidade 
FROM 
    materiais_de_limpeza;

-- Consulta 6: Selecionar Materiais de Limpeza da Categoria 'Desinfetantes'
SELECT 
    * 
FROM 
    materiais_de_limpeza 
WHERE 
    Categoria = 'Desinfetantes';

-- Consulta 7: Selecionar Materiais de Limpeza com Data de Validade Antes de 2025-01-01
SELECT 
    * 
FROM 
    materiais_de_limpeza 
WHERE 
    Categoria = 'Desinfetantes'
    AND Data_validade < '2025-01-01';

-- Consulta 8: Selecionar Todos os Dados da Tabela Farmacêuticos
SELECT 
    * 
FROM 
    psa.farmaceuticos;

-- Consulta 9: Contagem de Restrição de Venda em Farmacêuticos
SELECT 
    COUNT(CASE WHEN Nivel_de_Restricao = 'Venda Livre' THEN 1 END) AS venda_livre_count,
    COUNT(CASE WHEN Nivel_de_Restricao = 'Prescrição Necessária' THEN 1 END) AS presc_necessaria_count
FROM 
    farmaceuticos;

-- Consulta 10: Selecionar Todos os Dados da Tabela Materiais de Limpeza
SELECT 
    * 
FROM 
    psa.materiais_de_limpeza;

-- Consulta 11: Agrupar Quantidade Total de Cada Tipo de Doação na Tabela Doacao
SELECT
    COUNT(CASE WHEN AguaID IS NOT NULL THEN 1 END) AS Total_Agua,
    COUNT(CASE WHEN AlimentoID IS NOT NULL THEN 1 END) AS Total_Alimentos,
    COUNT(CASE WHEN RoupasID IS NOT NULL THEN 1 END) AS Total_Roupas,
    COUNT(CASE WHEN ItemID IS NOT NULL THEN 1 END) AS Total_Moveis_Eletrodomesticos,
    COUNT(CASE WHEN MaterialID IS NOT NULL THEN 1 END) AS Total_Materiais_Limpeza,
    COUNT(CASE WHEN AparelhoID IS NOT NULL THEN 1 END) AS Total_Equipamentos_Comunicacao,
    COUNT(CASE WHEN FarmaceuticoID IS NOT NULL THEN 1 END) AS Total_Farmaceuticos,
    COUNT(CASE WHEN ConstrucaoID IS NOT NULL THEN 1 END) AS Total_Materiais_Construcao
FROM 
    Doacao;

-- Consulta 12: Contagem Total de Doações por Usuário
SELECT
    UsuarioID,
    COUNT(*) AS Total_Doacoes
FROM 
    Doacao
GROUP BY 
    UsuarioID;

-- Consulta 13: Média de Quantidade e Peso por Material de Construção
SELECT 
    Material, 
    AVG(Quantidade) AS Media_Quantidade, 
    AVG(Peso) AS Media_Peso
FROM 
    materiais_de_construcao
GROUP BY 
    Material;

-- Consulta 14: Contagem Total de Registros por Material de Construção
SELECT 
    Material, 
    COUNT(*) AS Total_Registros
FROM 
    materiais_de_construcao
GROUP BY 
    Material;

-- Consulta 16: Total de Quantidade e Peso por Material de Construção
SELECT 
    Material, 
    SUM(Quantidade) AS Total_Quantidade, 
    SUM(Peso) AS Total_Peso
FROM 
    materiais_de_construcao
GROUP BY 
    Material;

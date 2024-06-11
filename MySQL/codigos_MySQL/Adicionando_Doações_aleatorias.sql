-- Inserindo 50 doações aleatórias na tabela doacao com descrições semânticas detalhadas e doações parciais
INSERT INTO doacao (UsuarioID, InstituicaoID, AguaID, AlimentoID, ItemID, MaterialID, AparelhoID, RoupasID, FarmaceuticoID, ConstrucaoID, Descricao)
SELECT
    (SELECT ID_Usuarios FROM usuarios ORDER BY RAND() LIMIT 1), -- UsuarioID
    1, -- InstituicaoID (assumindo que seja sempre 1)
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Agua FROM agua_potavel ORDER BY RAND() LIMIT 1) ELSE NULL END, -- AguaID
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Alimentos FROM alimentos ORDER BY RAND() LIMIT 1) ELSE NULL END, -- AlimentoID
    CASE WHEN RAND() < 0.5 THEN FLOOR(RAND() * 20) + 1 ELSE NULL END, -- ItemID (números aleatórios entre 1 e 20)
    CASE WHEN RAND() < 0.5 THEN (SELECT ID FROM materiais_de_limpeza ORDER BY RAND() LIMIT 1) ELSE NULL END, -- MaterialID
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Aparelho FROM equipamentos_de_comunicacao ORDER BY RAND() LIMIT 1) ELSE NULL END, -- AparelhoID
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Roupas FROM roupas ORDER BY RAND() LIMIT 1) ELSE NULL END, -- RoupasID
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Farmaceutico FROM farmaceuticos ORDER BY RAND() LIMIT 1) ELSE NULL END, -- FarmaceuticoID
    CASE WHEN RAND() < 0.5 THEN (SELECT ID_Construcao FROM materiais_de_construcao ORDER BY RAND() LIMIT 1) ELSE NULL END, -- ConstrucaoID
    CONCAT(
        'Esta doação inclui: ',
        IFNULL(CONCAT('Água potável (ID ', (SELECT ID_Agua FROM agua_potavel ORDER BY RAND() LIMIT 1), ') - ', (SELECT descricao FROM agua_potavel ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('alimentos variados (ID ', (SELECT ID_Alimentos FROM alimentos ORDER BY RAND() LIMIT 1), ') - ', (SELECT descricao FROM alimentos ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('um item genérico com ID ', FLOOR(RAND() * 20) + 1, ', '), ''),
        IFNULL(CONCAT('materiais de limpeza (ID ', (SELECT ID FROM materiais_de_limpeza ORDER BY RAND() LIMIT 1), ') - ', (SELECT Nome_item FROM materiais_de_limpeza ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('equipamentos de comunicação (ID ', (SELECT ID_Aparelho FROM equipamentos_de_comunicacao ORDER BY RAND() LIMIT 1), ') - ', (SELECT descricao FROM equipamentos_de_comunicacao ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('roupas (ID ', (SELECT ID_Roupas FROM roupas ORDER BY RAND() LIMIT 1), ') - ', (SELECT Nome_da_peca FROM roupas ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('produtos farmacêuticos (ID ', (SELECT ID_Farmaceutico FROM farmaceuticos ORDER BY RAND() LIMIT 1), ') - Composição: ', (SELECT Composicao FROM farmaceuticos ORDER BY RAND() LIMIT 1), ', '), ''),
        IFNULL(CONCAT('e materiais de construção (ID ', (SELECT ID_Construcao FROM materiais_de_construcao ORDER BY RAND() LIMIT 1), ') - ', (SELECT descricao FROM materiais_de_construcao ORDER BY RAND() LIMIT 1), '. '), ''),
        'Agradecemos pela sua contribuição e esperamos que esses itens sejam de grande ajuda!'
    ) -- Descrição
FROM
    (SELECT 1 AS dummy FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
          (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2) temp
LIMIT 50;

RENAME TABLE tb_capeonado TO tb_campeonato;

ALTER TABLE tb_jogador ADD FOREIGN KEY (codigo_time) REFERENCES tb_time(id);
ALTER TABLE tb_detalhamentopartida ADD FOREIGN KEY (codigo_jogador) REFERENCES tb_jogador(id);
ALTER TABLE tb_detalhamentopartida ADD FOREIGN KEY (codigo_partida) REFERENCES tb_partida(id);
ALTER TABLE tb_partida ADD FOREIGN KEY (codigo_campeonato) REFERENCES tb_campeonato(id);


select tb_jogador.nome as Jogadores, tb_time.nome as Times from tb_jogador 
inner join tb_time on tb_time.id=tb_jogador.codigo_time;


SELECT 
tb_time.nome AS Equipe,
tb_partida.DATA AS Partida,
sum(tb_detalhamentopartida.quantidade_cartao_vermelho) AS Cart_Vermelhos,
sum(tb_detalhamentopartida.quantidade_cartao_amarelo) AS Cart_Amarelos,
sum(tb_partida.quantidade_gol_mandante) AS Gols_Mandante,
sum(tb_partida.quantidade_gol_visitante) AS Gols_Visitante
FROM tb_time
inner JOIN tb_jogador ON tb_jogador.codigo_time=tb_time.id
inner JOIN tb_partida ON tb_time.id=tb_partida.codigo_mandante or tb_time.id=tb_partida.codigo_visitante
inner JOIN tb_detalhamentopartida ON tb_detalhamentopartida.codigo_partida=tb_partida.id 
AND tb_detalhamentopartida.codigo_jogador=tb_jogador.id
GROUP BY tb_time.nome, tb_partida.data;


SELECT 
tb_time.nome AS Equipe,
tb_campeonato.nome AS campeonato,
sum(tb_detalhamentopartida.quantidade_cartao_vermelho) AS Cart_Vermelhos,
sum(tb_detalhamentopartida.quantidade_cartao_amarelo) AS Cart_Amarelos,
sum(tb_partida.quantidade_gol_mandante) AS Gols_Mandante,
sum(tb_partida.quantidade_gol_visitante) AS Gols_Visitante
FROM tb_time
INNER JOIN tb_campeonato ON tb_campeonato.id=tb_time.id
inner JOIN tb_jogador ON tb_jogador.codigo_time=tb_time.id
inner JOIN tb_partida ON tb_time.id=tb_partida.codigo_mandante or tb_time.id=tb_partida.codigo_visitante
inner JOIN tb_detalhamentopartida ON tb_detalhamentopartida.codigo_partida=tb_partida.id 
AND tb_detalhamentopartida.codigo_jogador=tb_jogador.id
GROUP BY tb_time.nome, tb_campeonato.nome;


 -- Não consegui fazer isso aqui funcionar!
SELECT 
tb_partida.codigo_ganhador AS Vencedor,
tb_partida.codigo_mandante,
tb_partida.codigo_visitante
FROM tb_partida
ORDER BY 
(CASE
    WHEN tb_partida.codigo_ganhador > 0 THEN 3
    WHEN tb_partida.codigo_ganhador = 0 THEN 1
    ELSE NULL
END);











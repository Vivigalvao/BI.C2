INSERT INTO dw.dim_teste (
    tipo_teste_rapido,
    resultado_rt_pcr,
    resultado_teste_rap,
    resultado_sorologia,
    resultado_sorol_igg
)
SELECT DISTINCT
    tipo_teste_rapido,
    resultado_rt_pcr,
    resultado_teste_rap,
    resultado_sorologia,
    resultado_sorol_igg
FROM stg.notificacao_raw;

INSERT INTO dw.dim_teste
VALUES (
    -1,
    'Desconhecido',
    'Desconhecido',
    'Desconhecido',
    'Desconhecido',
    'Desconhecido'
);
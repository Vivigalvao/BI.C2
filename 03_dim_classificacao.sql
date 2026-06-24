INSERT INTO dw.dim_classificacao (
    classificacao,
    evolucao,
    criterio_confirmacao,
    status_notificacao
)
SELECT DISTINCT
    classificacao,
    evolucao,
    criterio_confirmacao,
    status_notificacao
FROM stg.notificacao_raw;

INSERT INTO dw.dim_classificacao
VALUES (
    -1,
    'Desconhecido',
    'Desconhecido',
    'Desconhecido',
    'Desconhecido'
);
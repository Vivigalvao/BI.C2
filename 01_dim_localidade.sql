INSERT INTO dw.dim_localidade (
    municipio,
    bairro,
    uf,
    regiao_es,
    macrorregiao
)
SELECT DISTINCT
    COALESCE(municipio,'Desconhecido'),
    COALESCE(bairro,'Desconhecido'),
    'ES',
    NULL,
    NULL
FROM stg.notificacao_raw;

INSERT INTO dw.dim_localidade
VALUES (
    -1,
    'Desconhecido',
    'Desconhecido',
    'ND',
    'ND',
    'ND'
);
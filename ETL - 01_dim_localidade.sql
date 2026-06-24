INSERT INTO dw.dim_localidade (
    municipio,
    bairro
)
SELECT DISTINCT
    COALESCE(municipio,'Desconhecido'),
    COALESCE(bairro,'Desconhecido')
FROM stg.notificacao_raw
WHERE NOT EXISTS (
    SELECT 1
    FROM dw.dim_localidade d
    WHERE d.municipio = COALESCE(notificacao_raw.municipio,'Desconhecido')
      AND d.bairro     = COALESCE(notificacao_raw.bairro,'Desconhecido')
);
INSERT INTO dw.dim_comorbidade (
    com_pulmao,
    com_cardio,
    com_renal,
    com_diabetes,
    com_tabagismo,
    com_obesidade
)
SELECT DISTINCT
    com_pulmao,
    com_cardio,
    com_renal,
    com_diabetes,
    com_tabagismo,
    com_obesidade
FROM stg.notificacao_raw;
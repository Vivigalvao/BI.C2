INSERT INTO dw.dim_sintomas (
    febre,
    dif_respiratoria,
    tosse,
    coriza,
    dor_garganta,
    diarreia,
    cefaleia
)
SELECT DISTINCT
    febre,
    dif_respiratoria,
    tosse,
    coriza,
    dor_garganta,
    diarreia,
    cefaleia
FROM stg.notificacao_raw;
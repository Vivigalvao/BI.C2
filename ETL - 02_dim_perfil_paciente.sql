INSERT INTO dw.dim_perfil_paciente (
    sexo,
    faixa_etaria,
    raca_cor,
    escolaridade,
    gestante,
    profissional_saude,
    morador_rua,
    possui_deficiencia
)
SELECT DISTINCT
    sexo,
    faixa_etaria,
    raca_cor,
    escolaridade,
    gestante,
    profissional_saude,
    morador_rua,
    possui_deficiencia
FROM stg.notificacao_raw;
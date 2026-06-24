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

INSERT INTO dw.dim_perfil_paciente
VALUES (
    -1,
    'Desconhecido',
    'Desconhecida',
    'Desconhecida',
    'Desconhecida',
    'Desconhecido',
    'Desconhecido',
    'Desconhecido',
    'Desconhecido'
);
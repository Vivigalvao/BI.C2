INSERT INTO dw.fato_notificacao_covid (
    sk_data_notificacao,
    sk_data_cadastro,
    sk_data_diagnostico,
    sk_data_coleta,
    sk_data_encerramento,
    sk_data_obito,
    sk_local,
    sk_perfil,
    sk_class,
    sk_sint,
    sk_como,
    sk_teste,
    qtd_notificacao,
    idade_anos
)
SELECT
    COALESCE(dt_not.sk_tempo,-1),
    COALESCE(dt_cad.sk_tempo,-1),
    COALESCE(dt_diag.sk_tempo,-1),
    COALESCE(dt_col.sk_tempo,-1),
    COALESCE(dt_enc.sk_tempo,-1),
    COALESCE(dt_obi.sk_tempo,-1),

    COALESCE(dl.sk_local,-1),
    COALESCE(dp.sk_perfil,-1),

    dc.sk_class,
    ds.sk_sint,
    dco.sk_como,
    dtes.sk_teste,

    1,

    CASE
        WHEN split_part(s.idade_na_notificacao,' ',1) ~ '^[0-9]+$'
        THEN split_part(s.idade_na_notificacao,' ',1)::smallint
        ELSE NULL
    END

FROM stg.notificacao_raw s

LEFT JOIN dw.dim_tempo dt_not
    ON dt_not.data = s.data_notificacao::date

LEFT JOIN dw.dim_tempo dt_cad
    ON dt_cad.data = s.data_cadastro::date

LEFT JOIN dw.dim_tempo dt_diag
    ON dt_diag.data = s.data_diagnostico::date

LEFT JOIN dw.dim_tempo dt_enc
    ON dt_enc.data = s.data_encerramento::date

LEFT JOIN dw.dim_tempo dt_obi
    ON dt_obi.data = s.data_obito::date

LEFT JOIN dw.dim_tempo dt_col
    ON dt_col.data =
       COALESCE(
           s.data_coleta_rt_pcr::date,
           s.data_coleta_teste_rap::date,
           s.data_coleta_sorologia::date,
           s.data_coleta_sorolog_igg::date
       )

LEFT JOIN dw.dim_localidade dl
    ON COALESCE(s.municipio,'Desconhecido') = dl.municipio
   AND COALESCE(s.bairro,'Desconhecido') = dl.bairro

LEFT JOIN dw.dim_perfil_paciente dp
    ON s.sexo = dp.sexo
   AND s.faixa_etaria = dp.faixa_etaria
   AND s.raca_cor = dp.raca_cor
   AND s.escolaridade = dp.escolaridade
   AND s.gestante = dp.gestante
   AND s.profissional_saude = dp.profissional_saude
   AND s.morador_rua = dp.morador_rua
   AND s.possui_deficiencia = dp.possui_deficiencia

LEFT JOIN dw.dim_classificacao dc
    ON s.classificacao = dc.classificacao
   AND s.evolucao = dc.evolucao
   AND s.criterio_confirmacao = dc.criterio_confirmacao
   AND s.status_notificacao = dc.status_notificacao

LEFT JOIN dw.dim_sintomas ds
    ON s.febre = ds.febre
   AND s.dif_respiratoria = ds.dif_respiratoria
   AND s.tosse = ds.tosse
   AND s.coriza = ds.coriza
   AND s.dor_garganta = ds.dor_garganta
   AND s.diarreia = ds.diarreia
   AND s.cefaleia = ds.cefaleia

LEFT JOIN dw.dim_comorbidade dco
    ON s.com_pulmao = dco.com_pulmao
   AND s.com_cardio = dco.com_cardio
   AND s.com_renal = dco.com_renal
   AND s.com_diabetes = dco.com_diabetes
   AND s.com_tabagismo = dco.com_tabagismo
   AND s.com_obesidade = dco.com_obesidade

LEFT JOIN dw.dim_teste dtes
    ON s.tipo_teste_rapido = dtes.tipo_teste_rapido
   AND s.resultado_rt_pcr = dtes.resultado_rt_pcr
   AND s.resultado_teste_rap = dtes.resultado_teste_rap
   AND s.resultado_sorologia = dtes.resultado_sorologia
   AND s.resultado_sorol_igg = dtes.resultado_sorol_igg

WHERE dt_col.sk_tempo IS NOT NULL
   OR COALESCE(
          s.data_coleta_rt_pcr,
          s.data_coleta_teste_rap,
          s.data_coleta_sorologia,
          s.data_coleta_sorolog_igg
      ) IS NULL;
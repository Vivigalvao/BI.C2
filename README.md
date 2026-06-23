# Data Warehouse COVID-19

Projeto de Engenharia de Dados utilizando PostgreSQL para construção de um Data Warehouse dimensional baseado em notificações de COVID-19.

## Objetivos

- Construir uma área de staging
- Modelar dimensões e tabela fato
- Aplicar ETL para carga de mais de 5 milhões de registros
- Permitir análises epidemiológicas

## Tecnologias

- PostgreSQL
- SQL
- Modelagem Dimensional (Kimball)

## Modelo Dimensional

![Star Schema](imagens/star_schema.png)

### Tabela Fato

- fato_notificacao_covid

### Dimensões

- dim_tempo
- dim_localidade
- dim_perfil_paciente
- dim_classificacao
- dim_sintomas
- dim_comorbidade
- dim_teste

## Volume de Dados

| Tabela | Registros |
|----------|------------:|
| STG | 5.188.889 |
| Fato | 5.188.624 |
| Dim Localidade | 8.029 |
| Dim Perfil | 16.283 |

## Principais Desafios

- Tratamento de valores nulos
- Chaves substitutas (Surrogate Keys)
- Datas ausentes
- Registros sem correspondência em dimensões
- Otimização de carga de milhões de linhas

## Autor

VIVIEN DO VALLE GALVÃO DAFLON

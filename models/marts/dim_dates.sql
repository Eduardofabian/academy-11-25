with
    raw_generated_dates as (
        -- 1. Gerando 1 dia por linha desde 1996 até o futuro
        {{ dbt_utils.date_spine(
            datepart="day", 
            start_date="cast('1996-01-01' as date)",
            end_date="cast('2026-01-01' as date)"
        ) }}
    )

    , enriched_dates as (
        select
            cast(date_day as date) as date_day
            
            -- Números úteis
            , extract(year from date_day) as year_num
            , extract(month from date_day) as month_num
            , extract(day from date_day) as day_num
            , extract(week from date_day) as week_num -- Aqui seria o equivalente ao seu strftime(%W)
            -- Nome do Mês
            , case extract(month from date_day)
                when 1 then 'Janeiro'
                when 2 then 'Fevereiro'
                when 3 then 'Março'
                when 4 then 'Abril'
                when 5 then 'Maio'
                when 6 then 'Junho'
                when 7 then 'Julho'
                when 8 then 'Agosto'
                when 9 then 'Setembro'
                when 10 then 'Outubro'
                when 11 then 'Novembro'
                when 12 then 'Dezembro'
            end as month_name
            , case extract(dayofweek from date_day)
                when 1 then 'Domingo'
                when 2 then 'Segunda-feira'
                when 3 then 'Terça-feira'
                when 4 then 'Quarta-feira'
                when 5 then 'Quinta-feira'
                when 6 then 'Sexta-feira'
                when 7 then 'Sábado'
            end as day_of_week_name
            
        from raw_generated_dates
    )

select * from enriched_dates
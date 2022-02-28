dplyr
================

<br>

### 1. Encontre voos:

#### Tiveram um atraso de chegada de 2h ou mais:

``` r
flights %>% 
  filter(arr_delay >= 120)
```

    ## # A tibble: 10,200 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      811            630       101     1047            830
    ##  2  2013     1     1      848           1835       853     1001           1950
    ##  3  2013     1     1      957            733       144     1056            853
    ##  4  2013     1     1     1114            900       134     1447           1222
    ##  5  2013     1     1     1505           1310       115     1638           1431
    ##  6  2013     1     1     1525           1340       105     1831           1626
    ##  7  2013     1     1     1549           1445        64     1912           1656
    ##  8  2013     1     1     1558           1359       119     1718           1515
    ##  9  2013     1     1     1732           1630        62     2028           1825
    ## 10  2013     1     1     1803           1620       103     2008           1750
    ## # ... with 10,190 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### Voaram para Houston (IAH ou HOU):

``` r
flights %>% 
  filter(dest %in% c("IAH", "HOU"))
```

    ## # A tibble: 9,313 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      623            627        -4      933            932
    ##  4  2013     1     1      728            732        -4     1041           1038
    ##  5  2013     1     1      739            739         0     1104           1038
    ##  6  2013     1     1      908            908         0     1228           1219
    ##  7  2013     1     1     1028           1026         2     1350           1339
    ##  8  2013     1     1     1044           1045        -1     1352           1351
    ##  9  2013     1     1     1114            900       134     1447           1222
    ## 10  2013     1     1     1205           1200         5     1503           1505
    ## # ... with 9,303 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### Foram operados pela United, American ou Delta:

``` r
flights %>% 
  left_join(airlines, by = "carrier") %>% 
  filter(name %in% c("United Air Lines Inc.", "American Airlines Inc.", "Delta Air Lines Inc."))
```

    ## # A tibble: 139,504 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      554            600        -6      812            837
    ##  5  2013     1     1      554            558        -4      740            728
    ##  6  2013     1     1      558            600        -2      753            745
    ##  7  2013     1     1      558            600        -2      924            917
    ##  8  2013     1     1      558            600        -2      923            937
    ##  9  2013     1     1      559            600        -1      941            910
    ## 10  2013     1     1      559            600        -1      854            902
    ## # ... with 139,494 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   name <chr>

#### Partiram no verão americano (july, august e september):

``` r
flights %>% 
  filter(month %in% c(7, 8, 9))
```

    ## # A tibble: 86,326 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     7     1        1           2029       212      236           2359
    ##  2  2013     7     1        2           2359         3      344            344
    ##  3  2013     7     1       29           2245       104      151              1
    ##  4  2013     7     1       43           2130       193      322             14
    ##  5  2013     7     1       44           2150       174      300            100
    ##  6  2013     7     1       46           2051       235      304           2358
    ##  7  2013     7     1       48           2001       287      308           2305
    ##  8  2013     7     1       58           2155       183      335             43
    ##  9  2013     7     1      100           2146       194      327             30
    ## 10  2013     7     1      100           2245       135      337            135
    ## # ... with 86,316 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

#### Que atrasaram até 1h (partida e chegada) usando as identidades lógicas de De Morgan:

``` r
flights %>% 
  filter(dep_delay <= 60, arr_delay <= 60)
```

    ## # A tibble: 295,893 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 295,883 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights %>% 
  filter(!(dep_delay > 60 | arr_delay > 60))
```

    ## # A tibble: 295,893 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 295,883 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

<br>

### 2. Ordene os voos para achar os voos que foram mais rápidos:

``` r
flights %>% 
  arrange(air_time)
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1    16     1355           1315        40     1442           1411
    ##  2  2013     4    13      537            527        10      622            628
    ##  3  2013    12     6      922            851        31     1021            954
    ##  4  2013     2     3     2153           2129        24     2247           2224
    ##  5  2013     2     5     1303           1315       -12     1342           1411
    ##  6  2013     2    12     2123           2130        -7     2211           2225
    ##  7  2013     3     2     1450           1500       -10     1547           1608
    ##  8  2013     3     8     2026           1935        51     2131           2056
    ##  9  2013     3    18     1456           1329        87     1533           1426
    ## 10  2013     3    19     2226           2145        41     2305           2246
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

<br>

### 3. Qual o voo que viajou para mais longe? Qual viajou para mais perto?

``` r
# mais perto
flights %>%
  arrange(distance) %>% 
  head(1)
```

    ## # A tibble: 1 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     7    27       NA            106        NA       NA            245
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
# mais longe
flights %>%
  arrange(distance) %>% 
  tail(1)
```

    ## # A tibble: 1 x 19
    ##    year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##   <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ## 1  2013     9    30      959           1000        -1     1438           1445
    ## # ... with 11 more variables: arr_delay <dbl>, carrier <chr>, flight <int>,
    ## #   tailnum <chr>, origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>,
    ## #   hour <dbl>, minute <dbl>, time_hour <dttm>

<br>

### 4. Use a função `mutate()`a distância da média `(x - mean(x))` para cada atraso de partida e atraso de chegada. Reporte seu resultado:

``` r
flights %>% 
  mutate(mean_dist_arr_delay = arr_delay - mean(arr_delay, na.rm = TRUE),
         mean_dist_dep_delay = dep_delay - mean(dep_delay, na.rm = TRUE)) %>% 
  select(flight, arr_delay, mean_dist_arr_delay, dep_delay, mean_dist_dep_delay)
```

    ## # A tibble: 336,776 x 5
    ##    flight arr_delay mean_dist_arr_delay dep_delay mean_dist_dep_delay
    ##     <int>     <dbl>               <dbl>     <dbl>               <dbl>
    ##  1   1545        11                4.10         2              -10.6 
    ##  2   1714        20               13.1          4               -8.64
    ##  3   1141        33               26.1          2              -10.6 
    ##  4    725       -18              -24.9         -1              -13.6 
    ##  5    461       -25              -31.9         -6              -18.6 
    ##  6   1696        12                5.10        -4              -16.6 
    ##  7    507        19               12.1         -5              -17.6 
    ##  8   5708       -14              -20.9         -3              -15.6 
    ##  9     79        -8              -14.9         -3              -15.6 
    ## 10    301         8                1.10        -2              -14.6 
    ## # ... with 336,766 more rows

<br>

### 5. Repita o cálculo do atraso de partida (dep\_delay) por data adicionando o parâmetro `na.rm` na função de agregação. Qual é a média de atraso para o dia 05/01/2013?

``` r
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  group_by(dt) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  ungroup() %>% 
  filter(dt == as.Date("2013-01-05"))
```

    ## # A tibble: 1 x 2
    ##   dt         mean_dep_delay
    ##   <date>              <dbl>
    ## 1 2013-01-05           5.73

<br>

### 6. Na análise apresentada nos slides sobre frequências, faça a filtragem dos dados para considerar aeronaves (grupos) que tenham pelo menos 25 amostras (n &gt; 25). Dica: utilize o código apresentado para criar o dataframe e adicione uma condição usando `filter()`:

``` r
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>% 
  group_by(tailnum) %>% 
  filter(n() >= 25) %>% 
  summarise(n = n(),
            mean_dep_delay = mean(dep_delay))
```

    ## # A tibble: 2,967 x 3
    ##    tailnum     n mean_dep_delay
    ##    <chr>   <int>          <dbl>
    ##  1 N0EGMQ    352          8.51 
    ##  2 N10156    145         18.0  
    ##  3 N102UW     48          8    
    ##  4 N103US     46         -3.20 
    ##  5 N104UW     46         10.1  
    ##  6 N10575    269         22.1  
    ##  7 N105UW     45          2.58 
    ##  8 N107US     41         -0.463
    ##  9 N108UW     60          4.22 
    ## 10 N109UW     48          0.104
    ## # ... with 2,957 more rows

<br>

### 7. Considerando o cálculo das médias por data apresentadas no slide de funções de agregação úteis, calcule a mediana para os voos não cancelados e compare os resultados:

``` r
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>% 
  group_by(dt) %>% 
  summarise(median_arr_delay = median(arr_delay),
            median_pos_arr_delay = mean(arr_delay > 0))
```

    ## # A tibble: 365 x 3
    ##    dt         median_arr_delay median_pos_arr_delay
    ##    <date>                <dbl>                <dbl>
    ##  1 2013-01-01                3                0.555
    ##  2 2013-01-02                4                0.577
    ##  3 2013-01-03                1                0.511
    ##  4 2013-01-04               -8                0.327
    ##  5 2013-01-05               -7                0.332
    ##  6 2013-01-06               -1                0.460
    ##  7 2013-01-07              -10                0.261
    ##  8 2013-01-08               -7                0.308
    ##  9 2013-01-09               -6                0.321
    ## 10 2013-01-10              -11                0.237
    ## # ... with 355 more rows

<br>

### 8. A partir dos exemplos apresentados para funções de agregações úteis, especialmente aqueles que utilizam a função de medidas de rank e aquelas que usam medidas de posição, explique a diferença entre as funções `first(x)` e `min(x)` bem como as funções `last(x)` e `max(x)`:

``` r
# as funções first() e last() retornam o primeiro e o último valor de um vetor, respectivamente
# o primeiro voo a decolar no dia 10/01 teve a duração de 183min e o último 35min
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>%
  group_by(dt) %>%
  summarise(first_air_time = first(air_time),
            last_air_time = last(air_time))
```

    ## # A tibble: 365 x 3
    ##    dt         first_air_time last_air_time
    ##    <date>              <dbl>         <dbl>
    ##  1 2013-01-01            227           186
    ##  2 2013-01-02            189           180
    ##  3 2013-01-03            193           199
    ##  4 2013-01-04            194           199
    ##  5 2013-01-05            201           195
    ##  6 2013-01-06            197           199
    ##  7 2013-01-07            202           196
    ##  8 2013-01-08             77           190
    ##  9 2013-01-09            193            54
    ## 10 2013-01-10            183            35
    ## # ... with 355 more rows

``` r
# vale ressaltar que first() e last() selecionam valores com base na ordem em que o df está
# se ordenarmos o df pela coluna sched_dep_time verificamos que 
# o primeiro voo programado para decolar no dia 10/01 durou 78min e o último 191min
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>%
  arrange(dt, sched_dep_time) %>% 
  group_by(dt) %>%
  summarise(first_air_time = first(air_time),
            last_air_time = last(air_time))
```

    ## # A tibble: 365 x 3
    ##    dt         first_air_time last_air_time
    ##    <date>              <dbl>         <dbl>
    ##  1 2013-01-01            227           186
    ##  2 2013-01-02            108           180
    ##  3 2013-01-03             94           199
    ##  4 2013-01-04             77           199
    ##  5 2013-01-05             85           195
    ##  6 2013-01-06             88           199
    ##  7 2013-01-07             86           196
    ##  8 2013-01-08             77           190
    ##  9 2013-01-09             87           188
    ## 10 2013-01-10             78           191
    ## # ... with 355 more rows

``` r
# as funções min() e max() retornam o menor e o maior valor de um vetor, respectivamente
# o voo mais curto do dia 10/01 durou 24min e o mais longo 633min
# a ordenação das colunas do df não afeta o resultado dessas funções
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>%
  group_by(dt) %>%
  summarise(min_air_time = min(air_time),
            nax_air_time = max(air_time))
```

    ## # A tibble: 365 x 3
    ##    dt         min_air_time nax_air_time
    ##    <date>            <dbl>        <dbl>
    ##  1 2013-01-01           24          659
    ##  2 2013-01-02           24          638
    ##  3 2013-01-03           25          628
    ##  4 2013-01-04           26          639
    ##  5 2013-01-05           23          635
    ##  6 2013-01-06           22          611
    ##  7 2013-01-07           23          620
    ##  8 2013-01-08           25          645
    ##  9 2013-01-09           25          667
    ## 10 2013-01-10           24          633
    ## # ... with 355 more rows

``` r
# o primeiro valor de uma coluna (first()) não é igual ao menor valor (min()) dessa mesma coluna
# assim como o último (last()) não é similar ao maior (max())
```

<br>

### 9. Modifique o exemplo apresentado para funções de contagem condicionais a testes lógicos para encontrar quantos aviões chegaram após as 23h30 por dia:

``` r
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>%
  group_by(dt) %>% 
  summarise(n_late_night = sum(arr_time > 2330))
```

    ## # A tibble: 365 x 2
    ##    dt         n_late_night
    ##    <date>            <int>
    ##  1 2013-01-01           26
    ##  2 2013-01-02           20
    ##  3 2013-01-03           19
    ##  4 2013-01-04           14
    ##  5 2013-01-05           14
    ##  6 2013-01-06            7
    ##  7 2013-01-07           14
    ##  8 2013-01-08           13
    ##  9 2013-01-09            6
    ## 10 2013-01-10           10
    ## # ... with 355 more rows

<br>

### 10. Encontre a proporção dos aviões que não tiveram atraso na chegada para cada dia do ano:

``` r
flights %>% 
  mutate(dt = lubridate::make_date(year, month, day)) %>% 
  filter(if_all(c(arr_delay, dep_delay), ~!is.na(.x))) %>%
  group_by(dt) %>% 
  summarise(not_delayed_perc = scales::percent(mean(arr_delay <= 0)))
```

    ## # A tibble: 365 x 2
    ##    dt         not_delayed_perc
    ##    <date>     <chr>           
    ##  1 2013-01-01 45%             
    ##  2 2013-01-02 42%             
    ##  3 2013-01-03 49%             
    ##  4 2013-01-04 67%             
    ##  5 2013-01-05 67%             
    ##  6 2013-01-06 54%             
    ##  7 2013-01-07 74%             
    ##  8 2013-01-08 69%             
    ##  9 2013-01-09 68%             
    ## 10 2013-01-10 76%             
    ## # ... with 355 more rows

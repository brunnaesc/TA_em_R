Dataframes
================

<br>

### 1. Utilize o dataset `população países` para aplicar as funções mostradas no slide “Data frames – Atributos e Estrutura” e reporte os resultados encontrados:

``` r
# dimensões do df
dim(most_pop_countries)
```

    ## [1] 10  5

``` r
# número de linhas do df
nrow(most_pop_countries)
```

    ## [1] 10

``` r
# número de colunas do df
ncol(most_pop_countries)
```

    ## [1] 5

``` r
# nome das dimensões do df
dimnames(most_pop_countries)
```

    ## [[1]]
    ##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
    ## 
    ## [[2]]
    ## [1] "countries"  "cont"       "pop"        "expect"     "per_capita"

``` r
# estrutura do df
str(most_pop_countries)
```

    ## 'data.frame':    10 obs. of  5 variables:
    ##  $ countries : chr  "China" "Índia" "Estados Unidos" "Indonésia" ...
    ##  $ cont      : chr  "Ásia" "Ásia" "Américas" "Ásia" ...
    ##  $ pop       : num  1.32e+09 1.11e+09 3.01e+08 2.24e+08 1.90e+08 ...
    ##  $ expect    : num  73 64.7 78.4 70.7 72.4 ...
    ##  $ per_capita: num  4959 2452 42952 3541 9066 ...

<br>

### 2. Utilize o dataset `população países` para aplicar o operador \[\[ mostrados no slide “Data frames – Subconjuntos”, para selecionar colunas usando os seus nomes e reporte os resultados encontrados:

``` r
# selecionar apenas a coluna com os países
most_pop_countries[["countries"]]
```

    ##  [1] "China"          "Índia"          "Estados Unidos" "Indonésia"     
    ##  [5] "Brasil"         "Paquistão"      "Bangladesh"     "Nigéria"       
    ##  [9] "Japão"          "México"

``` r
# selecionar apenas a coluna que contém a população dos países
most_pop_countries[["pop"]]
```

    ##  [1] 1318683096 1110396331  301139947  223547000  190010647  169270617
    ##  [7]  150448339  135031164  127467972  108700891

<br>

### 3. Utilize o dataset população países para realizar as seguintes filtragem de linhas e apresente seus resultados:

#### Selecione todos os países não Asiáticos:

``` r
most_pop_countries[most_pop_countries$cont != "Ásia",]
```

    ##         countries     cont       pop expect per_capita
    ## 3  Estados Unidos Américas 301139947 78.424      42952
    ## 5          Brasil Américas 190010647 72.390       9066
    ## 8         Nigéria   África 135031164 46.859       2014
    ## 10         México Américas 108700891 76.195      11978

#### Selecione os países não Asiáticos com população acima de 100M:

``` r
most_pop_countries[most_pop_countries$cont != "Ásia" & most_pop_countries$pop > 100000000,]
```

    ##         countries     cont       pop expect per_capita
    ## 3  Estados Unidos Américas 301139947 78.424      42952
    ## 5          Brasil Américas 190010647 72.390       9066
    ## 8         Nigéria   África 135031164 46.859       2014
    ## 10         México Américas 108700891 76.195      11978

#### Selecione os países Americanos com expectativa de vida menor que 75 anos:

``` r
most_pop_countries[most_pop_countries$cont == "Américas" & most_pop_countries$expect > 75,]
```

    ##         countries     cont       pop expect per_capita
    ## 3  Estados Unidos Américas 301139947 78.424      42952
    ## 10         México Américas 108700891 76.195      11978

#### Selecione os países Asiáticos com população entre 150M e 200M de pessoas:

``` r
most_pop_countries[most_pop_countries$cont == "Ásia" & most_pop_countries$pop >= 150000000 & most_pop_countries$pop < 200000000,]
```

    ##    countries cont       pop expect per_capita
    ## 6  Paquistão Ásia 169270617 65.483       2606
    ## 7 Bangladesh Ásia 150448339 64.062       1391

<br>

### 4. Crie uma nova coluna no dataset `população` a partir da coluna per capita em que os valores são divididos por 1e3:

``` r
most_pop_countries$new_col <- most_pop_countries$pop / 1000

most_pop_countries
```

    ##         countries     cont        pop expect per_capita   new_col
    ## 1           China     Ásia 1318683096 72.961       4959 1318683.1
    ## 2           Índia     Ásia 1110396331 64.698       2452 1110396.3
    ## 3  Estados Unidos Américas  301139947 78.424      42952  301139.9
    ## 4       Indonésia     Ásia  223547000 70.650       3541  223547.0
    ## 5          Brasil Américas  190010647 72.390       9066  190010.6
    ## 6       Paquistão     Ásia  169270617 65.483       2606  169270.6
    ## 7      Bangladesh     Ásia  150448339 64.062       1391  150448.3
    ## 8         Nigéria   África  135031164 46.859       2014  135031.2
    ## 9           Japão     Ásia  127467972 82.603      31656  127468.0
    ## 10         México Américas  108700891 76.195      11978  108700.9

<br>

### 5. Ordene o dataset `população países` em ordem crescente usando a coluna continente e a coluna de expectativa de vida:

``` r
most_pop_countries[order(most_pop_countries$cont, most_pop_countries$expect),]
```

    ##         countries     cont        pop expect per_capita   new_col
    ## 8         Nigéria   África  135031164 46.859       2014  135031.2
    ## 5          Brasil Américas  190010647 72.390       9066  190010.6
    ## 10         México Américas  108700891 76.195      11978  108700.9
    ## 3  Estados Unidos Américas  301139947 78.424      42952  301139.9
    ## 7      Bangladesh     Ásia  150448339 64.062       1391  150448.3
    ## 2           Índia     Ásia 1110396331 64.698       2452 1110396.3
    ## 6       Paquistão     Ásia  169270617 65.483       2606  169270.6
    ## 4       Indonésia     Ásia  223547000 70.650       3541  223547.0
    ## 1           China     Ásia 1318683096 72.961       4959 1318683.1
    ## 9           Japão     Ásia  127467972 82.603      31656  127468.0

<br>

### 6. Ordene as colunas do dataset `população países` em ordem alfabética:

``` r
most_pop_countries[,order(names(most_pop_countries))]
```

    ##        cont      countries expect   new_col per_capita        pop
    ## 1      Ásia          China 72.961 1318683.1       4959 1318683096
    ## 2      Ásia          Índia 64.698 1110396.3       2452 1110396331
    ## 3  Américas Estados Unidos 78.424  301139.9      42952  301139947
    ## 4      Ásia      Indonésia 70.650  223547.0       3541  223547000
    ## 5  Américas         Brasil 72.390  190010.6       9066  190010647
    ## 6      Ásia      Paquistão 65.483  169270.6       2606  169270617
    ## 7      Ásia     Bangladesh 64.062  150448.3       1391  150448339
    ## 8    África        Nigéria 46.859  135031.2       2014  135031164
    ## 9      Ásia          Japão 82.603  127468.0      31656  127467972
    ## 10 Américas         México 76.195  108700.9      11978  108700891

<br>

### 7. Use o dataset `pessoas` para encontrar as linhas que contenham ao menos um valor NA:

``` r
pessoas[!complete.cases(pessoas),]
```

    ##       nome idade altura peso
    ## 2 Emmanuel    35     NA  105
    ## 3     <NA>    39    168   70
    ## 5     <NA>    29     NA   80

<br>

### 8. Utilize os dataframes do slide que combina colunas com nomes diferentes e aplique a função `merge()` sem indicar colunas para realizar o produto cartesiano desses dados. Apresente o resultado:

``` r
merge(country, variables)
```

    ##              nacao continente         paises  populacao
    ## 1           Brasil   Americas          China 1318683096
    ## 2        Paquistao       Asia          China 1318683096
    ## 3       Bangladesh       Asia          China 1318683096
    ## 4          Nigeria     Africa          China 1318683096
    ## 5            Japao       Asia          China 1318683096
    ## 6           Mexico   Americas          China 1318683096
    ## 7            China       Asia          China 1318683096
    ## 8            India       Asia          China 1318683096
    ## 9   Estados Unidos   Americas          China 1318683096
    ## 10       Indonesia       Asia          China 1318683096
    ## 11          Brasil   Americas          Índia 1110396331
    ## 12       Paquistao       Asia          Índia 1110396331
    ## 13      Bangladesh       Asia          Índia 1110396331
    ## 14         Nigeria     Africa          Índia 1110396331
    ## 15           Japao       Asia          Índia 1110396331
    ## 16          Mexico   Americas          Índia 1110396331
    ## 17           China       Asia          Índia 1110396331
    ## 18           India       Asia          Índia 1110396331
    ## 19  Estados Unidos   Americas          Índia 1110396331
    ## 20       Indonesia       Asia          Índia 1110396331
    ## 21          Brasil   Americas Estados Unidos  301139947
    ## 22       Paquistao       Asia Estados Unidos  301139947
    ## 23      Bangladesh       Asia Estados Unidos  301139947
    ## 24         Nigeria     Africa Estados Unidos  301139947
    ## 25           Japao       Asia Estados Unidos  301139947
    ## 26          Mexico   Americas Estados Unidos  301139947
    ## 27           China       Asia Estados Unidos  301139947
    ## 28           India       Asia Estados Unidos  301139947
    ## 29  Estados Unidos   Americas Estados Unidos  301139947
    ## 30       Indonesia       Asia Estados Unidos  301139947
    ## 31          Brasil   Americas      Indonésia  223547000
    ## 32       Paquistao       Asia      Indonésia  223547000
    ## 33      Bangladesh       Asia      Indonésia  223547000
    ## 34         Nigeria     Africa      Indonésia  223547000
    ## 35           Japao       Asia      Indonésia  223547000
    ## 36          Mexico   Americas      Indonésia  223547000
    ## 37           China       Asia      Indonésia  223547000
    ## 38           India       Asia      Indonésia  223547000
    ## 39  Estados Unidos   Americas      Indonésia  223547000
    ## 40       Indonesia       Asia      Indonésia  223547000
    ## 41          Brasil   Americas         Brasil  190010647
    ## 42       Paquistao       Asia         Brasil  190010647
    ## 43      Bangladesh       Asia         Brasil  190010647
    ## 44         Nigeria     Africa         Brasil  190010647
    ## 45           Japao       Asia         Brasil  190010647
    ## 46          Mexico   Americas         Brasil  190010647
    ## 47           China       Asia         Brasil  190010647
    ## 48           India       Asia         Brasil  190010647
    ## 49  Estados Unidos   Americas         Brasil  190010647
    ## 50       Indonesia       Asia         Brasil  190010647
    ## 51          Brasil   Americas      Paquistão  169270617
    ## 52       Paquistao       Asia      Paquistão  169270617
    ## 53      Bangladesh       Asia      Paquistão  169270617
    ## 54         Nigeria     Africa      Paquistão  169270617
    ## 55           Japao       Asia      Paquistão  169270617
    ## 56          Mexico   Americas      Paquistão  169270617
    ## 57           China       Asia      Paquistão  169270617
    ## 58           India       Asia      Paquistão  169270617
    ## 59  Estados Unidos   Americas      Paquistão  169270617
    ## 60       Indonesia       Asia      Paquistão  169270617
    ## 61          Brasil   Americas     Bangladesh  150448339
    ## 62       Paquistao       Asia     Bangladesh  150448339
    ## 63      Bangladesh       Asia     Bangladesh  150448339
    ## 64         Nigeria     Africa     Bangladesh  150448339
    ## 65           Japao       Asia     Bangladesh  150448339
    ## 66          Mexico   Americas     Bangladesh  150448339
    ## 67           China       Asia     Bangladesh  150448339
    ## 68           India       Asia     Bangladesh  150448339
    ## 69  Estados Unidos   Americas     Bangladesh  150448339
    ## 70       Indonesia       Asia     Bangladesh  150448339
    ## 71          Brasil   Americas        Nigéria  135031164
    ## 72       Paquistao       Asia        Nigéria  135031164
    ## 73      Bangladesh       Asia        Nigéria  135031164
    ## 74         Nigeria     Africa        Nigéria  135031164
    ## 75           Japao       Asia        Nigéria  135031164
    ## 76          Mexico   Americas        Nigéria  135031164
    ## 77           China       Asia        Nigéria  135031164
    ## 78           India       Asia        Nigéria  135031164
    ## 79  Estados Unidos   Americas        Nigéria  135031164
    ## 80       Indonesia       Asia        Nigéria  135031164
    ## 81          Brasil   Americas          Japão  127467972
    ## 82       Paquistao       Asia          Japão  127467972
    ## 83      Bangladesh       Asia          Japão  127467972
    ## 84         Nigeria     Africa          Japão  127467972
    ## 85           Japao       Asia          Japão  127467972
    ## 86          Mexico   Americas          Japão  127467972
    ## 87           China       Asia          Japão  127467972
    ## 88           India       Asia          Japão  127467972
    ## 89  Estados Unidos   Americas          Japão  127467972
    ## 90       Indonesia       Asia          Japão  127467972
    ## 91          Brasil   Americas         México  108700891
    ## 92       Paquistao       Asia         México  108700891
    ## 93      Bangladesh       Asia         México  108700891
    ## 94         Nigeria     Africa         México  108700891
    ## 95           Japao       Asia         México  108700891
    ## 96          Mexico   Americas         México  108700891
    ## 97           China       Asia         México  108700891
    ## 98           India       Asia         México  108700891
    ## 99  Estados Unidos   Americas         México  108700891
    ## 100      Indonesia       Asia         México  108700891
    ##     expectVida....c.72.961..64.698..78.424..70.65..72.39..65.483..
    ## 1                                                           72.961
    ## 2                                                           72.961
    ## 3                                                           72.961
    ## 4                                                           72.961
    ## 5                                                           72.961
    ## 6                                                           72.961
    ## 7                                                           72.961
    ## 8                                                           72.961
    ## 9                                                           72.961
    ## 10                                                          72.961
    ## 11                                                          64.698
    ## 12                                                          64.698
    ## 13                                                          64.698
    ## 14                                                          64.698
    ## 15                                                          64.698
    ## 16                                                          64.698
    ## 17                                                          64.698
    ## 18                                                          64.698
    ## 19                                                          64.698
    ## 20                                                          64.698
    ## 21                                                          78.424
    ## 22                                                          78.424
    ## 23                                                          78.424
    ## 24                                                          78.424
    ## 25                                                          78.424
    ## 26                                                          78.424
    ## 27                                                          78.424
    ## 28                                                          78.424
    ## 29                                                          78.424
    ## 30                                                          78.424
    ## 31                                                          70.650
    ## 32                                                          70.650
    ## 33                                                          70.650
    ## 34                                                          70.650
    ## 35                                                          70.650
    ## 36                                                          70.650
    ## 37                                                          70.650
    ## 38                                                          70.650
    ## 39                                                          70.650
    ## 40                                                          70.650
    ## 41                                                          72.390
    ## 42                                                          72.390
    ## 43                                                          72.390
    ## 44                                                          72.390
    ## 45                                                          72.390
    ## 46                                                          72.390
    ## 47                                                          72.390
    ## 48                                                          72.390
    ## 49                                                          72.390
    ## 50                                                          72.390
    ## 51                                                          65.483
    ## 52                                                          65.483
    ## 53                                                          65.483
    ## 54                                                          65.483
    ## 55                                                          65.483
    ## 56                                                          65.483
    ## 57                                                          65.483
    ## 58                                                          65.483
    ## 59                                                          65.483
    ## 60                                                          65.483
    ## 61                                                          64.062
    ## 62                                                          64.062
    ## 63                                                          64.062
    ## 64                                                          64.062
    ## 65                                                          64.062
    ## 66                                                          64.062
    ## 67                                                          64.062
    ## 68                                                          64.062
    ## 69                                                          64.062
    ## 70                                                          64.062
    ## 71                                                          46.859
    ## 72                                                          46.859
    ## 73                                                          46.859
    ## 74                                                          46.859
    ## 75                                                          46.859
    ## 76                                                          46.859
    ## 77                                                          46.859
    ## 78                                                          46.859
    ## 79                                                          46.859
    ## 80                                                          46.859
    ## 81                                                          82.603
    ## 82                                                          82.603
    ## 83                                                          82.603
    ## 84                                                          82.603
    ## 85                                                          82.603
    ## 86                                                          82.603
    ## 87                                                          82.603
    ## 88                                                          82.603
    ## 89                                                          82.603
    ## 90                                                          82.603
    ## 91                                                          76.195
    ## 92                                                          76.195
    ## 93                                                          76.195
    ## 94                                                          76.195
    ## 95                                                          76.195
    ## 96                                                          76.195
    ## 97                                                          76.195
    ## 98                                                          76.195
    ## 99                                                          76.195
    ## 100                                                         76.195
    ##     perCapita....c.4959..2452..42952..3541..9066..2606..1391..2014..
    ## 1                                                               4959
    ## 2                                                               4959
    ## 3                                                               4959
    ## 4                                                               4959
    ## 5                                                               4959
    ## 6                                                               4959
    ## 7                                                               4959
    ## 8                                                               4959
    ## 9                                                               4959
    ## 10                                                              4959
    ## 11                                                              2452
    ## 12                                                              2452
    ## 13                                                              2452
    ## 14                                                              2452
    ## 15                                                              2452
    ## 16                                                              2452
    ## 17                                                              2452
    ## 18                                                              2452
    ## 19                                                              2452
    ## 20                                                              2452
    ## 21                                                             42952
    ## 22                                                             42952
    ## 23                                                             42952
    ## 24                                                             42952
    ## 25                                                             42952
    ## 26                                                             42952
    ## 27                                                             42952
    ## 28                                                             42952
    ## 29                                                             42952
    ## 30                                                             42952
    ## 31                                                              3541
    ## 32                                                              3541
    ## 33                                                              3541
    ## 34                                                              3541
    ## 35                                                              3541
    ## 36                                                              3541
    ## 37                                                              3541
    ## 38                                                              3541
    ## 39                                                              3541
    ## 40                                                              3541
    ## 41                                                              9066
    ## 42                                                              9066
    ## 43                                                              9066
    ## 44                                                              9066
    ## 45                                                              9066
    ## 46                                                              9066
    ## 47                                                              9066
    ## 48                                                              9066
    ## 49                                                              9066
    ## 50                                                              9066
    ## 51                                                              2606
    ## 52                                                              2606
    ## 53                                                              2606
    ## 54                                                              2606
    ## 55                                                              2606
    ## 56                                                              2606
    ## 57                                                              2606
    ## 58                                                              2606
    ## 59                                                              2606
    ## 60                                                              2606
    ## 61                                                              1391
    ## 62                                                              1391
    ## 63                                                              1391
    ## 64                                                              1391
    ## 65                                                              1391
    ## 66                                                              1391
    ## 67                                                              1391
    ## 68                                                              1391
    ## 69                                                              1391
    ## 70                                                              1391
    ## 71                                                              2014
    ## 72                                                              2014
    ## 73                                                              2014
    ## 74                                                              2014
    ## 75                                                              2014
    ## 76                                                              2014
    ## 77                                                              2014
    ## 78                                                              2014
    ## 79                                                              2014
    ## 80                                                              2014
    ## 81                                                             31656
    ## 82                                                             31656
    ## 83                                                             31656
    ## 84                                                             31656
    ## 85                                                             31656
    ## 86                                                             31656
    ## 87                                                             31656
    ## 88                                                             31656
    ## 89                                                             31656
    ## 90                                                             31656
    ## 91                                                             11978
    ## 92                                                             11978
    ## 93                                                             11978
    ## 94                                                             11978
    ## 95                                                             11978
    ## 96                                                             11978
    ## 97                                                             11978
    ## 98                                                             11978
    ## 99                                                             11978
    ## 100                                                            11978

<br>

### 9. Encontre a frequência de sobreviventes e não sobreviventes no dataframe `titanic`:

``` r
aggregate(Freq ~ Survived, titanic, sum)
```

    ##   Survived Freq
    ## 1       No 1490
    ## 2      Yes  711

<br>

### 10. Encontre a mediana para agrupamentos por idade e classe para o dataframe `titanic`:

``` r
aggregate(Freq ~ Age + Class, titanic, median)
```

    ##     Age Class  Freq
    ## 1 Child   1st   0.5
    ## 2 Adult   1st  87.5
    ## 3 Child   2nd   5.5
    ## 4 Adult   2nd  47.0
    ## 5 Child   3rd  15.5
    ## 6 Adult   3rd  82.5
    ## 7 Child  Crew   0.0
    ## 8 Adult  Crew 106.0

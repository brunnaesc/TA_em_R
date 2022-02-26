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

<br>

### 9. Encontre a frequência de sobreviventes e não sobreviventes no dataframe `titanic`:

<br>

### 10. Encontre a mediana para agrupamentos por idade e classe para o dataframe `titanic`:

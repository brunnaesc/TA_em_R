Dataframes
================

<br>

### 1. Utilize o dataset `população países` para aplicar as funções mostradas no slide “Data frames – Atributos e Estrutura” e reporte os resultados encontrados:

``` r
# dimensões do df
dim(most_pop_contries)
```

    ## [1] 10  4

``` r
# número de linhas do df
nrow(most_pop_contries)
```

    ## [1] 10

``` r
# número de colunas do df
ncol(most_pop_contries)
```

    ## [1] 4

``` r
# nome das dimensões do df
dimnames(most_pop_contries)
```

    ## [[1]]
    ##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"
    ## 
    ## [[2]]
    ## [1] "countries" "cont"      "pop"       "expect"

``` r
# estrutura do df
str(most_pop_contries)
```

    ## 'data.frame':    10 obs. of  4 variables:
    ##  $ countries: chr  "China" "Índia" "Estados Unidos" "Indonésia" ...
    ##  $ cont     : chr  "Ásia" "Ásia" "Américas" "Ásia" ...
    ##  $ pop      : num  1.32e+09 1.11e+09 3.01e+08 2.24e+08 1.90e+08 ...
    ##  $ expect   : num  73 64.7 78.4 70.7 72.4 ...

<br>

### 2. Utilize o dataset `população países` para aplicar o operador \[\[ mostrados no slide “Data frames – Subconjuntos”, para selecionar colunas usando os seus nomes e reporte os resultados encontrados:

``` r
# selecionar apenas a coluna com os países
most_pop_contries[["countries"]]
```

    ##  [1] "China"          "Índia"          "Estados Unidos" "Indonésia"     
    ##  [5] "Brasil"         "Paquistão"      "Bangladesh"     "Nigéria"       
    ##  [9] "Japão"          "México"

``` r
# selecionar apenas a coluna que contém a população dos países
most_pop_contries[["pop"]]
```

    ##  [1] 1318683096 1110396331  301139947  223547000  190010647  169270617
    ##  [7]  150448339  135031164  127467972  108700891

<br>

### 3. Utilize o dataset população países para realizar as seguintes filtragem de linhas e apresente seus resultados:

#### Selecione todos os países não Asiáticos:

``` r
most_pop_contries[most_pop_contries$cont != "Ásia",]
```

    ##         countries     cont       pop expect
    ## 3  Estados Unidos Américas 301139947 78.424
    ## 5          Brasil Américas 190010647 72.390
    ## 8         Nigéria   África 135031164 46.859
    ## 10         México Américas 108700891 76.195

#### Selecione os países não Asiáticos com população acima de 100M:

#### Selecione os países Americanos com expectativa de vida menor que 75 anos:

#### Selecione os países Asiáticos com população entre 150M e 200M de pessoas:

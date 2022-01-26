
# criando dataframes ------------------------------------------------------

# dfs podem ser criados a partir de vetores de igual tamanho

countries <- c("China", "Índia", "Estados Unidos", "Indonésia", "Brasil", 
               "Paquistão", "Bangladesh", "Nigéria", "Japão", "México")

cont <- c("Ásia", "Ásia", "Américas", "Ásia", "Américas", 
          "Ásia", "Ásia", "África", "Ásia", "Américas")

pop <- c(1318683096, 1110396331, 301139947, 223547000, 190010647, 
         169270617, 150448339, 135031164, 127467972, 108700891)

expect <- c(72.961, 64.698, 78.424, 70.65, 72.39, 
            65.483, 64.062, 46.859, 82.603, 76.195)

most_pop_contries <- data.frame(countries, cont, pop, expect)



# subconjuntos de dataframes ----------------------------------------------

# selecionar coluna com [] retorna df
most_pop_contries[1]

# selecionar coluna usando [, ] retorna vetor
most_pop_contries[,1]

# selecionar colunas usando sequência (1 a 3)
most_pop_contries[1:3]

# selecionar colunas usando vetor (1 e 3)
most_pop_contries[c(1,3)]

# remover coluna usando [] negativo
most_pop_contries[-1]

# remover colunas usando vetor negativo
most_pop_contries[-c(1,3)]

# selecionar primeira linha
most_pop_contries[1,]

# selecionar 6 primeiras linhas
most_pop_contries[1:6,]

# selecionar linhas 2, 4 e 6
most_pop_contries[c(2, 4, 6),]

# remover colunas usando [] negativo
most_pop_contries[-(1:6),]


# usando nomes ------------------------------------------------------------

# df ainda sem rownames
rownames(most_pop_contries)

rownames(most_pop_contries) <- most_pop_contries$countries

# df com rownames
rownames(most_pop_contries)

# selecionando uma linha
most_pop_contries["China",]

# selecionando várias linhas
most_pop_contries[c("China", "Índia"),]



# operadores lógicos ------------------------------------------------------



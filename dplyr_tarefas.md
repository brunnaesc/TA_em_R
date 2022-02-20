dplyr
================

<br>

### 1. Encontre voos:

#### Tiveram um atraso de chegada de 2h ou mais:

#### Voaram para Houston (IAH ou HOU):

#### Foram operados pela United, American ou Delta:

#### Partiram no verão americano (july, august e september):

#### Que atrasaram até 1h (partida e chegada) usando as identidades lógicas de De Morgan:

<br>

### 2. Ordene os voos para achar os voos que foram mais rápidos:

<br>

### 3. Qual o voo que viajou para mais longe? Qual viajou para mais perto?

<br>

### 4. Use a função `mutate()`a distância da média `(x - mean(x))` para cada atraso de partida e atraso de chegada. Reporte seu resultado:

<br>

### 5. Repita o cálculo do atraso de partida (dep\_delay) por data adicionando o parâmetro `na.rm` na função de agregação. Qual é a média de atraso para o dia 05/01/2013?

<br>

### 6. Na análise apresentada nos slides sobre frequências, faça a filtragem dos dados para considerar aeronaves (grupos) que tenham pelo menos 25 amostras (n &gt; 25). Dica: utilize o código apresentado para criar o dataframe e adicione uma condição usando `filter()`:

<br>

### 7. Considerando o cálculo das médias por data apresentadas no slide de funções de agregação úteis, calcule a mediana para os voos não cancelados e compare os resultados:

<br>

### 8. A partir dos exemplos apresentados para funções de agregações úteis, especialmente aqueles que utilizam a função de medidas de rank e aquelas que usam medidas de posição, explique a diferença entre as funções `first(x)` e `min(x)` bem como as funções `last(x)` e `max(x)`:

<br>

### 9. Modifique o exemplo apresentado para funções de contagem condicionais a testes lógicos para encontrar quantos aviões chegaram após as 23h30 por dia:

<br>

### 10. Encontre a proporção dos aviões que não tiveram atraso na chegada para cada dia do ano:
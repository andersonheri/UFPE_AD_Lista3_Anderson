##UNIVERSIDADE FEDERAL DE PERNAMBUCO ####
### Programa de Pós-Graduação em Ciência Política ###
####Análise de dados - UFPE ####
####Aluno: Anderson Henrique da Silva ####
###Prof. Davi Moreira ###



############################ RESOLUÇÃO DA LISTA 3 #################################


#Selecionar um diretório de salvamento no PC

setwd("C:/Users/Anderson/Desktop/ad_anderson_silva_lista3")

#Conferir o diretório escolhido
getwd()




############################### OBSERVAÇÃO #######################################

#Os banco aqui tralhados podem ser carregados (sem a necessidade de importar 
# de arquivo .csv) do diretório através do seguinte comando:

load("turmas_pe_censo_escolar_2016.Rdata")
load("docente.pe_nordeste.RData")
load("docente.pe.raca.RData")


################################ Resoluções ###############################



##Exercício 1##

# O direcionamento deste script, assim como, os banco de dados
# estão presentes no seguinte link:


### https://github.com/andersonheri/ad_anderson_silva_lista3



## Exercício 2##

#Atribuição de valores a dois objetos
x <- 10 
y <- 5

#Soma das variáveis x e y em um novo objeto

z <- x + y
z
# Resultado da soma: 15


##Exercício 3##

#Carregamento do banco de dados
data(mtcars)

# Descrição das variáveis
str(mtcars)

#numero de dimensões da base
length(mtcars)

#Impresão da terceira coluna
print(mtcars$disp)

#Impressão da Segunda linha
print(mtcars[2,])

#Quatro elemento presente na variável "cyl"

print(mtcars$cyl[4])

#Informações descritiva da base

#Pacote para análise descritiva das variáveis
install.packages("pastecs")
library(pastecs) #carregar pacote

#Comando para Estatística descritiva das variáveis no banco
stat.desc(mtcars)



##Exercício 4##

#Saber endereço do diretório 
getwd()

#Instalar o pacote "ffbase"
install.packages("ffbase")
library(ffbase) #Carregar o pacote

#Carregar o banco turmas

turmas <- read.csv2.ffdf(file = "TURMAS.csv", sep = "|")

#Filtrar apenas dados para Pernambuco

turmas.pe <- subset(turmas, CO_UF == 26)

#Transformando em data.frame

turmas.pe <- as.data.frame(turmas.pe)

#Salvar em formato do Rdata
save(turmas.pe, file= "turmas_pe_censo_escolar_2016.RData")


##Exercício 5##

## Carregamento do banco de dados "turmas_pe_censo_escolar_2016.RData"

#Retirada do banco de dados em .csv para carregamento em .RData
rm(turmas.pe)

#Ver qual diretório o banco estar salvo
getwd()

#Carregamento do banco de dados "turmas_pe_censo_escolar_2016.RData"
load("turmas_pe_censo_escolar_2016.RData")

#Média das matriculas das turmas em PE

mean(turmas.pe$NU_MATRICULAS)




##Exercício 6##


#Carregamento do banco de dados "Docentes_Nordeste"
#Obs.: Pelo tamanho do banco ser muito grande, optou-se analisar apenas os primeiros 100.000 casos

docentes_ne <- read.csv2.ffdf(file = "DOCENTES_NORDESTE.csv", sep = "|",
                              first.rows=100000)


#Filtrando informações dos docentes de PE
docente.pe <- subset(docentes_ne, CO_UF == 26)

#Tranformando o objeto "docente.pe" em data.frame
docente.pe <- as.data.frame(docente.pe)

#salvando em ".RData"

save(docente.pe, file = "docente.pe_nordeste.RData")



               ###calcular a porcentagem dos grupos###

#Criar um objeto com apenas a frequência de raça 
docente.pe.selecao <- table(docente.pe$TP_COR_RACA)


#Criar um dataframe do objeto "docente.pe.seleção" da variável raça
docente.pe.selecao <- data.frame(docente.pe.selecao)

###calcular a porcentagem dos grupos###

#Primeiro é necessário cálcular o número total de respondentes da variavel
#"TP_Raca" do banco "docente.pe" para calcular a porcentagem por grupo

length(docente.pe$TP_COR_RACA)

#Calcular a porcentagem dos grupos presentes
docente.pe.selecao$Freq <-(docente.pe.selecao$Freq/412663)*100

#Resultados
docente.pe.selecao

#Salvar o novo banco em RData

save(docente.pe.selecao, file = "docente.pe.raca.Rdata")


#Segundo codebook, os grupos são: "0 - Não declarada"; "1 - Branca"; "2 - Preta"
# "3 - Parda"; 4 - Amarela" e "5 - Indígena".


#Porcentagem de docentes que "Não declararam" raça:
docente.pe.selecao$Freq[1]


#Porcentagem de docente que "Preta" e "Parda"
#Preta
docente.pe.selecao$Freq[2]

#"Parda"
docente.pe.selecao$Freq[3]

#Somando as duas categorias temos:
docente.pe.selecao$Freq[2]+docente.pe.selecao$Freq[3]



#Remover todos os objetos do ambiente do trabalho
rm(list = ls())



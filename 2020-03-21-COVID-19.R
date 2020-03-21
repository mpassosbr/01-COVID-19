# Define o diretório inicial
setwd('/Users/matheuspassossilva/.CMVolumes/DropBox/Formacao-CD/Curso-01/CAP00-Exercicios/2020-03-21-COVID-19')
getwd()

# Abre e lê os arquivos
covidConfirmed <- data.frame(fread(file = 'time_series_2019-ncov-Confirmed.csv', header = TRUE, sep = ","))
covidDeaths <- data.frame(fread(file = 'time_series_2019-ncov-Deaths.csv', header = TRUE, sep = ","))

# Seleciona apenas Itália, Brasil e Portugal
covidITConf = subset(covidConfirmed, Country.Region == 'Italy')
covidITDeat = subset(covidDeaths, Country.Region == 'Italy')

covidBRConf = subset(covidConfirmed, Country.Region == 'Brazil')
covidBRDeat = subset(covidDeaths, Country.Region == 'Brazil')

covidPTConf = subset(covidConfirmed, Country.Region == 'Portugal')
covidPTDeat = subset(covidDeaths, Country.Region == 'Portugal')

# Mantém apenas as colunas com números
covidITConf[1:4] = list(NULL)
covidITDeat[1:4] = list(NULL)

covidBRConf[1:4] = list(NULL)
covidBRDeat[1:4] = list(NULL)

covidPTConf[1:4] = list(NULL)
covidPTDeat[1:4] = list(NULL)

# Converte o data frame para um vetor
covidITConf = t(covidITConf)
covidITDeat = t(covidITDeat)

covidBRConf = t(covidBRConf)
covidBRDeat = t(covidBRDeat)

covidPTConf = t(covidPTConf)
covidPTDeat = t(covidPTDeat)

# Mostra os plots dos 3 países
png('italia.png', width = 1920, height = 1080)
plot(covidITConf, covidITDeat, type = "l", main = "Avanço da COVID-19 na Itália\nDe 23 de janeiro a 20 de março de 2020", xlab = "Número de casos confirmados", ylab = "Número de mortes", col = "red")
dev.off()
png('brasil.png', width = 1920, height = 1080)
plot(covidBRConf, covidBRDeat, type = "l", main = "Avanço da COVID-19 na Brasil\nDe 23 de janeiro a 20 de março de 2020", xlab = "Número de casos confirmados", ylab = "Número de mortes", col = "blue")
dev.off()
png('portugal.png', width = 1920, height = 1080)
plot(covidPTConf, covidPTDeat, type = "l", main = "Avanço da COVID-19 em Portugal\nDe 23 de janeiro a 20 de março de 2020", xlab = "Número de casos confirmados", ylab = "Número de mortes", col = "black")
dev.off()

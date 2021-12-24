# Script R qui contient les fonctions d'importation des données
library(tidyverse)
library(readxl)
library(magrittr)
# URL des données 
url_covid <- "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
url_pib <- "https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx"
url_lifeexp <- "https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx"

folder <- "data/raw/"
sheetcountry <- "data-for-countries-etc-by-year"

check_filedate <- function(limite, pat){
    filename <- list.files(folder,pattern=pat)
    date_file <-  as.POSIXct(gsub(".*_(.*)\\..*", "\\1", filename))
    date_today <- as.POSIXct(Sys.time(), format="%Y.%m.%d")
    time_diff <- difftime(date_today, date_file, units= "days")
    
    if (time_diff < limite) {
        expired <- FALSE
    } else {
        expired <- TRUE
    }
}

download_data <- function(folder, name, url, ext){
    filename <- paste0(folder, name, Sys.Date(), ext)
    download.file(url, filename)
}

import_data_xl <- function(filename, sheetname){
    data <- as_tibble(read_excel(paste0(folder, filename), sheet=sheetname))
}


# Importation et téléchargement des Données COVID
file_covid <- list.files(folder, pattern = "covid")
if (length(file_covid) == 0) {
    download_data(folder, "covid_data_", url_covid,".csv")
}
expired <- check_filedate(7, "covid")
if (expired) {
    file.remove(paste0(folder,file_covid))
    download_data(folder, "covid_data_", url_covid,".csv")
    file_covid <- list.files(folder, pattern = "covid")
}
covid_data <- as_tibble(read.csv(paste0(folder, file_covid)))

# Importation et téléchargement des Données PIB
file_pib <- list.files(folder, pattern = "pib")
if (length(file_pib) == 0) {
    download_data(folder, "pib_data_", url_pib,".xlsx")
}
expired <- check_filedate(30, "pib")
if (expired) {
    file.remove(paste0(folder,file_pib))
    download_data(folder, "pib_data_", url_covid,".xlsx")
    file_pib <- list.files(folder, pattern = "pib")
}
pib_data <- import_data_xl(file_pib, sheetcountry) #par pays

# Importation et téléchargement des Données Espérance de vie
file_lifeexp <- list.files(folder, pattern = "lifeexp")
if (length(file_lifeexp) == 0) {
    download_data(folder, "lifeexp_data_", url_lifeexp,".xlsx")
}
expired <- check_filedate(30, "lifeexp")
if (expired) {
    file.remove(paste0(folder,file_lifeexp))
    download_data(folder, "lifeexp_data_", url_lifeexp,".xlsx")
    file_lifeexp <- list.files(folder, pattern = "lifeexp")
}
lifeexp_data <- import_data_xl(file_lifeexp, sheetcountry) #par pays

#Nettoyage environnement, effacer variables non-utiles pour la suite
rm(expired, file_covid, file_lifeexp, file_pib, sheetcountry)





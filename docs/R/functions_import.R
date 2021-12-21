# Script R qui contient les fonctions d'importation des données
library(tidyverse)
library(readxl)

# URL des données 
url_covid <- "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
url_pib <- "https://docs.google.com/spreadsheets/d/1h3z8u0ykcUum8P9FV8EHF9fszDYr7iPDZQ-fgE3ecls/export?format=xlsx"
url_life_ex <- "https://docs.google.com/spreadsheets/d/11mulzUH3_cueq-V9D5KIlo9oHE9YYZrUSeVyCin7_rM/export?format=xlsx"



# check_filedate <- function(file, limite){
#     files_list <- list.files("data/raw/",pattern=)
#     date_file <- str_sub(filename, "data",".csv")
# }

download_data <- function(folder, name, url){
    filename <- paste0(folder, name, Sys.Date(),".xlsx")
    download.file(url, filename)
}

import_data <- function(filename, sheetname){
    data <- read_excel(paste0("data/raw/", filename), sheet=4)

}

download_data("data/raw/", "pib_data", url_pib)
file_pib <- list.files("/data/raw", pattern = "pib")
pib_data <-import_data(file_pib, "data-for-countries-etc-by-year")

download_data("data/raw/", "lifeexp_date", url_life_ex)
file_lifeexp <- list.files("data/raw", pattern = "lifeexp")
lifeexp_data <- import_data(file_lifeexp, "data-for-countries-etc-by-year")




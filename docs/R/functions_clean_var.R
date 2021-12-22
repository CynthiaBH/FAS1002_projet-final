# Script R qui contient les fonctions de nettoyage des colonnes

# Colonnes des données Covid-19




# Colonnes des données PIB

pib_data %<>% rename(country = name,year = time, income_per_person = 4, gdp_total = 5) %>% 
    select(-6) 
 

# Colonnes des données Espérance de vie
lifeexp_data %<>% rename(country = name,year = time,life_expectancy = `Life expectancy`)




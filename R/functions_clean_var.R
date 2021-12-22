# Script R qui contient les fonctions de nettoyage des colonnes

# Colonnes des données Covid-19
covid_data %<>% select(-c(8,9,15)) %>% mutate(date = ymd(date)) %>% 
    relocate(date, .after = 2)%>% 
    rename(country = location)
covid_data$country <- as.factor(covid_data$country)

# Colonnes des données PIB
pib_data %<>% rename(country = name,year = time, income_per_person = 4, gdp_total = 5) %>% 
    select(-6) 
pib_data$country <- as.factor(pib_data$country)

# Colonnes des données Espérance de vie
lifeexp_data %<>% rename(country = name,year = time,life_expectancy = `Life expectancy`) 
lifeexp_data$country <- as.factor(lifeexp_data$country)





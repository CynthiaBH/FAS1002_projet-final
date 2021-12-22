# Script R qui contient les fonctions d'affichage des tableaux
library(kableExtra)
library(DT)
# Fonction d'affichage des tableaux avec kable
show_tb_kbl <- function(dt){
    dt %>%
        kbl() %>%
        kable_styling(full_width = F)
}
show_head_kbl <- function(dt){
    kable(head(dt)) %>%
        kable_styling(full_width = F, font_size = 14)
}

# Fonction d'affichage des tableaux avec paged_table
show_tb_paged <- function(dt){
    dt %>% paged_table(options = list(rows.print = 20, cols.print = 7))
}

show_tb_dt<- function(dt, title){
    datatable(dt, extensions = c('FixedColumns',"FixedHeader"),
              rownames = FALSE,
                  options = list(scrollX = TRUE, 
                                 paging=TRUE,
                                 fixedHeader=FALSE),
              caption = title, 
              class = 'cell-border stripe'
              )
}
# 
# show_tb_dt <- function(dt){
#     datatable(dt, class = 'cell-border stripe', filter = 'top', editable = TRUE)
# }



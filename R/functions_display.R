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
    dt %>% paged_table(options = list(rows.print = 15, cols.print = 7))
}

show_tb_dt<- function(dt){
    datatable(dt,
              extensions = c('FixedColumns',"FixedHeader", "Scroller"),
              rownames = FALSE,
              options = list(scrollX = TRUE, 
                                 paging=TRUE,
                                 fixedHeader=TRUE
                                ),
              class = 'cell-border stripe'
              )
}

show_tb_dt_buttons<- function(dt){
    datatable(dt,
              extensions = c('FixedColumns',"FixedHeader", "Scroller", "Buttons"),
              rownames = FALSE,
              options = list(scrollX = TRUE, 
                             paging=TRUE,
                             fixedHeader=TRUE,
                             dom = 'Bfrtip',
                             buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
              ),
              class = 'cell-border stripe'
    )
}

# Formatter une colonne pour avoir un espace entre les milliers
format_num <- function(dt) {
    formatC(dt, format="f", big.mark = " ", digits=0)
}

# Formatter les colonnes numériques pour avoir un espace entre les milliers
format_num <- function(dt) {
    formatC(dt, format="f", big.mark = " ", digits=0)
}


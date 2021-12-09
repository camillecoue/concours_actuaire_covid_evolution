# Libraries
install.packages("dplyr")
install.packages("hrbrthemes")
installed.packages("viridis")
install.packages("gifski")
install.packages("av")
install.packages("gganimate")
install.packages("gapminder")

library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(gapminder)
library(gganimate)
library(av)
library(gifski)
library(plotly)
theme_set(theme_bw())

# The dataset is provided in the gapminder library
data <- table_regions %>% filter(Annee=="2021") %>% dplyr::select(-Annee)

p <- ggplot(data, aes(taux_vaccin_reg, tx_hosp_reg, color = nomReg)) +
  geom_point(aes(size = densite_reg, frame = semaine, ids = nomReg)) +
  labs(title = 'Titre', x = 'Taux vaccin', y = 'Taux hospi') +
  ease_aes('linear')

ggplotly(p)
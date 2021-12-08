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
theme_set(theme_bw())

# The dataset is provided in the gapminder library
data <- table_dep_finale8 %>% filter(Annee=="2021") %>% dplyr::select(-Annee)

# Make a ggplot, but add frame=year: one image per year
ggplot(data, aes(tx_hosp, taux_vaccin, size = densite, color = nomReg)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  # gganimate specific bits:
  labs(title = 'Semaine: {frame_time}', x = 'Taux hospi', y = 'Taux vaccin') +
  transition_time(semaine) +
  ease_aes('linear')

# Save at gif:
anim_save("271-ggplot2-animated-gif-chart-with-gganimate1.gif")

animate(data, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")
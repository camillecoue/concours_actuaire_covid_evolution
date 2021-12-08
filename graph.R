# Libraries
install.packages("dplyr")
install.packages("hrbrthemes")
installed.packages("viridis")
install.packages("gifski")
install.packages("av")
install.packages("gganimate")

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
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")


# Make a ggplot, but add frame=year: one image per year
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  # gganimate specific bits:
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

# Save at gif:
anim_save("271-ggplot2-animated-gif-chart-with-gganimate1.gif")

animate(data, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")


## standard ggplot2
myPlot <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

animate(myPlot, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")






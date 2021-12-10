install.packages("dplyr")
install.packages("hrbrthemes")
installed.packages("viridis")
install.packages("gifski")
install.packages("av")
install.packages("gapminder")
install.packages("ggplot2")
install.packages("gganimate")
library(shiny)
library(gapminder)
library(ggplot2)
library(gganimate)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(av)
library(gifski)


server <- function(input, output, session) {
  
  # Pull in description of trend
  
  output$hist <- renderPlot({
    
    hist(rnorm(100))
  })

    output$desc <- renderText({
    
    trend_text <- filter(trend_description, type == input$type) %>% pull(text)
    paste(trend_text, "on essaye.")
  })
      
   
}
  


  
 ########################################   Animated bubble chart  ###########################################################
  
  ## standard ggplot2
#    myPlot <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
 #   geom_point(alpha = 0.7, show.legend = TRUE) +
  #  scale_colour_manual(values = country_colors) +
   # scale_size(range = c(2, 12)) +
  #  scale_x_log10() +
    # Here comes the gganimate specific bits
   # labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  #transition_time(year) +
   # ease_aes('linear')
  
  #animate(myPlot, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
  #anim_save("output.gif")

  
  


  

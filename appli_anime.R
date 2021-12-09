#install.packages("dplyr")
#install.packages("hrbrthemes")
#installed.packages("viridis")
#install.packages("gifski")
#install.packages("av")
#install.packages("gganimate")
#install.packages("gapminder")
#install.packages("ggplot2")
#install.packages("plotly")
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
library(av)
library(gifski)
library(plotly)
library(gganimate)
theme_set(theme_bw())



library(shiny)


ui<- fluidPage(
  titlePanel("Covid-19 Evolution "),
  
  sidebarLayout(
    sidebarPanel(
      
      tabsetPanel(
        
        tabPanel("Département",
                 
              #   selectInput("variable", "Choisir un département :",
               #              c(as.character(dpt)),
                # ),
                 sliderInput(inputId = "slider",
                             "Période :",
                             min = as.Date("2020-03-18"),
                             max = as.Date("2021-11-28"),
                             value =  c(as.Date("2020-03-18"), as.Date("2021-11-28")),
                             timeFormat = "%d %b %Y",
                             width = '100%'
                 ), 
                 sliderInput(inputId = "num", 
                             label = "choose a number",
                             value = 25, min = 10, max = 90),
                 
        ),
        tabPanel("Région", 
                 # plotOutput("hist"),
                 
                 #selectInput("variable", "Choisir un département :",
                  #           c(as.character(dpt)),
                 #),
                 sliderInput(
                   "slider",
                   "Période :",
                   min = as.Date("2020-03-18"),
                   max = as.Date("2021-11-28"),
                   value =  c(as.Date("2020-03-18"), as.Date("2021-11-28")),
                   timeFormat = "%d %b %Y",
                   width = '100%'
                 ),
                 sliderInput(inputId = "num", 
                             label = "choose a number",
                             value = 25, min = 10, max = 90),
                 
        ), 
        tabPanel("Classe d'âge par région", 
                 #  plotOutput(outputId="hist"),
                 
                 #selectInput("variable", "Choisir un département :",
                  #           c(as.character(dpt)),
                # ),
                 sliderInput(
                   "slider",
                   "Période :",
                   min = as.Date("2020-03-18"),
                   max = as.Date("2021-11-28"),
                   value =  c(as.Date("2020-03-18"), as.Date("2021-11-28")),
                   timeFormat = "%d %b %Y",
                   width = '100%'
                 ),
        ),
        
        sliderInput(inputId = "num", 
                    label = "choose a number",
                    value = 25, min = 10, max = 90),
        
        
      )
    ),
    
    mainPanel(
      plotlyOutput(outputId="plot")
      #tabsetPanel(
      
      # tabPanel("Département", plotOutput(outputId="hist"))
      
      
      #tabPanel("Région", plotOutput(outputId="hist"))
      
      
      #tabPanel("Classe d'âge par région", plotOutput(outputId="hist")
      
      
      
    ))
)


server <- function(input, output){
  
  output$plot <- renderPlotly({
    p <- ggplot(data, aes(taux_vaccin_reg, tx_hosp_reg, color = nomReg)) +
      geom_point(aes(size = densite_reg, frame = semaine, ids = nomReg)) +
      labs(title = 'Titre', x = 'Taux vaccin', y = 'Taux hospi') +
      ease_aes('linear')
    ggplotly(p)
  })
}

shinyApp(ui = ui, server = server)
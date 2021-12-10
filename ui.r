library(shiny) 


if (interactive()) 
ui <- fluidPage(
  
  titlePanel("Covid Evolution"),
  
 # sidebarLayout(),
    
  #  sidebarPanel( ),
    
    mainPanel(

      
      tabsetPanel(
        tabPanel("Département",
                 plotOutput("hist"), 
                 
                 selectInput("variable", "Choisir un département :",
                             c(as.character(dpt)),
                                               ),
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
        tabPanel("Région", 
                 plotOutput("plot"),
                 
                 selectInput("variable", "Choisir un département :",
                             c(as.character(dpt)),
                 ),
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
        tabPanel("Classe d'âge par région", 
                 plotOutput(outputId="plot"),
                 
                 selectInput("variable", "Choisir un département :",
                             c(as.character(dpt)),
                 ),
                 sliderInput(
                   "slider",
                   "Période :",
                   min = as.Date("2020-03-18"),
                   max = as.Date("2021-11-28"),
                   value =  c(as.Date("2020-03-18"), as.Date("2021-11-28")),
                   timeFormat = "%d %b %Y",
                   width = '100%'
                 ),
                 )
      
    ),
   
   textOutput(outputId = "desc"),
    tags$a(href = "https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19", "Source: https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19", target = "_blank")
    )
)
  
    
  

   



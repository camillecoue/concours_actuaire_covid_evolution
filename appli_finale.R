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

#diff_tx2 <- table_sexe$tx_rea1 / table_sexe$tx_hosp1
#diff_tx3 <- table_sexe$tx_rea2 / table_sexe$tx_hosp2

if(interactive()){

ui<- fluidPage(
  titlePanel("Evolution des données hospitalières relatives au Covid-19 "),
  #br(),
  
    mainPanel(
      h4("Données de 2021"),
      tabsetPanel(
        
        tabPanel("Hospitalisation et vaccination", 
                 #br(),
                 
                 plotlyOutput(outputId="plot", height = 500, width = 800),
                 #plotlyOutput(outputId="plot", height = 500, width = 800),
                 
                 
        
                 
        ), 
        tabPanel("Effet par région",
                 selectInput("choix_region",
                                    label = "Séléctionner la région:",
                                    choices = c(region),
                                    selected = "Occitanie"),
                 plotlyOutput(outputId="plot2", height = 500, width = 800)
          
          
        ),
        
        tabPanel("Effet par sexe", 
                 selectInput("choix_region2",
                             label = "Séléctionner la région:",
                             choices = c(region),
                             selected = "Occitanie"),
                 plotlyOutput(outputId="plot3", height = 500, width = 800)
        ),
        
        textOutput(outputId = "desc"),
        tags$a(href = "https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19",
               "Source: https://www.data.gouv.fr/fr/datasets/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19", target = "_blank")
        
        
      )
    ),
    
      
      
      
    
)


server <- function(input, output){
  
  region<-unique(table_regions$nomReg)
  
  # Graph bulle pour réa et hospi avec bulle et ligne
  output$plot <- renderPlotly({
    p <- ggplot(data, aes(taux_vaccin_reg, tx_hosp_reg*10000, color = nomReg)) +
      geom_point(aes(size = densite_reg, frame = semaine)) +
      #geom_line(aes(taux_vaccin_reg, tx_rea_reg*10000)) +
      geom_hline(yintercept = 6.2584, color = "black") +
      geom_text(aes(x = 0.5, y = 6, label = "Vague 2 - novembre 2020", color = "orange")) +
      labs(title = "Effet de la vaccination sur le taux d'hospitalisation", x = 'Taux de vaccination', y = "Taux d'hospitalisation pour 10 000 personnes", color = 'Région / Densité') +
      ease_aes('linear')
    ggplotly(p)
  })
  
  # Graph 2 lignes : ratio rea/hospi et hospi
  output$plot2 <- renderPlotly({
    data_filtre = table_regions %>% filter(nomReg==input$choix_region)
    diff_tx <- data_filtre$tx_rea_reg / data_filtre$tx_hosp_reg
    p <- ggplot(data_filtre,
                aes(taux_vaccin_reg, diff_tx)) +
      geom_blank() +
      geom_line(color = "darkred") +
      labs(title = "Part des réanimations parmi les hospitalisations", x = 'Taux de vaccination', y = "Taux d'hospitalisation - Ratio réa/hospi", color = 'Région / Densité') +
      scale_color_manual(name = "Indicateurs", values = c("Taux d'hospitalisation" = "steelblue", "Ratio réa/hospi" = "red")) +
      geom_line(aes(taux_vaccin_reg, tx_hosp_reg*10000), color = "steelblue")
    ggplotly(p)
  })
  
  # Graph 3 homme / femme
  
  output$plot3 <- renderPlotly({
    data_filtre2 = table_sexe_2 %>% filter(nomReg==input$choix_region2)
    data_filtre3 = data_filtre2 %>% filter(Annee == 2021)
    ratio_homme<-data_filtre3$tx_rea1/data_filtre3$tx_hosp1
    ratio_femme<-data_filtre3$tx_rea2/data_filtre3$tx_hosp2
    p3 <- ggplot(data_filtre3,
                aes(semaine, ratio_homme)) +
      geom_line(color = "steelblue") +
      labs(title = "Part des réanimations parmi les hospitalisations", x = 'Semaines 2021', y = 'Ratio réa/hospi', color = 'Région / Densité') +
      geom_line(aes(semaine, ratio_femme), color = "darkred")
      #scale_color_discrete(name = "Sexe", labels = c("Hommes", "Femmes"))
  ggplotly(p3)
  })
  
#  output$plot_tx <- renderPlotly({
#    p <- ggplot(data, aes(taux_vaccin_reg, tx_rea_reg, color = nomReg)) +
#      geom_line(aes(size = densite_reg, frame = semaine)) +
#      labs(title = 'Titre', x = 'Taux de vaccination', y = 'Taux de réanimation', color = 'Région / Densité') +
#      geom_line(aes(taux_vaccin_reg, tx_rea_reg*10000)) +
#      ease_aes('linear')
#    ggplotly(p)
#  })
}

shinyApp(ui = ui, server = server)

}
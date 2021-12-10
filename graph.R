
  
rh<-table_sexe$tx_rea1/table_sexe$tx_hosp1
rf<-table_sexe$tx_rea2/table_sexe$tx_hosp2

p <-ggplot(table_sexe %>%  filter (nomReg==input$choix_region), aes(x=semaine)) + 
      geom_line(aes(y = rh), color = "darkred") + 
      geom_line(aes(y = rf), color="steelblue", linetype="twodash") 









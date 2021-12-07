library(shiny)
## Only run examples in interactive R sessions
if (interactive()) {
  
  ui <- fluidPage(
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
  shinyApp(ui, server = function(input, output) { })
}
library(shiny) 

ui <- fluidPage(

    # Application title
    titlePanel("Covid evolution"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
         
            tabsetPanel(id = "tabs",
                        tabPanel("Hello", "This is the hello tab"),
                        tabPanel("Foo", "This is the foo tab"),
                        tabPanel("Bar", "This is the bar tab")
            ),
            plotOutput("distPlot"),
         
           ))
    )
    
   
     selectInput("variable", "Choisir un département :",
                c(as.character(dpt)),
    tableOutput("data")
), 
selectInput("variable", "Variable:",
            c("Cylinders" = "cyl",
              "Transmission" = "am",
              "Gears" = "gear")),
tableOutput("data")
)

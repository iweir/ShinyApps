ui <- fluidPage(
  titlePanel("Weibull Parameters for Survival Data"),
  
  mainPanel(
    textOutput("caption"),
    plotOutput("plot1"),  plotOutput("plot2"), textOutput("author")),
  
  sidebarPanel(
    
    numericInput("lambda", paste0("Set $$\\lambda > 0$$"), value=8, min=0.5, max=100, step=0.5),
    
    numericInput("nu", paste0("Set $$\\nu > 0$$"), value=0.5, min=0.01, max=1, step=0.01),
    
    sliderInput("tmax", "Time range",
                value = 5, min = 1, max = 10, step=1),
    
    sliderInput("hmax", "Hazard range",
                value = 2, min = 1, max = 20, step=1),
    
    checkboxInput("lines", "median line", value=0, width=NULL),
    
    uiOutput("survivalformula"),
    
    uiOutput("hazardformula")
    
  )
)
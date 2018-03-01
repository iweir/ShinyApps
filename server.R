server <- function(input, output){
  
  
  sliderValues <- reactive({
    #weib <- function(t,lambda,nu){exp(-lambda*t^nu)}
    
    #times <- as.data.frame(seq(0,12, by=0.05))
    
    data <- data.frame( lambda=(input$lambda), nu=input$nu, tmax=input$tmax, hmax=input$hmax, lines=input$lines)
    
    # weibres <- weib(time, data$nu, data$lambda)
  })
  
  output$caption <- renderText({"Use this tool to search for situationally appropriate parameters for a Weibull survival distribution."})
  
  output$author <- renderText({"Created by Isabelle Weir, February 2018"})
  
  output$plot1 <- renderPlot({
    
    times <- c(seq(0,sliderValues()$tmax, by=0.01))
    
    #if(sliderValues()$overlay){i<- 1}else{i<-0}
    
    #if(i>0){lines(exp(-sliderValues()$lambda*times)^sliderValues()$nu)}else{
    plot(times,exp(-(times/sliderValues()$lambda)^sliderValues()$nu),type="l", xlab=c("time"), ylab=c("survival probability"), main=c("Weibull Survival Function"), xlim=c(0,sliderValues()$tmax), ylim=c(0,1), lwd=3)
    #}
    if(sliderValues()$lines){abline(h=0.5, lty=3, col="red", lwd=3)}
    
  })
  
  output$plot2 <- renderPlot({ 
    #times <- as.data.frame(seq(0,sliderValues()$tmax, by=0.01))
    times <- c(seq(0,sliderValues()$tmax, by=0.01))
    
    plot(times,(sliderValues()$nu/sliderValues()$lambda)*((times/sliderValues()$lambda)^(sliderValues()$nu-1)), type="l", xlab=c("time"), ylab=c("hazard"), main=c("Weibull Hazard Function"), xlim=c(0,sliderValues()$tmax), ylim=c(0,sliderValues()$hmax), lwd=3)
    
  })
  
  output$survivalformula <- renderUI({ 
    withMathJax(paste0("Survival Function: $$ S(t)= exp\\bigg(-\\bigg(\\frac{t}{\\lambda}\\bigg)^{\\nu}\\bigg) $$"))
  })
  
  output$hazardformula <- renderUI({ 
    withMathJax(paste0("Hazard Function: $$ h(t)= \\frac{\\nu}{\\lambda}\\bigg(\\frac{t}{\\lambda}\\bigg)^{\\nu-1} $$"))
  })
  
}
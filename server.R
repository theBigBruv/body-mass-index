# Server logic for simple application that estimates your Body Mass Index based
# on inputs of the individual's body mass (in kilograms) and height (in meters)

library(shiny)

bmi <- function(bodyMass, height) round(bodyMass/(height^2), 2)
classification <- function(bodyMass, height) {
    if (bodyMass/(height^2) < 18.5 ) {
        classification <- "(Underweight)"
    }
    else if (bodyMass/(height^2) <= 25) {
        classification <- "(Normal)"
    }
    else if (bodyMass/(height^2) <= 30) {
        classification <- "(Overweight)"
    }
    else {
        classification <- "(Obese)"
    }
}

shinyServer(
    function(input, output) {
        output$bodyMassInput <- renderPrint({input$bodyMass})
        output$heightInput <- renderPrint({input$height})
        output$bmiEstimate <- renderPrint(paste({bmi(input$bodyMass, input$height)}, {classification(input$bodyMass, input$height)}))
    
}
)

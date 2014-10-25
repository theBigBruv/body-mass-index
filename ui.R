
# Simple application that estimates your Body Mass Index based on inputs
# of the individual's body mass (in kilograms) and height (in meters)

library(shiny)

shinyUI(
    
    pageWithSidebar(
  
      # Application title
      headerPanel("Body Mass Index Estimate"),
      
      # Sidebar with numeric inputs for body mass and height
      sidebarPanel(
        h4("Estimate Body Mass Index by entering body mass (in kilograms) and height (in meters) values below:"),
        numericInput('bodyMass', 'Body Mass (kilograms)', 100, min = 10, max = 250, step = 5),
        numericInput('height', 'Height (meters)', 1, min = 0.1, max = 2.5, step = 0.05),
        submitButton('Submit')
      ),
      
      # Main panel with estimated Body Mass Index
      mainPanel(
        h3('Body Mass Index Estimate'),
        h4('You entered body mass value of '),
        verbatimTextOutput("bodyMassInput"),
        h4('And height value of '),
        verbatimTextOutput("heightInput"),
        h4('Which resulted in a BMI estimate of '),
        verbatimTextOutput("bmiEstimate")
          
      )  
    )
)

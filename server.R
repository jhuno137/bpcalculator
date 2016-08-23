
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# Numeric result of the diagnostic to human readable text
diagosticResultToText <- function(result){
    
    # input validation: if 'result' is not between
    # 1 and 5 or is not integer return the string 
    # "Unknown"
    if(!is.integer(result) || result>5 || result<1)
        return('Unknown')
    
    # there are 5 posible cases which will be stored 
    # in the <character> vector 'cases'
    cases <- vector(mode = "character",length = 5)
    cases[1] = 'Low'
    cases[2] = 'Normal'
    cases[3] = 'Pre-Hypertension'
    cases[4] = 'Stage 1 Hypertension'
    cases[5] = 'Stage 2 Hypertension'
    
    # return the text for the diagnostic result
    cases[result]
}

# Calculate result of the bllod pressure diagnostic
# in function of the systolic blood pressure and
# diastolic blood pressure (both in mmHg). 
# The result of the diagnostic will be encoded as an
# integer number ranging from 1 to 5.
boodPressureDiagnosis <- function(systolic=100,diastolic=70){
    if(diastolic<60 && systolic <90)
        1L # Low
    else if(diastolic<80 && systolic<120)
        2L # Normal
    else if(diastolic<90 && systolic<140)
        3L # Pre-Hyper
    else if(diastolic<100 && systolic<159)
        4L # Hypertension (Stage 1)
    else
        5L # Hypertension (Stage 2)
}


shinyServer(function(input, output) {
    
  output$result <- renderText({
      # get systolic blood pressure from user
      systolic <- input$systolic
      # get diastolic blood pressure from user
      diastolic <- input$diastolic
      # calculate diagnostic
      result <- boodPressureDiagnosis(systolic,diastolic)
      # send diagnostic as text to the user
      diagosticResultToText(result)
  })
})

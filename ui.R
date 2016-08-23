
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
require(markdown)

shinyUI(fluidPage(
    tabsetPanel(
        tabPanel("Home",
    
            # Application title
            titlePanel("Blood Pressure Calculator"),
        
            # Sidebar with a slider input for number of bins
            sidebarLayout(
                sidebarPanel(
                  sliderInput("systolic",
                              "Systolic Pressure (mmHg):",
                              min = 70,
                              max = 190,
                              value = 110),
                  sliderInput("diastolic",
                               "Diastolic Pressure (mmHg):",
                               min = 40,
                               max = 100,
                               value = 70)
                ),
            
            
                # Show a plot of the generated distribution
                mainPanel(
                    h2("Result"),
                    textOutput("result"),
                    tags$style(
                        type='text/css', 
                        '#result {font-size: 1.4em;
                            border:1px solid #ccc;
                            padding:10px;
                            background: #f7f7f7;
                        }'),
                    h3("Disclaimer"),
                    p("All information and content on this site are for information 
                      and educational purposes only. The information should not be 
                      used for either diagnosis or treatment or both for any health 
                      related problem or disease. Always seek the advice from a 
                      qualified physician for medical diagnosis and treatment."),
                    tags$head(tags$script(src="app.js")),
                    h3("Source on github"),
                    tags$a(href="https://github.com/jhuno137/bpcalculator","https://github.com/jhuno137/bpcalculator")
                    
                )
            )
        ),
        
        tabPanel("Help",
            includeMarkdown("help.md")
        )
    )
))

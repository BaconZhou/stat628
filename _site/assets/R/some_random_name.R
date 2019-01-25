library(shiny)
ui <- fluidPage(
  titlePanel("Discussion 628"),
  sidebarPanel(
    textInput("expression", label = h3("Equation input"), value = "1+1"),
    actionButton("calculate", "Calculate!")
  ),
  mainPanel(
    h5("Result: "),
    verbatimTextOutput("value")
  )
)
server <- function(input, output) {
  # write your code
  result = eventReactive(input$calculate, {
    paste(input$expression, "=", eval(parse(text = input$expression)))
  }
  )
  output$value = renderPrint({
    result()
  })
}
shinyApp(ui = ui, server = server)
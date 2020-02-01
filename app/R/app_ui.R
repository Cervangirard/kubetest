#' The application User-Interfac
#'
#' @param request Internal parameter for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(# Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    fluidPage(h1("app"),
              tabsetPanel(
                tabPanel(
                  "ok",
                  br(),
                  actionButton("user", "Je marche :P"),
                  selectInput(
                    "species",
                    label = "Choix",
                    choices = unique(iris$Species)
                  ),
                tableOutput("plot")
                ),
                tabPanel("test",
                         selectInput("mtcars", "Choose var of mtcars", choices = names(mtcars)),
                         textOutput("resultat"))
              )))
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem activate_js favicon
#' @noRd
#' 
golem_add_external_resources <- function() {
  addResourcePath('www', system.file('app/www', package = "app"))
  
  tags$head(activate_js(),
            favicon(),
            tags$title("app"))
            # Add here all the external resources
            # If you have a custom.css in the inst/app/www
            # Or for example, you can add shinyalert::useShinyalert() here
            #tags$link(rel="stylesheet", type="text/css", href="www/custom.css"))
}

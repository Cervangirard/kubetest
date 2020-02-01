#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom future future 
#' @importFrom promises %...>%
#' @importFrom magrittr %>% 
#' @importFrom purrr map_df
#' @importFrom grid grid.raster 
#' @noRd
app_server <- function( input, output, session ) {
  
  # List the first level callModules here
  
  local <- reactiveVal(iris)
  people <- reactiveVal(digest::digest(Sys.time()))
  
  observeEvent( input$species , {
    
    req(input$species)
    
    write_logs(as.character(Sys.time()))
    write_logs(people())
    write_logs("Call api")
    species <- input$species
    
    future(packages = "app",{
      ok <- httr::GET(get_url(species))
      httr::content(ok)
    })  %...>%
      map_df(as.data.frame) %...>%
      head(10) %...>%
      local()
    
    write_logs("Call fini")
    write_logs(as.character(Sys.time()))
    
  })
  
  output$plot <- renderTable({
    local()
  })
  
  output$resultat <- renderText({
    mtcars[, input$mtcars]
  })
  
  observeEvent( input$user , {
   message("Le User peut faire des choses")
  })
  
}

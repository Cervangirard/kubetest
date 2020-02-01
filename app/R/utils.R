write_logs <- function(log, fichier = "logs.txt") {
  if (!file.exists("logs.txt")) {
    file.create("logs.txt")
  }
  write(x = log, file = fichier, append = TRUE)
}

#' Title
#'
#' @param g param pour l'api
#'
#' @importFrom httr GET
#' @importFrom purrr map_df
#' @import promises
#'
#' @export
#' @return data

get_data <- function(g) {
  future({
    ok <- httr::GET(get_url(g))
    httr::content(ok)
  })  %...>%
    map_df(as.data.frame) %...>%
    head(10)
}

#' Title
#'
#' @param q param pour l'url
#' @param url url de l'api
#' @param port port de lapi
#'
#' @export
get_url <- function(q,
                    url = Sys.getenv('urlapi', "127.0.0.1"),
                    port = Sys.getenv('portapi', "8080")) {
  
    paste0(url, ":", port, "/species?species=", q)
  
  }
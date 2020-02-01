#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(dplyr)
library(knitr)

#* @apiTitle Plumber Example API

#* Echo back the input
#* @param species species
#* @json
#* @get /species
function(species = "setosa") {
  Sys.sleep(5)
    if(!file.exists("/home/data/log.txt")){
        file.create("/home/data/log.txt")
    }
    write("new call", file = "/home/data/log.txt", append = TRUE)
    write(as.character(Sys.time()),"/home/data/log.txt", append = TRUE)
    write("end call","/home/data/log.txt", append = TRUE)
    write("","/home/data/log.txt", append = TRUE)
    
  iris %>%
    filter(Species == species) 
}

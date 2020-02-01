## Launch Rscript

host <- Sys.getenv("HOST_PR", "0.0.0.0")
port <- Sys.getenv("PORT_PR", 8080)

pr <- plumber::plumb(file='plumber.R')
pr$run(host= host, port = as.numeric(port))
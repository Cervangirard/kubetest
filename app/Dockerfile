FROM rocker/tidyverse:3.6.1
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "97bbf81")'
RUN R -e 'remotes::install_cran("config")'
RUN R -e 'remotes::install_cran("golem")'
RUN R -e 'remotes::install_cran("shiny")'
RUN R -e 'remotes::install_cran("magrittr")'
RUN R -e 'remotes::install_github("HenrikBengtsson/future@cbef203967826fd2d8cd22360cee5024da55952e")'
RUN R -e 'remotes::install_github("rstudio/promises@627dfc6a9189575265c744e700efcff4de94cd19")'
RUN R -e 'remotes::install_cran("purrr")'
RUN R -e 'remotes::install_cran("httr")'
RUN R -e 'remotes::install_cran("digest")'
COPY app_*.tar.gz /app.tar.gz
RUN R -e 'remotes::install_local("/app.tar.gz")'
EXPOSE 80
CMD R -e "future::plan(future::multisession,.skip = TRUE);options('shiny.port'=80,shiny.host='0.0.0.0');app::run_app()"

FROM r-base

RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('ggplot2')"
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('knitr')"

COPY plumber.R plumber.R
COPY launch.R launch.R

EXPOSE 8080

CMD ["Rscript","launch.R"]
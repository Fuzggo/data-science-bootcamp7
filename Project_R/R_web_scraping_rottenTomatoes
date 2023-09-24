#install and load packages
print(install.packages("tidyverse"))
print(install.packages("rvest"))
library(tidyverse)
library(rvest)

#web scraping movies in theaters 2023 by rotten tomatoes
url <- "https://www.rottentomatoes.com/browse/movies_in_theaters/"

movie_theaters_name <- url %>%
    read_html() %>%
    html_elements("span.p--small") %>%
    html_text2()

date_time <- url %>%
    read_html() %>%
    html_elements("span.smaller") %>%
    html_text2()

# Ensure both vectors have the same length
if (length(movie_theaters_name) > length(date_time)) {
  # If there are more theaters than dates, fill in missing dates with NA
  date_time <- c(date_time, rep(NA, length(movie_theaters_name) - length(date_time)))
}

df1 <- data.frame(movie_theaters_name ,date_time)
view(df1)

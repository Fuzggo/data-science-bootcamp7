#install and load packages
print(install.packages("tidyverse"))
print(install.packages("rvest"))
library(tidyverse)
library(rvest)

#web scraping top 50 movies sorted by IMDb
url <- "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=music&sort=user_rating,desc"

movie_name <- url %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>%
  html_text2()

ratings <- url %>%
  read_html() %>%
  html_elements("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

  votes <- url %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2()

  genre <- url %>%
  read_html() %>%
  html_elements("span.genre") %>%
  html_text2()

  movie_time <- url %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2()


df <- data.frame(movie_name, votes, genre, movie_time)

#Clean data
#seperate vote and gross column
df<- df %>%
  separate(votes, sep=" \\| ", into=c("votes", "gross"))

#replace character in column votes by whitespace and change values to num
df$votes <- as.numeric(gsub("\\D", "", df$votes))

#replace only the start and end string we choose
df$gross <- substring(df$gross, 9, 15:20)

view(df)

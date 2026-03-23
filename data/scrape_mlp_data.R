library(tidyverse)
library(rvest)
library(httr)

link1 = "https://omdbapi.com/?i=tt1751105&season=1&apikey=360a3b0"
page1 = read_html(link1)


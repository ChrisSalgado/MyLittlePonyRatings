library(tidyverse)
library(rvest)
library(httr)
library(xml2)


ponyframe = data.frame()

for (i in 1:9) {
  
  # GET THE LINK
  key = "360a3b0"
  season = as.character(i)
  first_link_part = "https://omdbapi.com/?i=tt1751105&r=xml&season="
  api_link_part = "&apikey="
  final_link = paste(first_link_part, season, api_link_part, key, sep = "")
  
  # EXTRACT INDIVIDUAL COLS
  page = read_xml(final_link)
  body_nodes = xml_find_all(page, "result")
  titlepart = trimws(xml_attr(body_nodes, "Title"))
  datepart = trimws(xml_attr(body_nodes, "Released"))
  episodepart = trimws(xml_attr(body_nodes, "Episode"))
  ratingpart = trimws(xml_attr(body_nodes, "imdbRating"))
  
  # FILL IN DATAFRAME
  curr_ponyframe = data.frame(
    title = titlepart,
    release_date = datepart,
    episode_num = episodepart,
    rating = ratingpart
  )
  
  ponyframe = rbind(ponyframe, curr_ponyframe)

}
print(ponyframe)


# 
# # GET THE LINK
# key = "360a3b0"
# season = as.character(1)
# first_link_part = "https://omdbapi.com/?i=tt1751105&r=xml&season="
# api_link_part = "&apikey="
# final_link = paste(first_link_part, season, api_link_part, key, sep = "")
# 
# # EXTRACT INDIVIDUAL COLS
# page = read_xml(final_link)
# body_nodes = xml_find_all(page, "result")
# titlepart = trimws(xml_attr(body_nodes, "Title"))
# datepart = trimws(xml_attr(body_nodes, "Released"))
# episodepart = trimws(xml_attr(body_nodes, "Episode"))
# ratingpart = trimws(xml_attr(body_nodes, "imdbRating"))
# 
# # FILL IN DATAFRAME
# curr_ponyframe = data.frame()
# 
# if (nrow(ponyframe) == 0) {
#   ponyframe[26, ] = NA
#   ponyframe[, c("title", "release_date", "episode_num", "rating")] = NA
#   ponyframe$title = titlepart
#   ponyframe$release_date = datepart
#   ponyframe$episode_num = episodepart
#   ponyframe$rating = ratingpart 
# } else {
#   curr_ponyframe[26, ] = NA
#   curr_ponyframe[, c("title", "release_date", "episode_num", "rating")] = NA
#   curr_ponyframe$title = titlepart
#   curr_ponyframe$release_date = datepart
#   curr_ponyframe$episode_num = episodepart
#   curr_ponyframe$rating = ratingpart
#   rbind(ponyframe, curr_ponyframe)
# }
# print(ponyframe)

# ponyframe = data.frame()
# if (nrow(ponyframe) == 0) {
#   print("yaya")
# }

# key = "360a3b0"
# season = as.character(1)
# first_link_part = "https://omdbapi.com/?i=tt1751105&r=xml&season="
# api_link_part = "&apikey="
# final_link = paste(first_link_part, season, api_link_part, key, sep = "")
# print(final_link)
# 
# yaya = paste("Hello", "world", sep=" ")
# print(yaya)

# ?paste

# test1 = "https://omdbapi.com/?i=tt1751105&r=xml&season=1&apikey=360a3b0"
# test2 = read_xml(test1)
# test2
# View(test2)
# 
# test3 = "https://omdbapi.com/?i=tt1751105&r=xml&season=2&apikey=360a3b0"
# test4 = read_xml(test3)
# test4
# View(test4)
# 
# test5 = xml_find_all(test4, "result")
# test5
# View(test5)
# 
# titlelabs = trimws(xml_attr(test5, "Title"))
# titlelabs
# 
# releaselabs = trimws(xml_attr(test5, "Released"))
# releaselabs
# 
# episodelabs = trimws(xml_attr(test5, "Episode"))
# episodelabs
# 
# ratinglabs = trimws(xml_attr(test5, "imdbRating"))
# ratinglabs
# 
# test1 = "https://omdbapi.com/?i=tt1751105&r=xml&season=1&apikey=360a3b0"
# test2 = read_xml(test1)
# 
# test6 = xml_find_all(test2, "result")
# 
# season_one_title_labs = trimws(xml_attr(test6, "Title"))
# season_one_title_labs
# 
# season_one_release_labs = trimws(xml_attr(test6, "Released"))
# season_one_release_labs
# 
# season_one_epi_labs = trimws(xml_attr(test6, "Episode"))
# season_one_epi_labs
# 
# season_one_rating_labs = trimws(xml_attr(test6, "imdbRating"))
# season_one_rating_labs
# 
# ponyframe2 = data.frame()
# ponyframe2[26, ] = NA
# ponyframe2[, c("title", "release_date", "episode_num", "rating")] = NA
# ponyframe2$title = season_one_title_labs
# ponyframe2$release_date = season_one_release_labs
# ponyframe2$episode_num = season_one_epi_labs
# ponyframe2$rating = season_one_rating_labs
# ponyframe2
# 
# ponyframe = data.frame()
# ponyframe[26, ] = NA
# ponyframe[, c("title", "release_date", "episode_num", "rating")] = NA
# ponyframe$title = titlelabs
# ponyframe$release_date = releaselabs
# ponyframe$episode_num = episodelabs
# ponyframe$rating = ratinglabs
# ponyframe
# 
# ponyframe3 = rbind(ponyframe2, ponyframe)
# ponyframe3


  

# # TITLE, DATE RELEASED, WHAT EPISODE, WHAT RATING, IMDB ID
# ?xml2
# ?rbind

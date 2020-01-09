## code to prepare `font-family` dataset goes here

fonts <- gfonts::get_all_fonts()
fonts <- fonts[, c("id", "family", "category")]

usethis::use_data(fonts, internal = TRUE)


#  ------------------------------------------------------------------------
#
# Title : Download & include fonts in package
#    By : Victor
#  Date : 2019-11-07
#
#  ------------------------------------------------------------------------



library(gfonts)





# Data for included fonts -------------------------------------------------

included_fonts <- gfonts::get_all_fonts()
included_fonts <- included_fonts[, c("id", "family", "category", "version", "lastModified")]
included_fonts <- subset(
  included_fonts,
  id %in% c("roboto", "open-sans", "lato", "montserrat",
            "alegreya", "nunito-sans", "baloo", "happy-monkey",
            "henny-penny")
)
rownames(included_fonts) <- seq_len(nrow(included_fonts))

usethis::use_data(included_fonts, overwrite = TRUE)





# Roboto ------------------------------------------------------------------


# dir.create("inst/assets/fonts/roboto/")
# font files
download_font(
  id = "roboto",
  output_dir = "inst/assets/fonts/roboto/",
  variants = "regular,300italic,700"
)

# css
generate_css(
  id = "roboto",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/roboto.css",
  font_dir = "../fonts/roboto/"
)



# Open sans ---------------------------------------------------------------

# dir.create("inst/assets/fonts/open-sans/")
# font files
download_font(
  id = "open-sans",
  output_dir = "inst/assets/fonts/open-sans/",
  variants = "regular,300italic,700"
)

# css
generate_css(
  id = "open-sans",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/open-sans.css",
  font_dir = "../fonts/open-sans/"
)



# Lato --------------------------------------------------------------------

# dir.create("inst/assets/fonts/lato/")
# font files
download_font(
  id = "lato",
  output_dir = "inst/assets/fonts/lato/",
  variants = "regular,300italic,700"
)

# css
generate_css(
  id = "lato",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/lato.css",
  font_dir = "../fonts/lato/"
)




# Montserrat --------------------------------------------------------------

# dir.create("inst/assets/fonts/montserrat/")
# font files
download_font(
  id = "montserrat",
  output_dir = "inst/assets/fonts/montserrat/",
  variants = "regular,300italic,700"
)

# css
generate_css(
  id = "montserrat",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/montserrat.css",
  font_dir = "../fonts/montserrat/"
)




# Alegreya ----------------------------------------------------------------

# dir.create("inst/assets/fonts/alegreya/")
# font files
download_font(
  id = "alegreya",
  output_dir = "inst/assets/fonts/alegreya/",
  variants = "regular,italic,700"
)

# css
generate_css(
  id = "alegreya",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/alegreya.css",
  font_dir = "../fonts/alegreya/"
)





# Nunito sans -------------------------------------------------------------

# dir.create("inst/assets/fonts/nunito-sans/")
# font files
download_font(
  id = "nunito-sans",
  output_dir = "inst/assets/fonts/nunito-sans/",
  variants = "regular,italic,700"
)

# css
generate_css(
  id = "nunito-sans",
  c("regular", "italic", "700"),
  output = "inst/assets/css/nunito-sans.css",
  font_dir = "../fonts/nunito-sans/"
)




# Baloo -------------------------------------------------------------------

# dir.create("inst/assets/fonts/baloo/")
# font files
download_font(
  id = "baloo-2",
  output_dir = "inst/assets/fonts/baloo/",
  variants = "regular"
)

# css
generate_css(
  id = "baloo-2",
  c("regular"),
  output = "inst/assets/css/baloo.css",
  font_dir = "../fonts/baloo/"
)





# Happy monkeys -----------------------------------------------------------

# dir.create("inst/assets/fonts/happy-monkey/")
# font files
download_font(
  id = "happy-monkey",
  output_dir = "inst/assets/fonts/happy-monkey/",
  variants = "regular"
)

# css
generate_css(
  id = "happy-monkey",
  c("regular"),
  output = "inst/assets/css/happy-monkey.css",
  font_dir = "../fonts/happy-monkey/"
)





# Henny Penny -------------------------------------------------------------

# dir.create("inst/assets/fonts/henny-penny/")
# font files
download_font(
  id = "henny-penny",
  output_dir = "inst/assets/fonts/henny-penny/",
  variants = "regular"
)

# css
generate_css(
  id = "henny-penny",
  c("regular"),
  output = "inst/assets/css/henny-penny.css",
  font_dir = "../fonts/henny-penny/"
)











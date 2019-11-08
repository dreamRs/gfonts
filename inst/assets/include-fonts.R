
#  ------------------------------------------------------------------------
#
# Title : Download & include fonts in package
#    By : Victor
#  Date : 2019-11-07
#
#  ------------------------------------------------------------------------



library(gfonts)



# Roboto ------------------------------------------------------------------

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



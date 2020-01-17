
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




# Alegreya ----------------------------------------------------------------

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

# font files
download_font(
  id = "nunito-sans",
  output_dir = "inst/assets/fonts/nunito-sans/",
  variants = "regular,italic,700"
)

# css
generate_css(
  id = "nunito-sans",
  c("regular", "300italic", "700"),
  output = "inst/assets/css/nunito-sans.css",
  font_dir = "../fonts/nunito-sans/"
)




# Baloo -------------------------------------------------------------------

# font files
download_font(
  id = "baloo",
  output_dir = "inst/assets/fonts/baloo/",
  variants = "regular"
)

# css
generate_css(
  id = "baloo",
  c("regular"),
  output = "inst/assets/css/baloo.css",
  font_dir = "../fonts/baloo/"
)





# Happy monkeys -----------------------------------------------------------

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












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
download_font(id = "roboto", output_dir = "inst/assets/fonts/roboto/", variants = "regular,300italic,700")

# css
generate_css("roboto", c("regular", "300italic", "700"), output = "inst/assets/css/roboto.css", font_dir = "../fonts/roboto/")


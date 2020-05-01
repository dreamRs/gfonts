if (interactive()) {

  library(gfonts)
  library(htmltools)

  browsable(tags$div(
    use_pkg_gfont("open-sans"),
    tag_example(),
    tags$h1("First level title"),
    tags$h2("Second level title"),
    tags$h3("Third level title"),
    tags$h4("Fourth level title"),
    tags$h5("Fifth level title"),
    tags$h6("Sixth level title")
  ))


  browsable(tags$div(
    use_pkg_gfont("henny-penny"),
    tag_example(),
    tags$h1("First level title"),
    tags$h2("Second level title"),
    tags$h3("Third level title"),
    tags$h4("Fourth level title"),
    tags$h5("Fifth level title"),
    tags$h6("Sixth level title")
  ))

}

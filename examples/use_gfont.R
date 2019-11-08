library(gfonts)
library(htmltools)

browsable(tags$div(
  use_gfont("henny-penny"),
  tags$p(
    paste(letters, collapse = "")
  ),
  tags$p(
    paste(LETTERS, collapse = "")
  ),
  tags$p(
    style = "font-weight: bold;",
    paste(letters, collapse = "")
  ),
  tags$p(
    style = "font-weight: bold;",
    paste(LETTERS, collapse = "")
  ),
  tags$p(
    style = "font-style: italic;",
    paste(letters, collapse = "")
  ),
  tags$p(
    style = "font-style: italic;",
    paste(LETTERS, collapse = "")
  ),
  tags$h1("First level title"),
  tags$h2("Second level title"),
  tags$h3("Third level title"),
  tags$h4("Fourth level title"),
  tags$h5("Fifth level title"),
  tags$h6("Sixth level title")
))

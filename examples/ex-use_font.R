
if (interactive()) {
  library(gfonts)

  # Here we use a temp directory
  # but in Shiny, it can be www/ folder
  directory <- tempfile()
  dir.create(directory)

  # Setup a font (only needed once)
  setup_font(
    id = "dancing-script",
    output_dir = directory
  )

  library(shiny)

  ui <- fluidPage(

    # Use font
    use_font(
      id = "dancing-script",
      css_path = file.path(directory, "css/dancing-script.css")
    ),

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
  )

  server <- function(input, output, session) {

  }
  shinyApp(ui, server)
}












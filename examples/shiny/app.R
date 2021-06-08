


# Font --------------------------------------------------------------------

library(gfonts)
# setup_font(
#   id = "kiwi-maru",
#   output_dir = "examples/shiny/www"
# )

# App ---------------------------------------------------------------------

library(shiny)

ui <- fluidPage(
  use_font("kiwi-maru", "www/css/kiwi-maru.css", css = "font-family: 'Kiwi Maru', serif;"),
  tag_example()
)

server <- function(input, output, session) {

}

shinyApp(ui, server)

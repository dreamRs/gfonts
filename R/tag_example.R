
#' Generate HTML tags used in examples
#'
#' @param class Class of the main div.
#'
#' @importFrom htmltools HTML tags
#'
#' @return HTML tags.
#' @export
#'
#' @examples
#' tag_example()
tag_example <- function(class = NULL) {
  style_grid <- paste(
    "display: grid;",
    "grid-template-columns: repeat(2, 1fr);",
    "grid-template-rows: 1fr;",
    "grid-column-gap: 0px;",
    "grid-row-gap: 0px;"
  )
  tags$div(
    class = class,
    tags$blockquote(
      tags$p(HTML("&Eacute;coutez !")),
      tags$p(HTML("Puisqu&rsquo;on allume les &eacute;toiles,")),
      tags$p(HTML("C&rsquo;est qu&rsquo;elles sont &agrave; quelqu&rsquo;un n&eacute;cessaires ?")),
      tags$p(HTML("C&rsquo;est que quelqu&rsquo;un d&eacute;sire qu&rsquo;elles soient ?")),
      tags$br(),
      tags$p(HTML("Vladimir Ma&iuml;akovski &ndash; &Eacute;coutez !"))
    ),

    tags$div(
      # style = style_grid,

      tags$div(
        tags$p(
          paste(letters, collapse = "")
        ),
        tags$p(
          style = "font-weight: bold;",
          paste(letters, collapse = "")
        ),
        tags$p(
          style = "font-style: italic;",
          paste(letters, collapse = "")
        )
      ),

      tags$div(
        tags$p(
          paste(LETTERS, collapse = "")
        ),
        tags$p(
          style = "font-weight: bold;",
          paste(LETTERS, collapse = "")
        ),
        tags$p(
          style = "font-style: italic;",
          paste(LETTERS, collapse = "")
        )
      )

    )

  )
}


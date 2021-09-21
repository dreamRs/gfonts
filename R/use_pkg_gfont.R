
#' @title Use a Google Font included in {gfonts}
#'
#' @description For convenience, some fonts are included in the package,
#'  you can use them without having to download them, but only few variants are available.
#'
#' @param font Name of the font to use, possible choices are: \code{"roboto"},
#'  \code{"open-sans"}, \code{"lato"}, \code{"montserrat"}, \code{"alegreya"},
#'  \code{"nunito-sans"}, \code{"baloo"}, \code{"happy-monkey"}, \code{"henny-penny"}.
#' @param selector CSS selector for which to use the font,
#'  usually an HTML tag, default to \code{"body"} (all document).
#'
#' @return An HTML tag with an \code{\link[htmltools]{htmlDependency}}.
#' @export
#'
#' @importFrom htmltools htmlDependency attachDependencies tags
#' @importFrom glue glue
#' @importFrom utils packageVersion
#'
#' @example examples/ex-use_pkg_gfont.R
use_pkg_gfont <- function(font = c("roboto", "open-sans", "lato", "montserrat",
                                   "alegreya", "nunito-sans", "baloo", "happy-monkey",
                                   "henny-penny", "poppins", "oswald"),
                          selector = "body") {

  font <- match.arg(arg = font)

  selector <- paste(selector, collapse = ", ")

  css <- switch(
    font,
    "roboto" = "font-family: 'Roboto', sans-serif;",
    "open-sans" = "font-family: 'Open Sans', sans-serif;",
    "lato" = "font-family: 'Lato', sans-serif;",
    "montserrat" = "font-family: 'Montserrat', sans-serif;",
    "alegreya" = "font-family: 'Alegreya', serif;",
    "nunito-sans" = "font-family: 'Nunito Sans', sans-serif;",
    "baloo" = "font-family: 'Baloo', cursive;",
    "happy-monkey" = "font-family: 'Happy Monkey', cursive;",
    "henny-penny" = "font-family: 'Henny Penny', cursive;",
    "poppins" = "font-family: 'Poppins', sans-serif;",
    "oswald" = "font-family: 'Oswald', sans-serif;"
  )
  css <- glue::glue("{selector} {{{css}}}", selector = selector, css = css)
  css <- paste(css, collapse = "\n")

  attachDependencies(
    x = tags$style(css),
    value = htmlDependency(
      name = font,
      version = as.character(packageVersion("gfonts")),
      src = list(href = "gfonts", file = "assets"),
      package = "gfonts",
      stylesheet = sprintf("css/%s.css", font)
    )
  )
}

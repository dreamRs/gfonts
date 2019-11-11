
#' @importFrom glue glue
glue_css <- function(font_info, path = "../fonts/") {
  template <- readLines(system.file("assets/templates/css_best.txt", package = "gfonts"))
  template <- paste(template, collapse = "\n")
  res <- lapply(
    X = seq_len(nrow(font_info$variants)),
    FUN = function(i) {
      glue::glue(
        template,
        variant = font_info$variants[i, ],
        fontItem = font_info,
        folderPrefix = path
      )
    }
  )
  pasten <- function(...)
    paste(..., sep = "\n")
  Reduce(f = pasten, x = res)
}


#' Generate CSS to import fonts
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param variants Variant of font to use.
#' @param output Specifies path to output file for CSS generated.
#' @param font_dir Fonts directory relative to \code{ouput}.
#'
#' @return a character string with CSS code (invisibly)
#' @export
#'
#' @examples
#' \donttest{
#'
#' cat(generate_css("roboto", "regular"))
#'
#' }
generate_css <- function(id, variants = NULL, output = NULL, font_dir = "../fonts/") {
  font_info <- get_font_info(id = id)
  if (!is.null(variants)) {
    id <- font_info$variants$id
    font_info$variants <- font_info$variants[id %in% variants, ]
  }
  css <- glue_css(font_info = font_info, path = font_dir)
  if (!is.null(output)) {
    writeLines(text = css, con = output)
  }
  invisible(css)
}


#' @title Use a Google Font included in package
#'
#' @description For convenience, some fonts are included in the package,
#'  you can use them without having to download them, but only few variants are available.
#'
#' @param font Name of the font to use, possible choices are: \code{"roboto"},
#'  \code{"open-sans"}, \code{"lato"}, \code{"montserrat"}, \code{"alegreya"},
#'  \code{"nunito-sans"}, \code{"baloo"}, \code{"happy-monkey"}, \code{"henny-penny"}.
#' @param tag Tag to which to apply the font, default to \code{"body"}.
#'
#' @return an \code{htmlDependency}.
#' @export
#'
#' @importFrom htmltools htmlDependency attachDependencies tags
#' @importFrom glue glue
#'
#' @example examples/use_pkg_gfont.R
use_pkg_gfont <- function(font = c("roboto", "open-sans", "lato", "montserrat",
                                   "alegreya", "nunito-sans", "baloo", "happy-monkey",
                                   "henny-penny"),
                          tag = "body") {

  font <- match.arg(arg = font)

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
    "henny-penny" = "font-family: 'Henny Penny', cursive;"
  )
  css <- glue::glue("{tag} {{{css}}}", tag = tag, css = css)
  css <- paste(css, collapse = "\n")

  attachDependencies(
    x = tags$style(css),
    value = htmlDependency(
      name = font,
      version = "0.1.0",
      src = list(href = "gfonts", file = "assets"),
      package = "gfonts",
      stylesheet = sprintf("css/%s.css", font)
    )
  )
}





#' @importFrom glue glue
glue_css <- function(font_info, path = "../fonts/") {
  template <- readLines(system.file("assets/templates/css_best.txt", package = "gfonts"))
  template <- paste(template, collapse = "\n")
  res <- lapply(
    X = seq_len(nrow(font_info$variants)),
    FUN = function(i) {
      variant <- font_info$variants[i, ]
      if (is.null(variant$local))
        variant$local <-  list(c("", ""))
      if (length(variant$local[[1]]) == 1)
        variant$local <- list(c(variant$local[[1]], ""))
      glue::glue(
        template,
        variant = variant,
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
#' @param subsets Subsets to use.
#' @param output Specifies path to output file for CSS generated.
#' @param font_dir Fonts directory relative to \code{ouput}.
#' @param prefer_local_source Generate CSS font-face rules in which user installed fonts are
#'     preferred. Use \code{FALSE} if you want to force the use of the downloaded font.
#'
#' @return a character string with CSS code (invisibly).
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#' # Generate CSS code to use Roboto font
#' cat(generate_css("roboto", "regular"))
#'
#' }
generate_css <- function(id,
                         variants = NULL,
                         subsets = NULL,
                         output = NULL,
                         font_dir = "../fonts/",
                         prefer_local_source = TRUE) {
  font_info <- get_font_info(id = id, subsets = subsets)
  if (!is.null(variants)) {
    id <- font_info$variants$id
    font_info$variants <- font_info$variants[id %in% variants, ]
  }
  css <- glue_css(font_info = font_info, path = font_dir)

  if (!isTRUE(prefer_local_source)) {
    css <- remove_local_src(css)
  }

  if (!is.null(output)) {
    writeLines(text = css, con = output)
  }
  invisible(css)
}

remove_local_src <- function(css) {
  gsub("local\\('[^']+'),?[[:space:]]*", "", css)
}

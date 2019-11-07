
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



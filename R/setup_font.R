
#' @title Setup a font to be used in Shiny or Markdown
#'
#' @description This function will download the specified font into a directory of your project
#'  and generate CSS code to use it in a Shiny application or RMarkdown document.
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param output_dir Output directory where to save font and CSS files. Must be a directory.
#' @param variants Variant(s) to download, default is to includes all available ones.
#' @param subsets Subsets to download.
#' @param prefer_local_source Generate CSS font-face rules in which user installed fonts are
#'     preferred. Use \code{FALSE} if you want to force the use of the downloaded font.
#' @param browser_support Browser to support, choose \code{"best"} to support
#'     old browser or \code{"modern"} for only recent ones.
#' @param ... Arguments passed to \code{crul::HttpClient$new}.
#'
#' @note Two directories will be created (if they do not exist)
#'  in the \code{output_dir} specified: \strong{fonts/} and \strong{css/}.
#'
#' @return None.
#' @export
#'
#' @importFrom crayon bold green red
#' @importFrom glue glue
#'
#' @examples
#' if (interactive()) {
#'
#' # For example, we use a temporary directory
#' path_to_www <- tempfile()
#' dir.create(path_to_www)
#'
#' # In a Shiny app, you can use the www/ directory
#' # in Markdown, use a subfolder of your Rmd directory
#' setup_font(
#'   id = "open-sans-condensed",
#'   output_dir = path_to_www
#' )
#'
#' # Clean up
#' unlink(path_to_www, recursive = TRUE)
#'
#' }
setup_font <- function(id,
                       output_dir,
                       variants = NULL,
                       subsets = NULL,
                       prefer_local_source = TRUE,
                       browser_support = c("best", "modern"),
                       ...) {
  browser_support <- match.arg(browser_support)
  output_dir <- normalizePath(path = output_dir, mustWork = TRUE)
  dir_info <- file.info(output_dir)
  if (isFALSE(dir_info$isdir))
    stop("setup_font: output_dir must be a directory!", call. = FALSE)

  font_dir <- file.path(output_dir, "fonts")
  if (!dir.exists(paths = font_dir))
    dir.create(path = font_dir)
  css_dir <- file.path(output_dir, "css")
  if (!dir.exists(paths = css_dir))
    dir.create(path = css_dir)

  formats <- if (identical(browser_support, "modern")) {
    "woff,woff2"
  }
  download_font(
    id = id,
    output_dir = font_dir,
    variants = variants,
    subsets = subsets,
    formats = formats,
    http_options = list(...)
  )
  cat(crayon::bold(crayon::green("\u2713")), "Font files downloaded!\n")

  generate_css(
    id = id,
    variants = variants,
    subsets = subsets,
    output = file.path(css_dir, paste0(id, ".css")),
    font_dir = "../fonts/",
    prefer_local_source = prefer_local_source,
    browser_support = browser_support,
    ...
  )
  cat(crayon::bold(crayon::green("\u2713")), "CSS file generated!\n")

  path_to_css <- file.path(basename(output_dir), "css", paste0(id, ".css"))
  cat(
    crayon::red("\u2732"),
    glue::glue("Please use `use_font(\"{id}\", \"{path_to_css}\")` to import the font in Shiny or Markdown.")
  )
  invisible(path_to_css)
}






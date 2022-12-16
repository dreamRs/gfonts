
#' @importFrom crul HttpClient
get_gf <- function(path, query = list(), ...) {
  url <- getOption("gfonts.url", default = "https://gwfh.mranftl.com")
  cli <- crul::HttpClient$new(url, ...)
  res <- cli$get(path = path, query = query)
  res$raise_for_status()
  res
}


#' @importFrom crul HttpClient
is_service_ok <- function() {
  url <- getOption("gfonts.url", default = "https://gwfh.mranftl.com")
  res <- crul::HttpClient$new(url)$get()
  res$status_code < 300
}



#' @title Get infos about all fonts available
#'
#' @description Retrieve from API all fonts currently available.
#'  Use the \code{id} field in other functions to reference the font you want to use.
#'
#' @param ... Arguments passed to \code{crul::HttpClient$new}.
#'
#' @return a \code{data.frame}.
#' @export
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' if (interactive()) {
#'
#'  # Retrieve all fonts currently available
#'  all_fonts <- get_all_fonts()
#'
#' }
get_all_fonts <- function(...) {
  res <- get_gf("/api/fonts/", ...)
  jsonlite::fromJSON(res$parse("UTF-8"))
}


#' Get detailed information about a font
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param subsets Select charsets, for example \code{"latin"}.
#' @param ... Arguments passed to \code{crul::HttpClient$new}.
#'
#' @return a \code{data.frame}.
#' @export
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' if (interactive()) {
#'
#'  # Info about Roboto
#'  roboto <- get_font_info("roboto")
#'
#' }
get_font_info <- function(id, subsets = NULL, ...) {
  if (!is.null(subsets))
    subsets <- paste(subsets, collapse = ",")
  res <- get_gf(paste0("/api/fonts/", id), query = dropNulls(list(subsets = subsets)), ...)
  jsonlite::fromJSON(res$parse("UTF-8"))
}



#' Download font files
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param output_dir Output directory where to save font files.
#' @param variants Variant(s) to download, default is to includes all available ones.
#' @param ... Additional parameters to API query.
#' @param http_options Arguments passed to \code{crul::HttpClient$new}.
#'
#' @return a character vector of the filepaths extracted to, invisibly.
#' @export
#'
#' @importFrom utils unzip
#'
#' @examples
#' if (interactive()) {
#'
#' # For example, we use a temporary directory
#' path_to_dir <- tempfile()
#' dir.create(path_to_dir)
#'
#' # Download Roboto font
#' download_font(
#'   id = "roboto",
#'   output_dir = path_to_dir
#' )
#'
#' # Get only regular, italic and bold
#' download_font(
#'   id = "roboto",
#'   output_dir = path_to_dir,
#'   variants = c("regular", "300italic", "700")
#' )
#'
#' # Clean up
#' unlink(path_to_dir, recursive = TRUE)
#'
#' }
download_font <- function(id, output_dir, variants = NULL, ..., http_options = list()) {
  if (length(variants) > 1)
    variants <- paste(variants, collapse = ",")
  output_dir <- normalizePath(output_dir, mustWork = TRUE)
  if (!dir.exists(output_dir)) {
    stop("'output_dir' must be a valid directory!")
  }
  output_dir <- gsub(pattern = "\\\\$", replacement = "", x = output_dir)
  path <- paste0("/api/fonts/", id)
  get_gf_args <- c(
    list(path = path, query = dropNulls(list(download = "zip", variants = variants, ...))),
    http_options
  )
  res <- do.call(get_gf, get_gf_args)
  tmp <- tempfile(fileext = ".zip")
  on.exit(unlink(tmp))
  writeBin(object = res$content, con = tmp)
  unzip(zipfile = tmp, exdir = output_dir)
}




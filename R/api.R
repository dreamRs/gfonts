
#' @importFrom crul HttpClient
get_gf <- function(path, query = list(), ...) {
  url <- getOption("gfonts.url", default = "https://google-webfonts-helper.herokuapp.com")
  cli <- crul::HttpClient$new(url, opts = list(...))
  res <- cli$get(path = path, query = query)
  res$raise_for_status()
  res
}



#' Get infos about all fonts available
#'
#' @return a \code{data.frame}.
#' @export
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' \dontrun{
#' # Retrieve all fonts currently available
#' all_fonts <- get_all_fonts()
#'
#' }
get_all_fonts <- function() {
  res <- get_gf("/api/fonts/")
  jsonlite::fromJSON(res$parse("UTF-8"))
}


#' Get detailed  information about a font
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param subsets Select charsets, for example \code{"latin"}.
#'
#' @return a \code{data.frame}.
#' @export
#'
#' @importFrom jsonlite fromJSON
#'
#' @examples
#' \dontrun{
#' roboto <- get_font_info("roboto")
#' }
get_font_info <- function(id, subsets = NULL) {
  if (!is.null(subsets))
    subsets <- paste(subsets, collapse = ",")
  res <- get_gf(paste0("/api/fonts/", id), query = dropNulls(list(subsets = subsets)))
  jsonlite::fromJSON(res$parse("UTF-8"))
}



#' Download font files
#'
#' @param id Id of the font, correspond to column \code{id} from \code{\link{get_all_fonts}}.
#' @param output_dir Output directory where to save font files.
#' @param variants Variant(s) to download, default is to includes all available ones.
#' @param ... Additional parameters to API query.
#'
#' @return a character vector of the filepaths extracted to, invisibly.
#' @export
#'
#' @importFrom utils unzip
#'
#' @examples
#' \dontrun{
#'
#' path_to_dir <- tempfile()
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
#' unlink(path_to_dir)
#' }
download_font <- function(id, output_dir, variants = NULL, ...) {
  if (length(variants) > 1)
    variants <- paste(variants, collapse = ",")
  output_dir <- normalizePath(output_dir, mustWork = TRUE)
  if (!dir.exists(output_dir)) {
    stop("'output_dir' must be a valid directory!")
  }
  output_dir <- gsub(pattern = "\\\\$", replacement = "", x = output_dir)
  path <- paste0("/api/fonts/", id)
  res <- get_gf(path, dropNulls(list(download = "zip", variants = variants, ...)))
  tmp <- tempfile(fileext = ".zip")
  on.exit(unlink(tmp))
  writeBin(object = res$content, con = tmp)
  unzip(zipfile = tmp, exdir = output_dir)
}




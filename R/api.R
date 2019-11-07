

get_gf <- function(path, query = list(), ...) {
  url <- getOption("gfonts.url", default = "https://google-webfonts-helper.herokuapp.com")
  cli <- crul::HttpClient$new(url, opts = list(...))
  res <- cli$get(path = path, query = query)
  res$raise_for_status()
  res
}



get_all_fonts <- function() {
  res <- get_gf("/api/fonts/")
  jsonlite::fromJSON(res$parse("UTF-8"))
}


get_font_info <- function(id, subsets = NULL) {
  if (!is.null(subsets))
    subsets <- paste(subsets, collapse = ",")
  res <- get_gf(paste0("/api/fonts/", id), query = dropNulls(list(subsets = subsets)))
  jsonlite::fromJSON(res$parse("UTF-8"))
}


download_font <- function(id, output_dir, ...) {
  output_dir <- normalizePath(output_dir, mustWork = TRUE)
  if (!dir.exists(output_dir)) {
    stop("'output_dir' must be a valid directory!")
  }
  output_dir <- gsub(pattern = "\\\\$", replacement = "", x = output_dir)
  path <- paste0("/api/fonts/", id)
  res <- get_gf(path, list(download = "zip", ...))
  tmp <- tempfile(fileext = ".zip")
  on.exit(unlink(tmp))
  writeBin(object = res$content, con = tmp)
  unzip(zipfile = tmp, exdir = output_dir)
}




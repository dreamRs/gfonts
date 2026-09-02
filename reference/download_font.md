# Download font files

Download font files

## Usage

``` r
download_font(id, output_dir, variants = NULL, ..., http_options = list())
```

## Arguments

- id:

  Id of the font, correspond to column `id` from
  [`get_all_fonts`](https://dreamrs.github.io/gfonts/reference/get_all_fonts.md).

- output_dir:

  Output directory where to save font files.

- variants:

  Variant(s) to download, default is to includes all available ones.

- ...:

  Additional parameters to API query.

- http_options:

  Arguments passed to `crul::HttpClient$new`.

## Value

a character vector of the filepaths extracted to, invisibly.

## Examples

``` r
if (interactive()) {

# For example, we use a temporary directory
path_to_dir <- tempfile()
dir.create(path_to_dir)

# Download Roboto font
download_font(
  id = "roboto",
  output_dir = path_to_dir
)

# Get only regular, italic and bold
download_font(
  id = "roboto",
  output_dir = path_to_dir,
  variants = c("regular", "300italic", "700")
)

# Clean up
unlink(path_to_dir, recursive = TRUE)

}
```

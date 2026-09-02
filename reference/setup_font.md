# Setup a font to be used in Shiny or Markdown

This function will download the specified font into a directory of your
project and generate CSS code to use it in a Shiny application or
RMarkdown document.

## Usage

``` r
setup_font(
  id,
  output_dir,
  variants = NULL,
  subsets = NULL,
  prefer_local_source = TRUE,
  browser_support = c("best", "modern"),
  ...
)
```

## Arguments

- id:

  Id of the font, correspond to column `id` from
  [`get_all_fonts`](https://dreamrs.github.io/gfonts/reference/get_all_fonts.md).

- output_dir:

  Output directory where to save font and CSS files. Must be a
  directory.

- variants:

  Variant(s) to download, default is to includes all available ones.

- subsets:

  Subsets to download.

- prefer_local_source:

  Generate CSS font-face rules in which user installed fonts are
  preferred. Use `FALSE` if you want to force the use of the downloaded
  font.

- browser_support:

  Browser to support, choose `"best"` to support old browser or
  `"modern"` for only recent ones.

- ...:

  Arguments passed to `crul::HttpClient$new`.

## Value

None.

## Note

Two directories will be created (if they do not exist) in the
`output_dir` specified: **fonts/** and **css/**.

## Examples

``` r
if (interactive()) {

# For example, we use a temporary directory
path_to_www <- tempfile()
dir.create(path_to_www)

# In a Shiny app, you can use the www/ directory
# in Markdown, use a subfolder of your Rmd directory
setup_font(
  id = "open-sans-condensed",
  output_dir = path_to_www
)

# Clean up
unlink(path_to_www, recursive = TRUE)

}
```

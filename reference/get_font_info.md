# Get detailed information about a font

Get detailed information about a font

## Usage

``` r
get_font_info(id, subsets = NULL, ...)
```

## Arguments

- id:

  Id of the font, correspond to column `id` from
  [`get_all_fonts`](https://dreamrs.github.io/gfonts/reference/get_all_fonts.md).

- subsets:

  Select charsets, for example `"latin"`.

- ...:

  Arguments passed to `crul::HttpClient$new`.

## Value

a `data.frame`.

## Examples

``` r
if (interactive()) {

 # Info about Roboto
 roboto <- get_font_info("roboto")

}
```

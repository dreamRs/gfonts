# Generate CSS to import fonts

Generate CSS to import fonts

## Usage

``` r
generate_css(
  id,
  variants = NULL,
  subsets = NULL,
  output = NULL,
  font_dir = "../fonts/",
  prefer_local_source = TRUE,
  browser_support = c("best", "modern"),
  ...
)
```

## Arguments

- id:

  Id of the font, correspond to column `id` from
  [`get_all_fonts`](https://dreamrs.github.io/gfonts/reference/get_all_fonts.md).

- variants:

  Variant of font to use.

- subsets:

  Subsets to use.

- output:

  Specifies path to output file for CSS generated.

- font_dir:

  Fonts directory relative to `ouput`.

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

a character string with CSS code (invisibly).

## Examples

``` r
if (interactive()) {

# Generate CSS code to use Roboto font
cat(generate_css("roboto", "regular"))

}
```

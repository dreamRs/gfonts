# Use a Google Font included in {gfonts}

For convenience, some fonts are included in the package, you can use
them without having to download them, but only few variants are
available.

## Usage

``` r
use_pkg_gfont(
  font = c("roboto", "open-sans", "lato", "montserrat", "alegreya", "nunito-sans",
    "baloo", "happy-monkey", "henny-penny", "poppins", "oswald"),
  selector = "body"
)
```

## Arguments

- font:

  Name of the font to use, possible choices are: `"roboto"`,
  `"open-sans"`, `"lato"`, `"montserrat"`, `"alegreya"`,
  `"nunito-sans"`, `"baloo"`, `"happy-monkey"`, `"henny-penny"`.

- selector:

  CSS selector for which to use the font, usually an HTML tag, default
  to `"body"` (all document).

## Value

An HTML tag with an
[`htmlDependency`](https://rstudio.github.io/htmltools/reference/htmlDependency.html).

## Examples

``` r
if (interactive()) {

  library(gfonts)
  library(htmltools)

  browsable(tags$div(
    use_pkg_gfont("open-sans"),
    tag_example(),
    tags$h1("First level title"),
    tags$h2("Second level title"),
    tags$h3("Third level title"),
    tags$h4("Fourth level title"),
    tags$h5("Fifth level title"),
    tags$h6("Sixth level title")
  ))


  browsable(tags$div(
    use_pkg_gfont("henny-penny"),
    tag_example(),
    tags$h1("First level title"),
    tags$h2("Second level title"),
    tags$h3("Third level title"),
    tags$h4("Fourth level title"),
    tags$h5("Fifth level title"),
    tags$h6("Sixth level title")
  ))

}
```

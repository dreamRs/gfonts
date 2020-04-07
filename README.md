
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gfonts

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.org/dreamRs/gfonts.svg?branch=master)](https://travis-ci.org/dreamRs/gfonts)
[![Codecov test
coverage](https://codecov.io/gh/dreamRs/gfonts/branch/master/graph/badge.svg)](https://codecov.io/gh/dreamRs/gfonts?branch=master)
<!-- badges: end -->

> Download ‘Google’ fonts (via
> [google-webfonts-helper](https://google-webfonts-helper.herokuapp.com/fonts))
> and generate CSS to use in [rmarkdown](https://rmarkdown.rstudio.com/)
> documents and [shiny](https://shiny.rstudio.com/) applications. Some
> popular fonts are included and ready to use.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dreamRs/gfonts")
```

## Download a font to use it locally

Get the ID of the desired font between 987 available :

``` r
library(gfonts)
get_all_fonts()
```

Download the files necessary for its use and generate the appropriate
CSS code :

``` r
setup_font(
  id = "roboto",
  output_dir = "path/to"
)
```

Use it in {shiny} or {rmarkdown} :

``` r
use_font("roboto", "www/css/roboto.css")
```

:point\_right: [See detailled
example](https://dreamrs.github.io/gfonts/articles/gfonts.html)

## Included fonts

Some fonts are included in the package and ready to use :

``` r
use_pkg_gfont("roboto")
```

![](man/figures/included-fonts.png)

:point\_right: [See all fonts
available](https://dreamrs.github.io/gfonts/articles/articles/included-fonts.html)

## Related packages

  - Package
    [`googlefontR`](https://github.com/timelyportfolio/googlefontR)
    provides helper functions to ease the use of Google Fonts with R.
  - Package [`showtext`](https://github.com/yixuan/showtext) makes it
    easy to use various types of fonts (TrueType, OpenType, Type 1, web
    fonts, etc.) in R graphs.

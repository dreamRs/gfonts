# gfonts

``` r

library(gfonts)
```

{gfonts} allow you to use a [Google font](https://fonts.google.com/) to
use it offline in a Shiny application or a R Markdown document. You can
download a font via [google-webfonts-helper](https://gwfh.mranftl.com)
and generate appropriate CSS to use it.

## Setup a font to use in your project

In your project directory, use `setup_font` once to download a font and
generate CSS code. For example to use the [Roboto
font](https://fonts.google.com/specimen/Roboto), you can do :

``` r

setup_font(
  id = "roboto",
  output_dir = "www",
  variants = "regular"
)
```

In a Shiny application you can use `www/` folder, for R Markdown, create
a sub-folder at the same level as your `.Rmd` file.

[`setup_font()`](https://dreamrs.github.io/gfonts/reference/setup_font.md)
will create two sub-folders, containing the following files :

    www
    +-- css
    |   \-- roboto.css
    \-- fonts
        +-- roboto-v20-latin-regular.eot
        +-- roboto-v20-latin-regular.svg
        +-- roboto-v20-latin-regular.ttf
        +-- roboto-v20-latin-regular.woff
        \-- roboto-v20-latin-regular.woff2

To know all fonts and their ids, you can use
[`get_all_fonts()`](https://dreamrs.github.io/gfonts/reference/get_all_fonts.md)
:

``` r

head(get_all_fonts())
#>             id       family
#> 1    open-sans    Open Sans
#> 2       roboto       Roboto
#> 3  google-sans  Google Sans
#> 4        inter        Inter
#> 5   montserrat   Montserrat
#> 6 noto-sans-jp Noto Sans JP
#>                                                                                                                                          variants
#> 1                                                 300, regular, 500, 600, 700, 800, 300italic, italic, 500italic, 600italic, 700italic, 800italic
#> 2 100, 200, 300, regular, 500, 600, 700, 800, 900, 100italic, 200italic, 300italic, italic, 500italic, 600italic, 700italic, 800italic, 900italic
#> 3                                                                                 regular, 500, 600, 700, italic, 500italic, 600italic, 700italic
#> 4 100, 200, 300, regular, 500, 600, 700, 800, 900, 100italic, 200italic, 300italic, italic, 500italic, 600italic, 700italic, 800italic, 900italic
#> 5 100, 200, 300, regular, 500, 600, 700, 800, 900, 100italic, 200italic, 300italic, italic, 500italic, 600italic, 700italic, 800italic, 900italic
#> 6                                                                                                 100, 200, 300, regular, 500, 600, 700, 800, 900
#>                                                                                                                                                                                                                                           subsets
#> 1                                                                                                                                                   cyrillic, cyrillic-ext, greek, greek-ext, hebrew, latin, latin-ext, math, symbols, vietnamese
#> 2                                                                                                                                                           cyrillic, cyrillic-ext, greek, greek-ext, latin, latin-ext, math, symbols, vietnamese
#> 3 armenian, bengali, canadian-aboriginal, cyrillic, cyrillic-ext, devanagari, ethiopic, georgian, greek, greek-ext, gujarati, gurmukhi, hebrew, khmer, lao, latin, latin-ext, malayalam, oriya, sinhala, symbols, tamil, telugu, thai, vietnamese
#> 4                                                                                                                                                                          cyrillic, cyrillic-ext, greek, greek-ext, latin, latin-ext, vietnamese
#> 5                                                                                                                                                                                            cyrillic, cyrillic-ext, latin, latin-ext, vietnamese
#> 6                                                                                                                                                                                                cyrillic, japanese, latin, latin-ext, vietnamese
#>     category version lastModified popularity defSubset defVariant
#> 1 sans-serif     v44   2025-09-16          1     latin    regular
#> 2 sans-serif     v51   2026-02-19          2     latin    regular
#> 3 sans-serif     v70   2026-07-23          3     latin    regular
#> 4 sans-serif     v20   2025-09-10          4     latin    regular
#> 5 sans-serif     v31   2025-09-05          5     latin    regular
#> 6 sans-serif     v56   2026-01-07          6     latin    regular
```

## Use a font

To use a downloaded font, you can use in your UI or in a chunk :

``` r

use_font("roboto", "www/css/roboto.css")
```

First argument is the id of font downloaded, second is path to CSS file
generated.

An other solution in Shiny application is to import the CSS file in a
link tag and add a style tag:

``` r

fluidPage(
  
  tags$link(rel = "stylesheet", type = "text/css", href = "css/roboto.css"),
  tags$style("body {font-family: 'Roboto', sans-serif;}")
  
)
```

In Markdown, import CSS file in yaml header, and add a CSS chunk :

    ---
    output: 
      html_document:
        css: assets/css/roboto.css
    ---


    ``` css
    body {font-family: 'Roboto', sans-serif;}
    ```

## Download a font

If you only want to download a font, you can use:

``` r

download_font(
  id = "roboto",
  output_dir = "azerty",
  variants = c("regular", "300italic", "700")
)
```

## Generate CSS

To download CSS code to import a font in HTML, you can use:

``` r

generate_css("roboto", "regular", font_dir = "path/to/font")
```

    #> @font-face {
    #>   font-family: 'Roboto';
    #>   font-style: normal;
    #>   font-weight: 400;
    #>   src: url('path/to/roboto-v51-latin-regular.eot'); /* IE9 Compat Modes */
    #>   src: local(''), local(''),
    #>        url('path/to/roboto-v51-latin-regular.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
    #>        url('path/to/roboto-v51-latin-regular.woff2') format('woff2'), /* Super Modern Browsers */
    #>        url('path/to/roboto-v51-latin-regular.woff') format('woff'), /* Modern Browsers */
    #>        url('path/to/roboto-v51-latin-regular.ttf') format('truetype'), /* Safari, Android, iOS */
    #>        url('path/to/roboto-v51-latin-regular.svg#\1') format('svg'); /* Legacy iOS */
    #> }

The path must be relative to the one were this code is saved.

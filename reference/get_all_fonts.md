# Get infos about all fonts available

Retrieve from API all fonts currently available. Use the `id` field in
other functions to reference the font you want to use.

## Usage

``` r
get_all_fonts(...)
```

## Arguments

- ...:

  Arguments passed to `crul::HttpClient$new`.

## Value

a `data.frame`.

## Examples

``` r
if (interactive()) {

 # Retrieve all fonts currently available
 all_fonts <- get_all_fonts()

}
```

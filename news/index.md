# Changelog

## gfonts 0.2.0

CRAN release: 2023-01-08

- Change URL for service: <https://gwfh.mranftl.com>

## gfonts 0.1.3

CRAN release: 2021-09-22

- Fixed failing test.
- Added `browser_support` argument in
  [`setup_font()`](https://dreamrs.github.io/gfonts/reference/setup_font.md)
  to allow downloading only `woff` and `woff2` files for modern
  browsers.
- New fonts available with
  [`use_pkg_gfont()`](https://dreamrs.github.io/gfonts/reference/use_pkg_gfont.md):
  Poppins, Oswald.

## gfonts 0.1.2

CRAN release: 2021-01-11

- Added `subsets` argument to
  [`setup_font()`](https://dreamrs.github.io/gfonts/reference/setup_font.md)
  and
  [`generate_css()`](https://dreamrs.github.io/gfonts/reference/generate_css.md)
  to be able to use other charsets than latin (see
  [\#6](https://github.com/dreamRs/gfonts/issues/6))
- Added ability to pass arguments to `crul::HttpClient$new` from
  [`download_font()`](https://dreamrs.github.io/gfonts/reference/download_font.md),
  [`setup_font()`](https://dreamrs.github.io/gfonts/reference/setup_font.md),
  [`get_font_info()`](https://dreamrs.github.io/gfonts/reference/get_font_info.md).

## gfonts 0.1.1

CRAN release: 2020-05-09

- Initial release on CRAN : Download Google fonts to use locally in HTML
  technologies (shiny, markdown).

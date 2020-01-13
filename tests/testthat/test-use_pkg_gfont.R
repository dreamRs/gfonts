test_that("use_pkg_gfont works", {

  font <- use_pkg_gfont("roboto")
  deps <- htmltools::findDependencies(font)
  expect_is(font, "shiny.tag")
  expect_is(deps, "list")
  expect_true(length(deps) > 0)
})

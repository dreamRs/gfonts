test_that("use_pkg_gfont works", {

  tag <- use_pkg_gfont("roboto")
  deps <- htmltools::findDependencies(tag)

  expect_is(tag, "shiny.tag")
  expect_is(deps, "list")
  expect_true(length(deps) > 0)
})

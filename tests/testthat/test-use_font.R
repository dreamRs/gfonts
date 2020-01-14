test_that("use_font works", {

  tag <- use_font(id = "roboto", css_path = system.file("assets/css/roboto.css", package = "gfonts"))
  deps <- htmltools::findDependencies(tag)

  expect_is(tag, "shiny.tag")
  expect_is(deps, "list")
  expect_true(length(deps) > 0)
})


test_that("use_font errors", {

  expect_error(use_font(id = "roboto", css_path = system.file("assets/include-fonts.R", package = "gfonts")))

  expect_error(use_font(id = "do_not_exist", css_path = system.file("assets/css/roboto.css", package = "gfonts")))

})

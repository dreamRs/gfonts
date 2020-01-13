test_that("tag_example works", {

  tag <- tag_example(class = "myclass")
  expect_is(tag, "shiny.tag")
  expect_identical(tag$attribs$class, "myclass")
})

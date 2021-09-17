test_that("setup_font works", {
  # vcr::use_cassette("setup_font", {
  testthat::skip_if_offline()
  testthat::skip_if_not(is_service_ok())

  tmp <- tempfile()
  dir.create(tmp)

  invisible(capture.output(setup_font(
    id = "roboto",
    output_dir = tmp,
    variants = "regular"
  )))

  expect_length(list.files(tmp), 2)
  expect_identical(list.files(tmp), c("css", "fonts"))
  expect_identical(list.files(file.path(tmp, "css")), "roboto.css")
  expect_true(all(grepl(pattern = "regular", x = list.files(file.path(tmp, "fonts")))))

  unlink(x = tmp, recursive = TRUE)
  # })testthat::skip_if_offline()
})

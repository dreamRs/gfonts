test_that("get_all_fonts works", {
  vcr::use_cassette("get_all_fonts", {
    allfonts <- get_all_fonts()

    expect_is(allfonts, "data.frame")
    expect_true(nrow(allfonts) > 1)
    expect_false(is.null(allfonts$id))
  })
})


test_that("get_font_info works", {
  vcr::use_cassette("get_font_info_roboto", {
    roboto <- get_font_info("roboto")

    expect_is(roboto, "list")
    expect_true(length(roboto) > 1)
    expect_false(is.null(roboto$id))
  })

  vcr::use_cassette("get_font_info_montserrat", {
    montserrat <- get_font_info("montserrat")

    expect_is(montserrat, "list")
    expect_true(length(montserrat) > 1)
    expect_false(is.null(montserrat$id))
  })
})



test_that("download_font works", {
  # vcr::use_cassette("download_font", {
  testthat::skip_if_offline()
  testthat::skip_if_not(is_service_ok())

  tmp <- tempfile()
  dir.create(tmp)

  download_font(
    id = "roboto",
    output_dir = tmp,
    variants = "regular"
  )

  expect_true(length(list.files(tmp)) > 1)

  unlink(x = tmp, recursive = TRUE)
  # })
})


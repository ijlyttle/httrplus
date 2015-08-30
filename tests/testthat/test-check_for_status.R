context("check_for_status")

library("httr")

# adapted from hadley/httr
test_that("status converted to errors", {

  s200 <- GET("http://httpbin.org/status/200")
  s300 <- GET("http://httpbin.org/status/300")
  s404 <- GET("http://httpbin.org/status/404")
  s500 <- GET("http://httpbin.org/status/500")

  expect_equal(check_for_status(s200), TRUE)
  expect_error(check_for_status(s300), c("redirection.*\\(300\\)"))
  expect_error(check_for_status(s404), c("client.*\\(404\\)"))
  expect_error(check_for_status(s500), c("server.*\\(500\\)"))

  expect_warning(
    check_for_status(s300, type = "warning"),
    c("redirection.*\\(300\\)")
  )
})

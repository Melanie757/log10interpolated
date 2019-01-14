context("Log 10")

test_that("values in the dataset are exact", {
  expect_equal(log10int(89.74), log10(89.74))
})

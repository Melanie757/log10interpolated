context("Log 10")

test_that("values in the dataset are exact", {
  expect_equal(log10int(89.74), log10(89.74))
  expect_equal(log10int(1.01), log10(1.01), tolerance=1e-5)
})

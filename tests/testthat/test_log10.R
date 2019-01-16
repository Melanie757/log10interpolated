context("Log 10")

test_that("values in the dataset are exact", {
  expect_equal(log10int(89.74), log10(89.74))
  expect_equal(log10int(1.01), log10(1.01), tolerance=1e-5)
  expect_is(log10data,'data.frame')
  expect_is(log10data$k, 'numeric')
  expect_is(log10data$logk, 'numeric')
  expect_is(log10data$example, 'numeric')
  expect_lt(mean(abs(log10int(log10data$example)-log10(log10data$example))), 3e-6)
})

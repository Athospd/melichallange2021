test_that("test_data works", {
  test_data_ <- test_data()

  expect_equal(dim(test_data_), c(551472, 2))
})

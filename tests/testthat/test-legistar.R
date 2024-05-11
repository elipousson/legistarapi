test_that("legistar works", {
  expect_s3_class(
    legistar(client = "baltimore", top = 10),
    "data.frame"
  )
})

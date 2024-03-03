test_that("multiplication works", {
  expect_s3_class(
    legistar(client = "baltimore", top = 10),
    "data.frame"
  )
})

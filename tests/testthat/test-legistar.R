test_that("legistar works", {
  legistar_body <- legistar(client = "baltimore", top = 10)
  expect_s3_class(legistar_body, "data.frame")
  expect_identical(nrow(legistar_body), 10)
})

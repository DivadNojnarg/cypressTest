box::use(
  shiny[testServer],
  testthat[...],
)
box::use(
  app/main[...],
)

test_that("main server works", {
  testServer(server, {
    session$setInputs(variable = "gear")
    tmp <- output$data
    expect_equal(grep("gear", tmp), 1)
  })
})

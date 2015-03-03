library(rmarc)

test_that("missing input file causes error", {
    expect_error(expect_warning(read.marc(file = "missing.dat")))
})

test_that("empty file causes warning", {
    expect_warning(read.marc(file = "../data/empty.dat"))
})

# Fails on broken record

# Reads single record

# Reads multiple records
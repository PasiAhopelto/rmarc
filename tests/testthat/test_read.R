library(testthat)

test_that("missing input file causes error", {
    expect_error(expect_warning(read.marc(file = "missing.dat")))
})

test_that("empty file causes warning", {
    expect_warning(read.marc(file = "tests/data/empty.dat"))
})

test_that("corrupted input file causes error", {
    expect_error(read.marc(file = "tests/data/corrupted.dat"))
})

test_that("gives descriptive names to fields", {
    record <- read.marc(file = "tests/data/record.dat")
    expect_equal(colnames(record), c('record.number', 'field.number', 'field', 'first.indicator', 'second.indicator', 'subfield', 'value'))
})

test_that("control number: 001 = 3073077", {
    record <- read.marc(file = "tests/data/record.dat")
    expect_equal(record[record$record.number == 1, 'value'], '3073077')
})

# test_that("reads single record", {
#     expect_error(expect_warning(read.marc(file = "../data/corrupted.dat")))
#     ADD DATA FIXTURE
#     CHECK THAT READ DATA EQUALS FIXTURE
# )}

# test_that("reads two records", {
#     expect_error(expect_warning(read.marc(file = "../data/corrupted.dat")))
#     ADD DATA FIXTURE
#     CHECK THAT READ DATA EQUALS FIXTURE
# )}

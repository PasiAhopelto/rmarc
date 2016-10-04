library(testthat)

test_that("missing input file causes error", {
    expect_error(expect_warning(read.marc("missing.dat")))
})

test_that("empty file causes warning", {
    expect_warning(read.marcRecord("tests/data/empty.dat"))
})

test_that("corrupted input file causes error", {
    expect_error(read.marcRecord("tests/data/corrupted.dat"))
})

test_that("gives descriptive names to fields", {
    record <- read.marc("tests/data/record.dat")
    expect_equal(colnames(record), c('record.number', 'field.number', 'field', 'first.indicator', 'second.indicator', 'subfield', 'value'))
})

test_that("control number: 001 = 3073077", {
    record <- read.marcRecord(file = "tests/data/record.dat")
    expect_equal(record[record$record.number == 1, 'value'], '3073077')
})

# test_that("reads single record", {
#     expect_error(expect_warning(read.marc(file = "../data/record.dat")))
#     ADD DATA FIXTURE
#     CHECK THAT READ DATA EQUALS FIXTURE
#     CHECK THAT record.number = 1 for all rows
# )}

# test_that("reads two records", {
#     expect_error(expect_warning(read.marc(file = "../data/two_records.dat")))
#     ADD DATA FIXTURE
#     CHECK THAT READ DATA EQUALS FIXTURE
#     CHECK THAT record.number = 1 for first record
#     CHECK THAT record.number = 1 for second record
# )}

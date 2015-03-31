library(rmarc)

test_that("missing input file causes error", {
    expect_error(expect_warning(read.marc(file = "missing.dat")))
})

test_that("empty file causes warning", {
    expect_warning(read.marc(file = "../data/empty.dat"))
})

test_that("corrupted input file causes error", {
    expect_error(read.marc(file = "../data/corrupted.dat"))
})

test_that("gives descriptive names to fields", {
    record <- read.marc(file = "../data/record.dat")
    expect_equal(colnames(record), c('record.number', 'field.number', 'field', 'first.indicator', 'second.indicator', 'subfield', 'value'))
})

# 1b data frame with absolute sequence number
#
# REC#  FIELD   FIELD#      I1  I2      SUB     VALUE
# 1     650       8         _   0       a       Shipbuilding
# 1     650       8         _   0       z       Netherlands
# 1     650       8         _   0       x       History.
# 1     650       9         _   0       a       Navigation
# 1     650       9         _   0       z       Europe
# 1     650       9         _   0       x       History.

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

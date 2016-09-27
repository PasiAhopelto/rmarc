read.marc <- function(file) {
    input <- file(file, 'rb')
    leader <- readBin(input, 'raw', n=24)   # TODO check endianness
    close(input)
    if(length(leader) == 0) {
        warning(paste("Input file", file, "is empty"))
    }
    else {
        if(read.parseMarcFileSize(leader) == file.size(file)) {
            result <- data.frame(record.number = integer(0), field.number = integer(0), field = character(0),   first.indicator = character(0), second.indicator = character(0), subfield = character(0), value = character(0))
        }
        else {
            stop(paste("Input file", file, " contains corrupted data")) 
        }
    }
}

# Directory starts from 25 and continues with 12 character entries until 1E

read.parseMarcFileSize <- function(leader) {
    size <- as.integer(intToUtf8(leader[1:5]))
}

source('tests/testthat/test_read.R')  # TODO make proper
read.marc <- function(filename) {
    input <- file(filename, 'rb')
    leader <- readBin(input, 'raw', 24)
    recordLength <- read.parseMarcFileSize(leader)
    recordWithoutLeader <- readBin(input, 'raw', recordLength - 24)
    directory <- read.parseDirectory(recordWithoutLeader)
    print(directory)
    # TODO read directory
    # TODO read fields
    close(input)
    NA
}

read.parseDirectory <- function(recordWithoutLeader) {
    directory <- data.frame(tag = character(0), length = integer(0), position = integer(0))
    entryStartPosition <- 1
    while(entryStartPosition < length(recordWithoutLeader) && rawToChar(recordWithoutLeader[entryStartPosition]) != '\x1e') {
        fieldTag <- rawToChar(recordWithoutLeader[entryStartPosition:(entryStartPosition+2)])
        fieldLength <- rawToChar(recordWithoutLeader[(entryStartPosition+3):(entryStartPosition+6)])
        fieldPosition <- rawToChar(recordWithoutLeader[(entryStartPosition+7):(entryStartPosition+11)])
        entryStartPosition <- entryStartPosition + 12
        directory <- rbind(directory, data.frame(fieldTag, fieldLength, fieldPosition))
    }
    directory
}

read.parseMarcFileSize <- function(leader) {
    size <- as.integer(intToUtf8(leader[1:5]))
}

source('tests/testthat/test_read.R')  # TODO make proper
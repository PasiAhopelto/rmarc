read.marc <- function(file) {
    input <- file(file, 'rb')
    leader <- readBin(input, 'raw', n=24)   # TODO check endianness
    close(input)
    if(length(leader) == 0) {
        warning(paste("Input file", file, "is empty"))
    }
    else {
        if(intToUtf8(leader[1]) == '0') {
            result <- data.frame(record.number = integer(0), field.number = integer(0), field = character(0),   first.indicator = character(0), second.indicator = character(0), subfield = character(0), value = character(0))
        }
        else {
            stop(paste("Input file", file, " contains corrupted data")) 
        }
    }
}
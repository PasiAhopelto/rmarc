read.marc <- function(file) {
    input <- file(file, 'rb')
    data <- readBin(input, 'raw', n=1)
    close(input)
    if(length(data) == 0) {
        warning(paste("Input file", file, "is empty"))
    }
    else {
        stop(paste("Input file", file, " contains corrupted data")) 
    }
}
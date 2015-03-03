read.marc <- function(file) {
    input <- file(file, 'rb')
    data <- readBin(input, 'raw', n=1)
    if(length(data) == 0) {
        warning(paste("Input file", file, "is empty"))
    }
    close(input)   
}
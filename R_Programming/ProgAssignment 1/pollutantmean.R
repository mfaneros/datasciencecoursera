pollutantmean <- function (directory, pollutant, id = 1:332) {
    df <- data.frame()
    fileNames <- list.files(directory)
    for (i in 1:length(id)) {
        path.temp <- paste(".", directory, fileNames[id[i]], sep="/")
        df <- rbind(df, data.frame(read.csv(path.temp), append=TRUE))
    }
    mean(df[,pollutant],na.rm=TRUE)
}

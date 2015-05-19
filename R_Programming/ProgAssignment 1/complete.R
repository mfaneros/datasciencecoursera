complete <- function (directory, id = 1:332) {
    s.obs <- NULL
    fileNames <- list.files(directory)
    for (i in 1:length(id)) {
        path.temp <- paste(".", directory, fileNames[id[i]], sep="/")
        data.temp <- data.frame(read.csv(path.temp))
        s.obs[i] <- sum(complete.cases(data.temp))
    }
    df <- data.frame(cbind(id, nobs=s.obs))
    return(df)
}
